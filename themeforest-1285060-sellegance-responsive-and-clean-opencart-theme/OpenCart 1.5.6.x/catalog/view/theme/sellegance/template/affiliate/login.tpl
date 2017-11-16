<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	<header class="page-header">
		
		<h1><?php echo $heading_title; ?></h1>

		<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
		<?php } ?>
		<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

	</header>

	<section id="maincontent">

		<div class="mainborder">

			<div class="cart-inner">

				<div>
					<?php echo $text_description; ?>
				</div>

				<div class="row">

					<div class="col-sm-6 register">
						
						<div class="contentset center">
							<h4 class="inner">
								<span><?php echo $text_new_affiliate; ?></span>
							</h4>
						</div>

						<?php echo $text_register_account; ?>

						<div class="form-actions buttons">
							<a href="<?php echo $register; ?>" class="button btn btn-default btn-inverse"><?php echo $button_continue; ?></a>
						</div>

					</div>

					<div class="col-sm-6 login">

						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login" class="form">

							<div class="contentset center">
								<?php echo $text_returning_affiliate; ?>
							</div>

							<p><?php echo $text_i_am_returning_affiliate; ?></p>

							<div class="form-group">
								<label for="email"><b><?php echo $entry_email; ?></b></label>
								<input type="email" name="email" id="email" class="form-control required" required />
							</div>

							<div class="form-group">
								<label for="password"><b><?php echo $entry_password; ?></b></label>
								<input type="password" name="password" id="password" class="form-control required" required />
							</div>

							<div class="form-actions buttons">
								<input type="submit" value="<?php echo $button_login; ?>" class="button btn btn-default btn-inverse" />
								<span class="forgotten"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></span>
							</div>

							<?php if ($redirect) { ?>
								<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
							<?php } ?>

						</form>

					</div>

				</div>

			</div>

		</div>

	</section><!-- #maincontent -->

	<?php echo $content_bottom; ?>

	<script type="text/javascript">

		$('#login input').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#login').submit();
			}
		});

	</script>

<?php echo $footer; ?>