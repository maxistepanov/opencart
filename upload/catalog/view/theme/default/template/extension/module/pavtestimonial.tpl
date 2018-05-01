	<div class="panel-testimonial">
		<div class="panel-headings"><h3 class="panel-title panel-v1"><?php echo $text_testimonial_title; ?></h3></div>
		<?php $columns_count=1; ?>
		<?php if( count($testimonials) ) { ?>
		<?php $id = rand(1,10)+rand();?>
	    <div id="pavtestimonial<?php echo $id;?>" class="carousel slide pavtestimonial <?php echo $class; ?>">
			<div class="panel-body padding-0 owl-carousel-play"  data-ride="owlcarousel">
				<div class="owl-carousel"  data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
				<?php $pages = array_chunk( $testimonials, $cols); $span = 12/$cols; ?>
				<?php foreach ($pages as  $k => $testimonials ) { ?>
					<div class="item <?php if($i==0) {?>active<?php } ?>">
					 	<?php foreach ($testimonials as $i => $testimonial) {  ?>
							<?php if( $i++%$cols == 0 ) { ?>
							<div class="row">
							<?php } ?>
							<div class="col-md-<?php echo $span;?> col-sm-12 col-xs-12 column">
				 				<div class="testimonial-item clearfix">
				 					<div class="t-avatar">
										<img  alt="<?php echo strip_tags($testimonial['profile']); ?>" src="<?php echo $testimonial['thumb']; ?>" class="img-circle"/>
									</div>
				 					<div class="testimonial-info clearfix">
										<?php if(  $testimonial['profile'] ) { ?>
											<div class="profile text-center">
												<?php echo $testimonial['profile']; ?>
											</div>
										<?php } ?>
										<?php if(  $testimonial['description'] ) { ?>
											<div class="testimonial-author">
												<?php echo $testimonial['description']; ?>
											</div>
										<?php } ?>
				 					</div>
								</div>
							</div>
							<?php if( $i%$cols == 0 || $i==count($testimonials) ) { ?>
							</div>
							<?php } ?>
						<?php } ?>
					</div>
				<?php } ?>
			</div>
		 	
			<?php if( count($testimonials) > 1 ){ ?>
			<div class="carousel-controls-v3">	
				<a class="carousel-control left" href="#pavtestimonial<?php echo $id;?>" data-slide="prev"><i class="fa fa-angle-left"></i></a>
				<a class="carousel-control right" href="#pavtestimonial<?php echo $id;?>" data-slide="next"><i class="fa fa-angle-right"></i></a>
			</div>
			<?php } ?>
	    	</div>
	    </div>
    </div>
	<?php if( count($testimonials) > 1 ){ ?>
	<script type="text/javascript">
	<!--
		$('#pavtestimonial<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
	-->
	</script>
	<?php } ?>
<?php } ?>