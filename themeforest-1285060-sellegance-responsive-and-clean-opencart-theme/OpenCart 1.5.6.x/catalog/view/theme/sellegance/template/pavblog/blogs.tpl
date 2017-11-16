<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>

	<header class="page-header">
		<h1 class="blogs-header"><?php echo $heading_title; ?>
		<small><a class="rss-wrapper" href="<?php echo $latest_rss;?>"><i class="fa fa-rss-square"></i></a></small>
		</h1>
	</header>

	<?php 
	
	if ($column_left && $column_right) { 
		$main = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$main = "col-sm-9"; 
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	} 
	else { $main = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left ?>
		
		<section id="maincontent" class="<?php echo $main; ?> information-page" role="main">

			<div class="mainborder">

				<?php if ($column_left || $column_right) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

			<div class="pav-filter-blogs">

					<div class="pav-blogs">
						<?php
						$cols = $config->get('cat_columns_leading_blogs');
						if( count($leading_blogs) ) { ?>
							<div class="leading-blogs clearfix">
								<?php foreach( $leading_blogs as $key => $blog ) { $key = $key + 1;?>
								<div class="pavcol<?php echo $cols;?>">
								<?php require( '_item.tpl' ); ?>
								</div>
								<?php if( ( $key%$cols==0 || $cols == count($leading_blogs)) ){ ?>
									<div class="clearfix"></div>
								<?php } ?>
								<?php } ?>
							</div>
						<?php } ?>

						<?php
							$cols = $config->get('cat_columns_secondary_blogs');
							$cols = !empty($cols)?$cols:1;
							if ( count($secondary_blogs) ) { ?>
							<div class="secondary clearfix">
								
								<?php foreach( $secondary_blogs as $key => $blog ) {  $key = $key+1; ?>
								<div class="pavcol<?php echo $cols;?>">
								<?php require( '_item.tpl' ); ?>
								</div>
								<?php if( ( $key%$cols==0 || $cols == count($leading_blogs)) ){ ?>
									<div class="clearfix"></div>
								<?php } ?>
								<?php } ?>
							</div>
						<?php } ?>
							
						<div class="pav-pagination pagination"><?php echo $pagination;?></div>
					</div>
			  </div>

		</div>

		</section> <!-- #maincontent -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>