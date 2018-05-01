<?php
    $id = rand(1,10)+rand();
    $cols = 3;
    $itemsperpage = 3;
    $span = 12/$cols;
    $columns_count  = 1;
?>
<div class="panel panel-default testimonial no-space-row">
    <!-- <div class="panel-heading">
        <h3 class="panel-title"><?php //echo $objlang->get("text_testimonial_title");?></h3>
    </div> -->
    <div class="owl-carousel-play" id="pavtestimonial<?php echo $id;?>" data-ride="owlcarousel">
        <?php if( count($testimonials) > $itemsperpage ) { ?>
        <div class="carousel-controls">
            <a class="carousel-control left" href="#pavtestimonial<?php echo $id;?>" data-slide="prev"><i class="zmdi zmdi-chevron-left"></i></a>
            <a class="carousel-control right" href="#pavtestimonial<?php echo $id;?>" data-slide="next"><i class="zmdi zmdi-chevron-right"></i></a>
        </div>
        <?php } ?>
        <div class="owl-carousel" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
        <?php $pages = array_chunk( $testimonials, $itemsperpage); ?>
        <?php $j=""; foreach ($pages as  $k => $temp ) {   ?>
            <div class="item <?php if($k==0) {?>active<?php } ?>">
            <?php foreach( $temp as $i => $testimonial ) {  $i++;?>
                <?php if( $i%$cols == 1 || $cols == 1) { ?>
                <div class="row">
                <?php } ?>
                    <div class="column">
                        <a  href="#testimonial-<?php echo $i."-".$k;?>" data-toggle="tab">
                            <img alt="<?php echo strip_tags($testimonial['profile']); ?>" src="<?php echo $testimonial['thumb']; ?>" />
                        </a>
                    </div>
                <?php if( $i%$cols == 0 || $i==count($temp) ) { ?>
                </div>
                <?php } ?>
            <?php } ?>


            <div class="tab-content">
                <?php foreach( $temp as $i => $testimonial ) { $i++; $active = ($i == 1)?'active':'';?>
                <div class="tab-pane products-rows slide <?php echo $active; ?>" id="testimonial-<?php echo $i."-".$k;?>">
                <?php if(  $testimonial['description'] ) { ?>
                    <div class="description">
                        <?php echo utf8_substr( $testimonial['description'],0, 100 ); ?>
                    </div>
                <?php } ?>
                <?php if(  $testimonial['profile'] ) { ?>
                    <div class="profile">
                        <?php echo $testimonial['profile']; ?>
                    </div>
                <?php } ?>
                </div>
                <?php } ?>
            </div>

            </div>
        <?php } ?>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#pavtestimonial<?php echo $id;?>').carousel({interval:false,pause:'hover'});
</script>