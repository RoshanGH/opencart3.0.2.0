<div class="box category">
	<a class="btn btn-default visible-xs" role="button" data-toggle="collapse" href="#categories" aria-expanded="false" aria-controls="collapseCategories"><?php echo $heading_title; ?> <i class="fa fa-angle-right"></i></a>

	<div class="list-group collapse" id="categories">
	  <?php foreach ($categories as $category) { ?>
	  <?php if ($category['category_id'] == $category_id) { ?>
	  <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
	  <?php if ($category['children']) { ?>
	  <?php foreach ($category['children'] as $child) { ?>
	  <?php if ($child['category_id'] == $child_id) { ?>
	  <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
	  <?php } else { ?>
	  <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
	  <?php } ?>
	  <?php } ?>
	  <?php } ?>
	  <?php } else { ?>
	  <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
	  <?php } ?>
	  <?php } ?>
	</div>
</div>