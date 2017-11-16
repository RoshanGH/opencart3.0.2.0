<div class="box">

	<div class="contentset center">
		<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
	</div>

	<div class="box-content box-category">

		<ul>
			
			<?php foreach ($informations as $information) { ?>

			<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>

			<?php } ?>

			<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

			<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>

		</ul>
	</div>
</div>
