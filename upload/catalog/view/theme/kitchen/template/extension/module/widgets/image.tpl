<?php if ( isset($thumbnailurl) )  { ?>
<div class="panel widget-images <?php echo $addition_cls ?> <?php if( isset($stylecls)&&$stylecls ) { ?>box-<?php echo $stylecls;?><?php } ?>">
	<?php if( $show_title ) { ?>
	<div class="panel-heading widget-heading"><h3 class="panel-title"><?php echo $heading_title?></h3></div>
	<?php } ?>
	<div class="widget-inner img-adv clearfix">
		 <div class="image-item">
		 <a class=" effect-v10" href="<?php echo $link;?>" style="width: 100%; height: 100%;display:block;">
		 	<span class="<?php echo $addition_cls ?>">
		 	<img class="img-responsive" alt=" " src="<?php echo $thumbnailurl; ?>"/>
		 	</span>
	 	</a>
	 	<?php if( $ispopup ){ ?>
	 	<a href="<?php echo $imageurl; ?>" class="pts-popup fancybox" title="<?php echo $this->language->get('Large Image');?>"><span class="icon icon-expand"></span></a>
	 	<?php } ?>
		 </div>
	</div>
</div>
<?php } ?>