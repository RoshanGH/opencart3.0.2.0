<?php 
/*
* Twitter Timeline Module
* Developed for OpenCart 2.x
* Author Gedielson Peixoto - http://www.gepeixoto.com.br
* @03/2015
* Under GPL license.
*/
echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-twittertl" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-twittertl" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title"><span data-toggle="tooltip" title="<?php echo $help_title; ?>"><?php echo $entry_title; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="twittertl_title" value="<?php echo $twittertl_title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label for="input-widget-id" class="col-sm-2 control-label"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_widget_id); ?>"><?php echo $entry_widget_id; ?></span></label>
            <div class="col-sm-10">
              <input type="text" id="input-widget-id" name="twittertl_widget_id" value="<?php echo $twittertl_widget_id; ?>" placeholder="<?php echo $entry_widget_id; ?>" class="form-control">
              <?php if ($error_widget_id) { ?>
              <div class="text-danger"><?php echo $error_widget_id; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" id="input-width" name="twittertl_width" value="<?php echo $twittertl_width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" id="input-height" name="twittertl_height" value="<?php echo $twittertl_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_theme; ?></label>
            <div class="col-sm-10">
              <select name="twittertl_theme" class="form-control">
                <?php if ($twittertl_theme == 'light') { ?>
                <option value="light" selected="selected"><?php echo $text_light; ?></option>
                <option value="dark"><?php echo $text_dark; ?></option>
                <?php } else { ?>
                <option value="light"><?php echo $text_light; ?></option>
                <option value="dark" selected="selected"><?php echo $text_dark; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><span data-toggle="tooltip" title="<?php echo htmlspecialchars($help_limit); ?>"><?php echo $entry_limit; ?></span></label>
            <div class="col-sm-10">
              <input type="number" id="input-limit" name="twittertl_limit" value="<?php echo $twittertl_limit; ?>" placeholder="<?php echo $entry_limit; ?>" class="form-control" />
              <?php if ($error_limit) { ?>
              <div class="text-danger"><?php echo $error_limit; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_show_replies; ?></label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="twittertl_show_replies" value="true" <?php echo ($twittertl_show_replies == 'true' ? 'checked="checked" ' : ''); ?>/>
                <?php echo $text_yes; ?>
              </label>
              <label class="radio-inline">
                <input type="radio" name="twittertl_show_replies" value="false" <?php echo ($twittertl_show_replies == 'false' ? 'checked="checked" ' : ''); ?>/>
                <?php echo $text_no; ?>    
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-related-users"><span data-toggle="tooltip" title="<?php echo htmlspecialchars($help_related_users); ?>"><?php echo $entry_related_users; ?></span></label>
            <div class="col-sm-10">
              <input type="text" id="input-related-users" name="twittertl_related_users" value="<?php echo $twittertl_related_users; ?>" placeholder="<?php echo $entry_related_users; ?>" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="twittertl_status" class="form-control">
                <?php if ($twittertl_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>