<?php if ($comments) { ?>
	<?php foreach ($comments as $comment) { ?>
		<div class="blog_comment">
		 	<div class="col-sm-3"><b><?php echo $comment['name']; ?></b><div class="date_added small"><?php echo $comment['date_added']; ?></div></div>
		 	<div class="col-sm-9">
		 		<p><?php echo $comment['comment']; ?></p>
		 	</div>
		</div>
	<?php } ?>
	<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
	<div class="blog_comment">
		<div class="empty white">
			<div class="note-light"><?php echo $text_no_comment; ?></div>
		</div>
	</div>
<?php } ?>
