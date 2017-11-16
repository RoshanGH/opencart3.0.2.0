<?php

class ModelModuleAnylist extends Model {
	public function getProductsID($filter) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
		$data = array();
		$where = array();
		
		
		if (isset($filter['specials']) and (int)$filter['specials']>0) {
			$specials = $this->db->query("SELECT DISTINCT ps.product_id FROM " . DB_PREFIX . "product_special ps where ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) limit ".$filter['specials']);
			if ($specials->rows) {
			    $l = array();
				foreach($specials->rows as $r) 
                    $l[]=$r['product_id'];

   			    $where[] = " p.product_id in (".implode(",",$l).") ";
            }
		}
        
		if (isset($filter['products']) and $filter['products']) {
			$f = trim(implode(",",array_unique($filter['products'])));
			if ($f)
    			$where[] = " p.product_id in (".$f.")";
		}
		
		if (isset($filter['categories']) and $filter['categories']) {
			foreach($filter['categories'] as $cat) {
                if (is_numeric($cat))
                    $data[] = $cat;
                     
				$a = $this->getChild(array(),$cat);
				if (is_array($a))
					$data = array_merge($data,$a);
    
			}
			if (!is_array($data)) 
				$f = "null";
			else
				$f = trim(implode(",",array_unique($data)));
				
            if ($f)
    			$where[] = " exists(select pc.* from `".DB_PREFIX."product_to_category` pc where p.product_id=pc.product_id and category_id in (".$f."))";
		}


		$sql = "select p.product_id from `".DB_PREFIX."product` p INNER JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "') WHERE ";
		if ($where)
			$sql .= "(" . implode(" OR ",$where) . ") AND ";
			 
		$sql .= "p.status = '1' AND p.quantity > 0 AND p.date_available <= NOW()  ";	 
		
		$order = array();
	    if (isset($filter['sort']) and $filter['sort']!='') {
	    	$cols = $this->db->query("SELECT COLUMN_NAME FROM `information_schema`.`COLUMNS` WHERE TABLE_NAME='".DB_PREFIX."product' and TABLE_SCHEMA='".DB_DATABASE."' and COLUMN_NAME='".$filter['sort']."'");
	    	if ($cols) {
				if (isset($filter['order']) and trim(strtolower($filter['order']))=='desc') 
					$order[] = $filter['sort'] . " DESC";
				else
					$order[] = $filter['sort'];

			} else {
				die("AnyList: SORT FIELD ".$filter['sort']." not found in product table. Only fields in product table are allowed.");
			}
	    }
	    
	    $sql .= " ORDER BY sort_order";
	    
	    if ($order)
	    	$sql .= ",".implode(",",$order);	    
	    
	    
		if (isset($filter['latest']) and (int)$filter['latest']>0) {
			$sql .= " LIMIT " . $filter['latest'];
		} else {
	    	if ($filter['limit']) 
				$sql .= " LIMIT " . $filter['limit'];
		}
	    	
	 	$cache = md5($sql);
		if (!($data = $this->cache->get('anylistproduct.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache))) {
			$products = $this->db->query($sql);
			if ($products->rows) {
				foreach($products->rows as $r)
					$data[] = $r['product_id'];
			}
			$this->cache->set('anylistproduct.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache, $data);
		}
		return $data;
	}


	protected function getChild($data,$cat) {
		$tmp = array();
		$child = $this->db->query("select category_id from `".DB_PREFIX."category` where parent_id=$cat" . (($data) ? " and category_id not in (".implode(",",$data).")" : "") );
		if ($child->rows) {
    		foreach($child->rows as $r) {
    			$data[] = $r['category_id'];
    			if ($c = $this->getChild($data,$r['category_id'])) 
                    $tmp=array_merge($tmp,$c);
    		}
        } else {
            return false;
        }
		return array_merge($data,$tmp);
	}
	
}
?>