<?php

	$config = $sconfig;
?>
<?php if( !empty($blogs) ) { ?>
<div id="blog-carousel" class="widget-blogs  latest-posts panel panel-default <?php echo $addition_cls;?> <?php if ( isset($stylecls)&&$stylecls) { ?>box-<?php echo $stylecls; ?><?php } ?>">
	<?php if( $show_title ) { ?>
	<div class="panel-heading">
		<h3 class="panel-title"><?php echo $heading_title?></h3>
	</div>
	<?php } ?>
<div class="owl-carousel-play panel-body border-base" data-ride="owlcarousel">

	<div class="owl-carousel" data-show="1" data-pagination="false" data-navigation="true">

			<?php
				$pages = array_chunk( $blogs, $itemsperpage); $span = 12/$cols;
			?>

			<?php foreach ($pages as  $k => $tblogs ) { ?>
				<div class="row item <?php if($k==0) {?>active<?php } ?>">
					<?php foreach( $tblogs as $i => $blog ) {  $i=$i+1;?>

							<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php  echo ($cols > 2 && $cols % 2 == 0) ? $span * 2 : $span; ?> col-xs-12 product-col">
					  			<div class="latest-posts-body">
                                    <?php if( $blog['thumb']  )  { ?>
                                    <div class="latest-posts-image">
                                        <a href="<?php echo $blog['link'];?>">
                                            <img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
                                        </a>
                                    </div>
                                    <?php } ?>
                                    <div class="latest-posts-meta">
                                        <div class="posts-meta">
                                            <div class="created">
                                                <i class="text-primary zmdi zmdi-time zmdi-hc-fw"></i>
                                                <span class="day"><?php echo date("d",strtotime($blog['created']));?></span>
                                                <span class="month"><?php echo date("M",strtotime($blog['created']));?></span>
                                                <span class="year"><?php echo date("Y",strtotime($blog['created']));?></span>
                                                <span class="comment"><i class="text-primary zmdi zmdi-comment-outline zmdi-hc-fw"></i><?php echo $objlang->get("text_comment_count");?><?php echo $blog['comment_count'];?></span>
                                            </div>
                                            <a class="latest-posts-title" href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
                                            <div class="description">
                                                <?php $blog['description'] = strip_tags($blog['description']); ?>
                                                <?php echo utf8_substr( $blog['description'],0, 230);?>...
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- end latest-posts-body -->
							</div>

					<?php } //endforeach; ?>
				</div>
			<?php } ?>

	</div>

	<?php if( count($blogs) >= 3 ) { ?>
		<div class="carousel-controls">
			<a class="carousel-control left" href="#blog-carousel"   data-slide="prev"><i class="zmdi zmdi-chevron-left"></i></a>
			<a class="carousel-control right" href="#blog-carousel"  data-slide="next"><i class="zmdi zmdi-chevron-right"></i></a>
		</div>
	<?php } ?>

	</div>
</div>
<?php } ?>