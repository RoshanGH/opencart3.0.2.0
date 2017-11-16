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

	<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
	<?php } ?>
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
	<?php } ?>

	<div id="content">

		<div class="mainborder">

			<div class="cart-inner">

				<div>
					<?php echo $text_description; ?><br>
				</div>

				<div class="row">

					<div class="col-md-6 col-md-push-3 login">

						<form id="login" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							
							<div class="form-group">
								<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
								<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
							</div>
							
							<div class="form-group">
								<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
							</div>

							<div class="forgotten"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
							
							<div class="form-actions buttons">
								<input type="submit" value="<?php echo $button_login; ?>" class="btn btn-cart btn-block" />

								<div class="contentset center">
						  		<h4 class="inner"><span>or</span></h4>
						  	</div>

								<a class="btn btn-primary btn-block" href="<?php echo $register; ?>"><?php echo $text_new_affiliate; ?></a>

								<div class="register-notes"><?php echo $text_register_account; ?></div>

							</div>

							<?php if ($redirect) { ?>
							<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
							<?php } ?>
						</form>

					</div>

				</div>

			</div>

		</div>

	</div><!-- #content -->

	<?php echo $content_bottom; ?>

	<script type="text/javascript">

		$('#login input').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#login').submit();
			}
		});

	</script>

<?php echo $footer; ?>