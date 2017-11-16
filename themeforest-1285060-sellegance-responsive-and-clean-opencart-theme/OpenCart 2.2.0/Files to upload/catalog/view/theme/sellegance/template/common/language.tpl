<?php if (count($languages) > 1) { ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
  <div class="btn-group dropdown">
    <button class="btn btn-link btn-sm dropdown-toggle" data-toggle="dropdown">
    <?php echo $text_language; ?> <span class="caret"></span></button>
    <ul class="dropdown-menu dropdown-menu-right">
      <?php foreach ($languages as $language) { ?>
      <?php if ($language['code'] == $code) { ?>
        <li><span class="btn btn-block current"><?php echo $language['name']; ?></span></li>
      <?php } else { ?>
        <li><button class="btn btn-link btn-block language-select" type="button" name="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></button></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>

<?php } ?>
