<div class="blog-item">
<?php if( $config->get('cat_show_title') ) { ?>
	<div class="blog-header clearfix">
	<?php if( $config->get('cat_show_category') ) { ?>
		<span class="publishin">
			<a href="<?php echo $blog['category_link'];?>" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
		</span>
		<?php } ?>

		<h4 class="blog-title">
			<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
		</h4>

	<?php } ?>

	</div>
	<div class="blog-meta">

		<?php if( $config->get('cat_show_author') ) { ?>
		<span class="author"><?php echo $blog['author'];?></span>
		<?php } ?>

		<?php if( $config->get('cat_show_created') ) { ?>
			<span class="date">
				<span class="day"><?php echo date("d",strtotime($blog['created']));?></span>
				<span class="month"><?php echo date("M",strtotime($blog['created']));?></span> /
				<span class="year"><?php echo date("Y",strtotime($blog['created']));?></span>
			</span>
		<?php } ?>
		
		<?php if( $config->get('cat_show_hits') ) { ?>
		<span class="hits"><i class="fa fa-eye"></i> <?php echo $blog['hits'];?></span>
		<?php } ?>

		<?php if( $config->get('cat_show_comment_counter') ) { ?>
		<span class="comment_count"><i class="fa fa-comment-o"></i> <?php echo $blog['comment_count'];?></span>
		<?php } ?>

	</div>
	<div class="blog-body">
		<?php if( $blog['thumb'] && $config->get('cat_show_image') )  { ?>
		<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" align="left"/></a>
		<?php } ?>

		<?php if( $config->get('cat_show_description') ) {?>
		<div class="description">
			<?php echo $blog['description'];?>
		</div>
		<?php } ?>
		<?php if( $config->get('cat_show_readmore') ) { ?>
		<a href="<?php echo $blog['link'];?>" class="btn btn-link btn-xs readmore"><?php echo $this->language->get('text_readmore');?> <i class="fa fa-caret-right"></i></a>
		<?php } ?>
	</div>	
</div>