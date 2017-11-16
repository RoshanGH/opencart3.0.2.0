<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
            <ul class="nav nav-tabs" id="tabs">
                <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-fw fa-wrench"></i> <?php echo $tab_general; ?></a></li>
                <li><a href="#tab-css-style" data-toggle="tab"><i class="fa fa-fw fa-css3"></i> <?php echo $tab_additional; ?></a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-show-type"><?php echo $entry_show_type; ?></label>
                    <div class="col-sm-10">
                      <select name="live_options_show_type" id="input-show-type" class="form-control">
                        <?php if ($live_options_show_type) { ?>
                        <option value="0"><?php echo $text_total; ?></option>
                        <option value="1" selected="selected"><?php echo $text_added; ?></option>
                        <?php } else { ?>
                        <option value="0" selected="selected"><?php echo $text_total; ?></option>
                        <option value="1"><?php echo $text_added; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-show-options-type"><?php echo $entry_show_options_type; ?></label>
                    <div class="col-sm-10">
                      <select name="live_options_show_options_type" id="input-show-options-type" class="form-control">
                        <option value="0" <?php if ($live_options_show_options_type == 0) :?>selected="selected" <?php endif;?>><?php echo $text_total; ?></option>
                        <option value="1" <?php if ($live_options_show_options_type == 1) :?>selected="selected" <?php endif;?>><?php echo $text_added; ?></option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-use-cache"><span data-toggle="tooltip" title="<?php echo $help_use_cache; ?>"><?php echo $entry_use_cache; ?></span></label>
                    <div class="col-sm-10">
                      <select name="live_options_use_cache" id="input-use-cache" class="form-control">
                        <?php if ($live_options_use_cache) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-calculate-quantity"><span data-toggle="tooltip" title="<?php echo $help_calculate; ?>"><?php echo $entry_calculate_quantity; ?></span></label>
                    <div class="col-sm-10">
                      <select name="live_options_calculate_quantity" id="input-calculate-quantity" class="form-control">
                        <?php if ($live_options_calculate_quantity) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                    <div class="col-sm-10">
                      <select name="live_options_ajax_status" id="input-status" class="form-control">
                        <?php if ($live_options_ajax_status) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" id="tab-css-style">
                    <h4>
                    <div class="alert alert-info"><i class="fa fa-fw fa-exclamation-circle"></i> <?php echo $help_tab_css_desc; ?></div>
                    </h4>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-options-container"><span data-toggle="tooltip" title="<?php echo $help_options_container; ?>"><?php echo $entry_options_container; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="live_options_container" value="<?php echo $live_options_container; ?>" placeholder="<?php echo $entry_options_container; ?>" id="input-options-container" class="form-control" />
                          <?php if ($error_options_container) { ?>
                          <div class="text-danger"><?php echo $error_options_container; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-special-container"><span data-toggle="tooltip" title="<?php echo $help_special_container; ?>"><?php echo $entry_special_container; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="live_options_special_container" value="<?php echo $live_options_special_container; ?>" placeholder="<?php echo $entry_special_container; ?>" id="input-special-container" class="form-control" />
                          <?php if ($error_special_container) { ?>
                          <div class="text-danger"><?php echo $error_special_container; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-price-container"><span data-toggle="tooltip" title="<?php echo $help_price_container; ?>"><?php echo $entry_price_container; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="live_options_price_container" value="<?php echo $live_options_price_container; ?>" placeholder="<?php echo $entry_price_container; ?>" id="input-price-container" class="form-control" />
                          <?php if ($error_price_container) { ?>
                          <div class="text-danger"><?php echo $error_price_container; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-tax-container"><span data-toggle="tooltip" title="<?php echo $help_tax_container; ?>"><?php echo $entry_tax_container; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="live_options_tax_container" value="<?php echo $live_options_tax_container; ?>" placeholder="<?php echo $entry_tax_container; ?>" id="input-tax-container" class="form-control" />
                          <?php if ($error_tax_container) { ?>
                          <div class="text-danger"><?php echo $error_tax_container; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-points-container"><span data-toggle="tooltip" title="<?php echo $help_points_container; ?>"><?php echo $entry_points_container; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="live_options_points_container" value="<?php echo $live_options_points_container; ?>" placeholder="<?php echo $entry_points_container; ?>" id="input-points-container" class="form-control" />
                          <?php if ($error_points_container) { ?>
                          <div class="text-danger"><?php echo $error_points_container; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-reward-container"><span data-toggle="tooltip" title="<?php echo $help_reward_container; ?>"><?php echo $entry_reward_container; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="live_options_reward_container" value="<?php echo $live_options_reward_container; ?>" placeholder="<?php echo $entry_reward_container; ?>" id="input-reward-container" class="form-control" />
                          <?php if ($error_reward_container) { ?>
                          <div class="text-danger"><?php echo $error_reward_container; ?></div>
                          <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--

//--></script></div>
<?php echo $footer; ?>