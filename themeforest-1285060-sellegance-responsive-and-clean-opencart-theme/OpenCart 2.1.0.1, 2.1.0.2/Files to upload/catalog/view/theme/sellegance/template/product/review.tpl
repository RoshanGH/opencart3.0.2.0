<?php if ($reviews) { ?>

	<?php foreach ($reviews as $review) { ?>

	<article>
		<div class="review">
		<?php for ($i = 1; $i <= 5; $i++) { ?>
			<?php if ($review['rating'] < $i) { ?>
			<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
			<?php } else { ?>
			<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
			<?php } ?>
		<?php } ?>
		</div>
		<div><?php echo nl2br($review['text']); ?></div>
		<p><span class="author"><?php echo $review['author']; ?></span>
		<span class="review-date"><?php echo $review['date_added']; ?></span></p>
	</article>

	<?php } ?>

	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>

	<div class="empty white">
		<div class="note-light"><?php echo $text_no_reviews; ?></div>
	</div>

<?php } ?>