<?php $count=1;	?>
<style>
<?php foreach($sections as $section){ ?> 
	<?php if (!empty($section['bgcolor'])) { ?> 
		.rich_banner .rbanner<?php echo $mod_id; ?>-<?php echo $count; ?> .banner_inner { background: <?php echo $section['bgcolor']; ?>; border: 0; border-radius: 5px; }
		.rich_banner .rbanner<?php echo $mod_id; ?>-<?php echo $count; ?> .info_wrapper { color: #fff; }
	<?php } ?>
	<?php echo $section['css']; ?>
	<?php $count++; ?>
<?php } ?>
</style>

<?php if ($module_title){ ?>
<div class="contentset center <?php echo $title_visibility; ?>">
	<h4 class="inner"><span><?php echo $module_title; ?></span></h4>
</div>
<?php } ?>
<div id="adbanner<?php echo $mod_id; ?>" class="rich_banner">
	<?php $count=1;	?>
	<?php foreach($sections as $section){ ?>

	<?php 
	$largecol = ' col-md-'. 12/$columns;
	$smallcol = ($columns>1) ? ' col-sm-6' : ''; 

	$classes= 'rbanner'.$mod_id.'-'.$count.$largecol.$smallcol.' '.$section['visibility'];
	?>

	<?php if(!empty($section['url'])) { ?>
	<div class="banner <?php echo $classes; ?>">
		<a href="<?php echo $section['url']; ?>" class="<?php if(!empty($section['image'])) { ?>image<?php } ?> banner_inner">
			<?php if(!empty($section['image'])) { ?>
				<img class="zoom_image img-responsive" alt="" src="<?php echo $section['image']; ?>" />
			<?php } ?>
			<span class="info_wrapper">
				<?php echo $section['description']; ?>
			</span>
		</a>
	</div>
	<?php } else { ?>
	<div class="banner <?php echo $classes; ?>">
		<div class="<?php if(!empty($section['image'])) { ?>image<?php } ?> banner_inner">
			<?php if(!empty($section['image'])) { ?>
				<img class="zoom_image img-responsive" alt="" src="<?php echo $section['image']; ?>" />
			<?php } ?>
			<div class="info_wrapper">
				<?php echo $section['description']; ?>
			</div>
		</div>
	</div>
	<?php } ?>
	<?php $count++; ?>
	<?php } ?>
</div>