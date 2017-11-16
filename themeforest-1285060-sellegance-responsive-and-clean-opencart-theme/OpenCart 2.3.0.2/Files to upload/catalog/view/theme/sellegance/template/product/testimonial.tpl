<?php echo $header; ?>
<div class="centralbox">
		<div class="container">
			<div class="container-inner">

	<?php echo $content_top; ?>

	<header class="page-header">
		<h1><?php echo $heading_title; ?></h1>
	</header>

	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

	<?php 
	
	if ($column_left && $column_right) { 
		$class = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$class = "col-sm-9"; 
		if($column_left) $class.=" sideleft"; else $class.= " sideright";
	} 
	else { $class = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left ?>
		
		<div id="content" class="<?php echo $class; ?> testimonials-page" role="main">

			<div class="mainborder">
			
			
			<?php if ($testimonials) { ?>
		
			<?php foreach ($testimonials as $testimonial) { ?>
			
			<div class="testimonial_list">
				<span class="heading"><?php echo $testimonial['title']; ?></span>
				<div class="review"><?php echo $testimonial['description'] ; ?></div>

				<?php if ($testimonial['rating']) { ?>
				<div class="rating r<?php echo $testimonial['rating']; ?>">
					<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
				</div>
				<?php } ?>
				
				<div class="testimonial_author">
					<?php echo $testimonial['name']; ?>, 
					<span class="city"><?php echo $testimonial['city']; ?></span>
				</div>

				
			</div>
			<?php } ?>

			<?php if ( isset($pagination)) { ?>
				<div class="pagination"><?php echo $pagination;?></div>
				<div class="buttons">
					<a class="btn btn-primary" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><?php echo $write;?></a>
				</div>
			<?php }?>

			<?php if (isset($showall_url)) { ?>
				<div class="buttons">
					<a class="btn btn-default" href="<?php echo $showall_url;?>" title="<?php echo $showall;?>"><?php echo $showall;?></a>
					<a class="btn btn-primary" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><?php echo $write;?></a>
				</div>
			<?php }?>
		<?php } ?>
			
			</div>

		</div> <!-- #content -->
		
		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>

<?php echo $footer; ?>