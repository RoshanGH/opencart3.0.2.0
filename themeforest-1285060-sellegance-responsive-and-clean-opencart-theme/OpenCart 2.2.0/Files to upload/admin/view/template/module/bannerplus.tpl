<?php echo $header; ?><?php echo $column_left; ?>

<?php 
$layouts = array(
	'all'     => 'All',
	'desktop' => 'Desktop',
	'mobile'  => 'Mobiles'
);
?>

<div id="content">
 <div class="page-header">
  <div class="container-fluid">
    
  <div class="pull-right">
  <button type="submit" form="form-socials" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
  <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
  </div>
  
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
 <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
  </div>
  <div class="panel-body">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-socials" class="form-horizontal">
    <input type="hidden" name="save" id="save" value="0">
		<input type="hidden" name="mod_id" id="mod_id" value="<?php echo $mod_id; ?>">
      
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
        <div class="col-sm-10">
        <input name="name" id="input-name" class="form-control" value="<?php echo $name; ?>" />
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
        <div class="col-sm-10">
          <select name="status" id="input-status" class="form-control">
            <?php if ($status) { ?>
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
      <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
      <div class="col-sm-10">
      <?php foreach ($languages as $language) { ?>
      <div class="input-group">
			<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['language_id']; ?>" /></span>
     
      <input type="text" class="form-control" name="module_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($module_title[$language['language_id']]) ? $module_title[$language['language_id']] : ''; ?>" />   
		  </div>
		  <?php } ?>

				<br><div class="input-group">
					<span class="input-group-addon" style="background: transparent; border: 0;"><?php echo $entry_visibility; ?>:</span>
					<select name="title_visibility" class="form-control">
						<?php foreach ($layouts as $fv => $fc) { ?>
							<?php ($fv ==  $title_visibility) ? $current = 'selected' : $current=''; ?>
							<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option> 
						<?php } ?>
					</select>
				</div>

          </div>
          </div> <!-- form-group ends -->
          
       <div class="form-group">
            <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_columns; ?></label>
            <div class="col-sm-10">
              <select name="columns" id="input-status" class="form-control">
                <?php for ($i = 1; $i <= 4; $i++) { 
                    ($columns == $i) ? $currentpat = 'selected' : $currentpat = '';?>
                  <option value="<?php echo $i; ?>" <?php echo $currentpat; ?>><?php echo $i; ?> columns</option>'; 
                <?php } ?>
              </select>
            </div>
          </div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-template"><?php echo $entry_help; ?></label>
						<div class="col-sm-10">
							<div class="well"><?php echo $entry_help_content ?></div>
						</div>
					</div>

         <div class="row">
         <div class="col-sm-12">
         <table id="sections" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
								<td class="text-left" width="10%"><?php echo $entry_visibility; ?></td>
								<td class="text-left" width="15%"><?php echo $entry_background; ?></td>
								<td class="text-left" width="15%"><?php echo $entry_bgcolor; ?></td>
								<td class="text-left" width=""><?php echo $entry_content; ?></td>
								
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $section_row = 1; ?>
              <?php foreach ($sections as $section) { ?>
              <tr id="section-row<?php echo $section_row; ?>">
								<td>
									<select name="sections[<?php echo $section_row; ?>][visibility]" class="form-control">
										<?php foreach ($layouts as $fv => $fc) { ?>
											<?php ($fv ==  $section['visibility']) ? $current = 'selected' : $current=''; ?>
											<option value="<?php echo $fv; ?>" <?php echo $current; ?> ><?php echo $fc; ?></option> 
										<?php } ?>
									</select>
								</td>
                <td class="text-left">
                <a href="" id="thumb-image<?php echo $section_row; ?>" data-toggle="image" class="img-thumbnail">
                <img src="<?php echo isset($section['image']) ? $section['image'] : $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="sections[<?php echo $section_row; ?>][thumb_image]" value="<?php echo isset($section['thumb_image']) ? $section['thumb_image'] : ''; ?>" id="input-image<?php echo $section_row; ?>" />
                </td>
                
								<td>
									<input type="text" name="sections[<?php echo $section_row; ?>][bgcolor]" value="<?php echo isset($section['bgcolor']) ? $section['bgcolor'] : ''; ?>" size="6" class="form-control color {required:false,hash:true}"  />
								</td>
                
                <td class="text-left">
                <?php foreach ($languages as $language) { ?>

									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_url; ?></label>
										<div class="col-sm-10">
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['language_id']; ?>" /></span>
											<input type="text" name="sections[<?php echo $section_row; ?>][url][<?php echo $language['language_id']; ?>]" value="<?php echo isset($section['url'][$language['language_id']]) ? $section['url'][$language['language_id']] : ''; ?>" class="form-control" />
											</div><br>
										</div>

										<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
										<div class="col-sm-10">
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['language_id']; ?>" /></span>		
                <textarea class="form-control" rows="6" name="sections[<?php echo $section_row; ?>][block][<?php echo $language['language_id']; ?>]" id="description-<?php echo $section_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($section['block'][$language['language_id']]) ? $section['block'][$language['language_id']] : ''; ?></textarea>
                </div>
										</div>
									</div>
                <?php } ?>

								<a class="btn btn-default" role="button" data-toggle="collapse" href="#css_row<?php echo $section_row;?>" aria-expanded="false" aria-controls="css_row<?php echo $section_row;?>">
								  Custom CSS
								</a>
								<div class="collapse" id="css_row<?php echo $section_row;?>">

								    <div class="form-group">
								    	<label class="col-sm-2 control-label"><?php echo $entry_css; ?></label>
								    	<div class="col-sm-10">
								    		<p>Start each definition with <b>.rbanner<?php echo $mod_id; ?>-<?php echo $section_row; ?></b> <br> <small>Example: <code>.rbanner<?php echo $mod_id; ?>-<?php echo $section_row; ?> h4 { color: red; }</code></small></p>
								    		<textarea class="form-control" rows="6" name="sections[<?php echo $section_row; ?>][css]"><?php echo isset($section['css']) ? $section['css'] : ''; ?></textarea>
								    	</div>
								    </div>

								</div>

                </td>
                <td class="text-right">
                <button type="button" onclick="$('#section-row<?php echo $section_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                </td>
              </tr>
              <?php $section_row++; ?>
			       <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="3"></td>
                <td class="text-right"><button type="button" onclick="addRow();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
         </div>
         </div>
     </form>
   </div>
  </div>
 </div>
</div>

<script type="text/javascript"><!--
var section_row = <?php echo $section_row; ?>;

function addRow() {
	html  = '<tr id="section-row' + section_row + '">';

	html += '<td class="text-left">';
	html += '<select id="sections[' + section_row + '][visibility]" name="sections[' + section_row + '][visibility]" class="form-control"><?php foreach ($layouts as $fv => $fc) { ?><option value="<?php echo $fv; ?>"><?php echo $fc; ?></option><?php } ?></select>';
	html += '  </td>';

	html += '<td class="text-left">';
	html += '<a href="" id="thumb-image' + section_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="sections[' + section_row + '][thumb_image]" value="" id="input-image' + section_row + '" />';
	html += '  </td>';
	html += '<td class="text-left">';
	html += '<input type="text" id="sections[' + section_row + '][bgcolor]" name="sections[' + section_row + '][bgcolor]" value="" size="6" class="form-control color {required:false,hash:true}" />';
	html += '  </td>';
	
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="form-group">';
	html += '  <label class="col-sm-2 control-label"><?php echo $entry_url; ?></label><div class="col-sm-10">';
	html += '  <div class="input-group">';
	html += '    <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '    <input type="text" name="sections[' + section_row + '][url][<?php echo $language['language_id']; ?>]" id="url-' + section_row + '-<?php echo $language['language_id']; ?>" value="" class="form-control">';
	html += '</div><br></div>';

	html += '<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>';
	html += '<div class="col-sm-10"><div class="input-group">';
	html += '    <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>';
	html += '<textarea name="sections[' + section_row + '][block][<?php echo $language['language_id']; ?>]" id="description-' + section_row + '-<?php echo $language['language_id']; ?>" class="form-control" rows="6"></textarea>';
	html += '</div></div></div>';
	<?php } ?>

	html += '<a class="btn btn-default" role="button" data-toggle="collapse" href="#css_row' + section_row + '" aria-expanded="false" aria-controls="css_row' + section_row + '">Custom CSS</a>';
	html += '<div class="collapse" id="css_row' + section_row + '">';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_css; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<p>Start each definition with <b>.rbanner<?php echo $mod_id; ?>-' + section_row + '</b> <br> <small>Example: <code>.rbanner<?php echo $mod_id; ?>-' + section_row + ' h4 { color: red; }</code></small></p>';
	html += '			<textarea class="form-control" rows="6" name="sections[' + section_row + '][css]"></textarea>';
	html += '		</div>';
	html += '	</div>';
	html += '</div>';

	html += '</td>';

	html += '  <td class="text-right"><button type="button" onclick="$(\'#section-row' + section_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#sections tbody').append(html);
	
	jscolor.init();
	
	section_row++;
}
//--></script>


<style>
.table thead > tr > td, .table tbody > tr > td {vertical-align:top;}
small {font-size:11px;font-weight:normal;}
</style>
<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script> 
<?php echo $footer; ?>