<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-latest" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
      
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-latest" class="form-horizontal">


          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
            </div>
          </div>
      
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                  <label>
                    <?php if (in_array(0, $anylist_stores)) { ?>
                    <input type="checkbox" name="anylist_stores[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="anylist_stores[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $anylist_stores)) { ?>
                    <input type="checkbox" name="anylist_stores[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="anylist_stores[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>

          <div class="form-group">
		    <?php foreach ($languages as $language) { ?>
            	<label class="col-sm-2 control-label" for="input-title-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name'] . " " . $entry_title; ?></label>
        		<div class="col-sm-10">
	           		<input class="form-control" type="text" id="input-title-<?php echo $language['language_id']; ?>" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo (isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''); ?>" />
           		</div>
    		<?php } ?>
          </div>


          <div class="form-group">
            <label class="col-sm-2 control-label" for="code"><?php echo $entry_code; ?></label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="code" name="code" value="<?php echo $code; ?>"/>
			</div>
		  </div>
		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="titlelink"><?php echo $entry_titlelink; ?></label>
            <div class="col-sm-10">
                <input class="form-control" type="text" name="titlelink" value="<?php echo $titlelink; ?>" />
			</div>
		  </div>


          <div class="form-group">
            	<label class="col-sm-2 control-label" for="category"><?php echo $entry_selection; ?></label>
            	<div class="col-sm-10">
		                <input class="form-control" type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="category" class="form-control" />
		                <div id="anylist-category" class="well well-sm" style="height: 150px; overflow: auto;">
			                <?php foreach($category_list as $c) { ?> 
								<div id="anylist-category_<?php echo $c['category_id']; ?>"><i style="cursor: pointer;" class="fa fa-minus-circle"></i><?php echo $c['name']; ?><input type="hidden" name="categories[]" value="<?php echo $c['category_id']; ?>" /></div>
			                <?php } ?>
		        		</div>
	
				
	                <input class="form-control" type="text" name="product" value="" placeholder="<?php echo $entry_products; ?>" id="product" class="form-control"/>
	                <div id="anylist-products" class="well well-sm" style="height: 150px; overflow: auto;">
		                <?php foreach($products_list as $p) { ?>
							<div id="anylist-products-product_<?php echo $p['product_id']; ?>"><i style="cursor: pointer;" class="fa fa-minus-circle"></i><?php echo $p['name']; ?><input type="hidden" name="products[]" value="<?php echo $p['product_id']; ?>" /></div>
						<?php } ?>
	         		</div>
	    		
	                <br/><label class="control-label" for="latest"><?php echo $entry_latest_text; ?></label>:<br/><input class="form-control" type="text" name="latest" id='latest 'value="<?php echo ($latest) ? $latest : '0'; ?>"/>
	                <br/><label class="control-label" for="spacials"><?php echo $entry_specials_text; ?></label>:<br/><input class="form-control" type="text" name="specials" value="<?php echo ($specials) ? $specials : '0'; ?>"/>
	                <br/><label class="control-label" for="sortfialed"><?php echo $entry_sort_order; ?></label><br />
                	<select class="form-control" name="sortfield"><option value="">[no sort]</option>
                		<?php foreach ($prodfields as $f) { ?> 
            	         	<option <?php echo ($sortfield==$f) ? 'selected="selected"' : ''; ?> value="<?php echo $f; ?>"><?php echo $f; ?></option>
                		<?php } ?>
            		</select>
			
				</div>
		  </div>
		  
		  
		  
		  
          <div class="form-group">
            	<label class="col-sm-2 control-label"><?php echo $entry_dimension; ?></label>
            	<div class="col-sm-10">
		     	    <input class="form-control" type="text" name="width" value="<?php echo (($width) ? $width : '80'); ?>" style="display: inline; width: 50px;" /> x <input class="form-control" type="text" name="height" value="<?php echo (($data) ? $height : '80'); ?>" style="display: inline; width: 50px;"/>
				</div>
		  </div>
		          
          <div class="form-group">
            	<label class="col-sm-2 control-label"><?php echo $entry_limit; ?></label>
            	<div class="col-sm-10">
        			<input class="form-control" type="text" name="limit" value="<?php echo (($limit) ? $limit : '8'); ?>" style="width: 50px;" />
       			</div>
		  </div>
		  



          <div class="form-group" id="limitmanufacturer_row">
            	<label class="col-sm-2 control-label"><?php echo $entry_manufacturer; ?></label>
            	<div class="col-sm-10">
            		<div class="help"><?php echo $entry_limit_help; ?></div>
            		<div class="form-control" style="height: 100px; background: #FFFFFF; overflow-y: scroll;">
      				<?php foreach ($all_manufacturers as $manufacturer) { ?> 
        				<div><input type="checkbox" class="manufacturers" id="limitmanufacturer" name="limitmanufacturer[]" value="<?php echo $manufacturer['manufacturer_id'] . ((array_search($manufacturer['manufacturer_id'],$limitmanufacturer)!==false) ? '" checked="checked"' : '"'); ?>/><?php echo addslashes($manufacturer['name']); ?></div>
        			<?php } ?>
        			</div>
	                <a href="#" class="selectall"><?php echo $text_select; ?></a> / <a href="#" class="unselectall"><?php echo $text_unselect; ?></a>
  				</div>
		  </div>
            	
          <div class="form-group" id="limitcategory_row">
            	<label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
            	<div class="col-sm-10">
            		<div class="help"><?php echo $entry_limit_help; ?></div>
        			<div class="form-control" style="height: 100px; background: #FFFFFF; overflow-y: scroll;">
            		<?php foreach ($all_categories as $category) { ?>
                		<div><input type="checkbox" class="categories" id="limitcategory" name="limitcategory[]" value="<?php echo $category['category_id'] . ((array_search($category['category_id'],$limitcategory)===false) ? '"' : '" checked="checked"'); ?> /><?php echo addslashes($category['name']); ?></div>
            		<?php } ?>
            		</div>
	                <a href="#" class="selectall"><?php echo $text_select; ?></a> / <a href="#" class="unselectall"><?php echo $text_unselect; ?></a>
  				</div>
		  </div>    


          <div class="form-group">
            	<label class="col-sm-2 control-label"><?php echo $text_period; ?></label>
        		<div class="col-sm-10">
        			<input style="width: 200px; display: inline;" class="form-control date" placeholder="Start date" type="text" value="<?php echo $date_start; ?>" name="date_start"/> - <input style="width: 200px; display: inline;" class="form-control date" placeholder="End date" type="text" value="<?php echo $date_end; ?>" name="date_end"/>
       			</div>
		  </div>	




          <div class="form-group">
            	<label class="col-sm-2 control-label" for="status"><?php echo $entry_status; ?></label>
        		<div class="col-sm-10">
	                <select class="form-control" name="status" id="status">
	                  <option <?php echo ($status) ? 'selected="selected"' : ''; ?> value="1"><?php echo $text_enabled; ?></option>
	                  <option <?php echo ($status) ? '' : 'selected="selected"'; ?> value="0"><?php echo $text_disabled; ?></option>
	                </select>
          		</div>
		  </div>    
        	



		</form>
</div>
</div>
</div>
</div>


<script type="text/javascript"><!--

$(document).ready(function() {

    $('#product').autocomplete({
    	'source': function(request, response) {
    		$.ajax({
    			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&limit=20&filter_name=' +  encodeURIComponent(request),
    			dataType: 'json',
    			success: function(json) {
    				response($.map(json, function(item) {return {label: item['name'],value: item['product_id']}}));
    			}
    		});
    	},
    	'select': function(item) {
    		$('#product').val('');
    		$('#anylist-products-product_' + item['value']).remove();
    		$('#anylist-products' ).append('<div id="anylist-products-product_' + item['value'] + '"><i style="cursor: pointer;" class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="products[]" value="' + item['value'] + '" /></div>');
           
    	}
    });


    $('#category').autocomplete({
    	'source': function(request, response) {
    		$.ajax({
    			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&limit=20&filter_name=' +  encodeURIComponent(request),
    			dataType: 'json',
    			success: function(json) {
    				response($.map(json, function(item) {return {label: item['name'],value: item['category_id']}}));
    			}
    		});
    	},
    	'select': function(item) {
    		$('#category').val('');
    		$('#anylist-category_' + item['value']).remove();
    		$('#anylist-category' ).append('<div id="anylist-category_' + item['value'] + '"><i style="cursor: pointer;" class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="categories[]" value="' + item['value'] + '" /></div>');
           
    	}
    });



    $('.date').datetimepicker({pickTime: false, dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
    	dateFormat: 'yy-mm-dd',
    	timeFormat: 'HH:mm'
    });



    $('#anylist-products').delegate('.fa-minus-circle', 'click', function() {$(this).parent().remove();});
    $('#anylist-category').delegate('.fa-minus-circle', 'click', function() {$(this).parent().remove();});

	$('.selectall').click( function(event) {
		event.stopPropagation();
		var chks = $(this).parent().find(':checkbox');
		chks.prop('checked', true);
		return false;
	});
	$('.unselectall').click( function(event) {
		event.stopPropagation();
		var chks = $(this).parent().find(':checkbox');
		chks.prop('checked', false); 
		return false;
	});

})

//--></script> 
<?php echo $footer; ?>