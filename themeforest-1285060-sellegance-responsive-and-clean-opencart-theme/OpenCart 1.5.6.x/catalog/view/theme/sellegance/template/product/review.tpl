<?php if ($reviews) { ?>

	<?php foreach ($reviews as $review) { ?>

	<article class="content">

		<b><?php echo $review['author']; ?></b>

		<img src="catalog/view/theme/sellegance/images/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />

		<div class="review-date"><?php echo $review['date_added']; ?></div>

		<?php echo $review['text']; ?>

	</article>

	<?php } ?>

	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>

	<div class="empty white">
		<div class="note-light"><?php echo $text_no_reviews; ?></div>
	</div>

<?php } ?>