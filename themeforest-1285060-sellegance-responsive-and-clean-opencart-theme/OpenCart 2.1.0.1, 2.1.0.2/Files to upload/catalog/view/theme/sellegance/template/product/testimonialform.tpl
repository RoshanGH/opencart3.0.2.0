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

    <?php 
    
    if ($column_left && $column_right) { 
      $class = "col-sm-6 middle sideleft"; }
    else if ($column_left || $column_right) { 
      $class = "col-sm-9"; 
      if($column_left) $class.=" sideleft"; else $class.= " sideright";
    } 
    else { $class = "col-sm-12"; } 

    ?>

    <div class="row">

        <?php echo $column_left ?>
        
        <div id="content" class="<?php echo $class; ?> testimonials-form" role="main">

            <div class="mainborder">
      
      <p><?php echo $text_conditions ?></p>
  
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="testimonial" class="form-horizontal">
        
    	<div class="form-group">
        <label class="col-sm-2 control-label" for="input-review"><?php echo $entry_title ?></label>
        <div class="col-sm-10">
          <input type="text" name="title" id="input-title" value="<?php echo $title; ?>" class="form-control" />
        </div>
	    </div>
        
      <div class="form-group required">
  	    <label class="col-sm-2 control-label" for="input-desc"><?php echo $entry_enquiry ?></label>
        <div class="col-sm-10">
        	<textarea name="description" rows="10" id="input-desc" class="form-control"><?php echo $description; ?></textarea>
        	<?php if ($error_enquiry) { ?>
            <span class="text-danger"><?php echo $error_enquiry; ?></span>
          <?php } ?>
        </div>
      </div>
        
      <div class="form-group ">
        <label class="col-sm-2 control-label"><?php echo $entry_rating; ?></label>
        <div class="col-sm-10">
          &nbsp;<small><?php echo $entry_bad; ?></small>&nbsp;
      		<input type="radio" name="rating" value="1" style="margin: 0;" <?php if ( $rating == 1 ) echo 'checked="checked"';?> />
      		&nbsp;
      		<input type="radio" name="rating" value="2" style="margin: 0;" <?php if ( $rating == 2 ) echo 'checked="checked"';?> />
      		&nbsp;
      		<input type="radio" name="rating" value="3" style="margin: 0;" <?php if ( $rating == 3 ) echo 'checked="checked"';?> />
      		&nbsp;
      		<input type="radio" name="rating" value="4" style="margin: 0;" <?php if ( $rating == 4 ) echo 'checked="checked"';?> />
      		&nbsp;
      		<input type="radio" name="rating" value="5" style="margin: 0;" <?php if ( $rating == 5 ) echo 'checked="checked"';?> />
      		&nbsp; <small><?php echo $entry_good; ?></small>
        </div>
	    </div>
    
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name ?></label>
        <div class="col-sm-10">
          <input type="text" name="name" id="input-name" value="<?php echo $name; ?>" class="form-control" />
	       </div>
	    </div>
        
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city ?></label>
        <div class="col-sm-10">
          <input type="text" name="city" id="input-city" value="<?php echo $city; ?>" class="form-control" />
        </div>
	    </div>
        
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email ?></label>
        <div class="col-sm-10">
          <input type="text" name="email" id="input-email" value="<?php echo $email; ?>" class="form-control" />
        </div>
	    </div>
        
      <?php echo $captcha; ?>
      
    	 <div class="buttons"><input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" /></div>
    </div>

    </form>

      </div>

        </div> <!-- #content -->
        
        <?php echo $column_right; ?>

    </div> <!-- .row -->

    <?php echo $content_bottom; ?>

<?php echo $footer; ?>