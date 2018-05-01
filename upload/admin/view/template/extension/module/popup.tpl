<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-form-newsletter-lightbox" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-newsletter-lightbox" class="form-horizontal">
        
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-merchant-id"><?php echo $newsletter_status; ?></label>
            <div class="col-sm-10">
              <select name="popup_status" class="form-control" id="input-popup_status" >
				<?php if ($popup_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-access-secret"><?php echo $newsletter_show; ?></label>
            <div class="col-sm-10">
			<?php if ($popup_show =='always') { ?>
				<label class="radio-inline">
					<input type="radio" name="popup_show" value="always" checked="checked" />
					<?php echo $text_always; ?>
				</label>
				<label class="radio-inline">
				  <input type="radio" name="popup_show" value="once" />
				  <?php echo $text_once; ?>    
				</label>
			<?php } else { ?>
				  <label class="radio-inline">
					  <input type="radio" name="popup_show" value="always" />
					  <?php echo $text_always; ?>
				  </label>
				  <label class="radio-inline">
					  <input type="radio" name="popup_show" value="once" checked="checked" />
					  <?php echo $text_once; ?>
				  </label>
				  <?php } ?>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $newsletter_time_after_show_popup; ?></label>
            <div class="col-sm-10">
              <input type="text" name="popup_time_after_show_popup" value="<?php echo $popup_time_after_show_popup; ?>" placeholder="<?php echo $popup_time_after_show_popup; ?>" id="input-popup_time_after_show_popup" class="form-control" />
            </div>
          </div>     
        </form>
      </div>
    </div>
  </div>
</div> 
<?php echo $footer; ?>