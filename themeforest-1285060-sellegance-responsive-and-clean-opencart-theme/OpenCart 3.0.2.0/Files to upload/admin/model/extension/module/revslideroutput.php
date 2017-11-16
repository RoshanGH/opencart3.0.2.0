<?php
require_once DIR_CONFIG . 'revslider/revslideropencart_loader.php';
require_once DIR_CONFIG . 'revslider/revslider_admin.php';
class ModelExtensionModulerevslideroutput extends Model
{
	public function getrevslideroutputs()
	{
		$results = sdsconfig::getrevslide();
		if(isset($results) && !empty($results))
			return $results;
		return false;
	}
}
?>
