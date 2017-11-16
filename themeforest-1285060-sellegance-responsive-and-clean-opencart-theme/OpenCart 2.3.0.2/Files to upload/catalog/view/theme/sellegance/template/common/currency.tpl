<?php if (count($currencies) > 1) { ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
  <div class="btn-group dropdown">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_left']; ?></strong>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_right']; ?></strong>
    <?php } ?>
    <?php } ?>
    <?php echo $text_currency; ?> <span class="caret"></span></button>
    <ul class="dropdown-menu dropdown-menu-right">
      <?php foreach ($currencies as $currency) { ?>
      
        <?php if ($currency['symbol_left']) {
          $currency_symbol= $currency['symbol_left']." ".$currency['title'];
        } else {
          $currency_symbol= $currency['symbol_right']." ".$currency['title'];
        } ?>
      
        <?php if ($currency['code'] == $code) { ?>
        <li><span class="btn btn-block current"><?php echo $currency_symbol; ?></span></li>
        <?php } else { ?>
        <li><button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency_symbol; ?></button></li>
        <?php } ?>

      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>

<?php } ?>
