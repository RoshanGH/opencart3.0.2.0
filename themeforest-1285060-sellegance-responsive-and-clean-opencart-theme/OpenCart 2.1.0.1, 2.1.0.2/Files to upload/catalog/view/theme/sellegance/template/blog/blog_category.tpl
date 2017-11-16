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

		<?php echo $column_left; ?>

		<div id="content" class="<?php echo $class; ?>">

			<?php echo $content_top; ?>
			
			<div class="blog blog_list mainborder">
		
				<div class="main_description">
				<?php echo $blog_category_description; ?>
				</div>

				<?php if($blogs){ ?>
				<div class="blog_grid_holder column-<?php echo $list_columns; ?>">

					<?php foreach ($blogs as $blog) { ?>
						<div class="blog_item">
							<h2 class="blog_title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h2>
							<div class="blog_stats">
								<?php if($date_added_status){ ?>
									<span><b class="hl"><?php echo date("M d",strtotime($blog['date_added_full'])); ?></b></span>
								<?php } ?>
								<?php if($author_status){ ?><span><b class="text"><?php echo $text_posted_by; ?></b> <b class="hl"><?php echo $blog['author']; ?></b></span><?php } ?>
								<?php if($page_view_status){ ?><span><b class="text"><?php echo $text_read; ?></b> <b class="hl"><?php echo $blog['count_read']; ?></b></span><?php } ?>
								<?php if($comments_count_status){ ?><span class="comment_count"><i class="fa fa-comments"></i> <b class="hl"><?php echo $blog['comment_total'];?></b></span><?php } ?>
							</div> <!-- blog-stats ends -->
							<?php if($blog['image']){ ?>
								<div class="image zoom_image_container">
									<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" class="img-responsive" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
								</div>
							<?php } ?>
								<div class="blog_summary">
									<p><?php echo $blog['short_description']; ?></p>
									<p><a href="<?php echo $blog['href']; ?>" class="btn btn-primary btn-sm"><?php echo $text_read_more; ?></a></p>
							</div> <!-- summary ends -->
						</div> <!-- item ends -->
					<?php } ?>
						
				</div>

			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $results; ?></div>
				<div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
			</div>

	<?php }else{ ?>
		
		<?php echo $text_no_results; ?>

	<?php } ?>
		
		</div>

			</div> <!-- #content -->
			
			<?php echo $column_right; ?>

		</div> <!-- .row -->

		<?php echo $content_bottom; ?>

<?php echo $footer; ?> 