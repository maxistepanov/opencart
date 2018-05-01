<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
    $listingConfig = array(
        'category_pzoom'        => 1,
        'quickview'             => 0,
        'show_swap_image'       => 0,
        'product_layout'        => 'default',
        'enable_paneltool'      => 0
    );
    $listingConfig = array_merge($listingConfig, $themeConfig );
    $categoryPzoom = $listingConfig['category_pzoom'];
    $quickview     = $listingConfig['quickview'];
    $swapimg       = $listingConfig['show_swap_image'];
    $categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0;

    $span = 12/$cols;

    $productLayout = DIR_TEMPLATE.$theme.'/template/common/product/deal_default.tpl';

    $button_cart = $objlang->get('button_cart');
    $button_wishlist = $objlang->get('button_wishlist');
    $button_compare = $objlang->get('button_compare');
    $id = rand(1,9)+rand();
    $text_sale = $objlang->get('text_sale');
    $text_days = $objlang->get('text_days');
    $text_hours = $objlang->get('text_hours');
    $text_minutes = $objlang->get('text_minutes');
    $text_seconds = $objlang->get('text_seconds');
    $columns_count  = 1;
?>

<div class="productdeals deals panel panel-default <?php echo $addition_cls; ?>">
  <?php if( $show_title ) { ?>
  <div class="panel-heading">
    <h3 class="panel-title"><?php echo $heading_title?></h3>
  </div>
  <?php } ?>
  <div class="widget-inner">
    <div class="box-products owl-carousel-play product-grid" id="pavdeals<?php echo $id;?>" data-ride="owlcarousel">
      <?php if( count($products) > $itemsperpage ) { ?>
        <div class="carousel-controls">
          <a class="carousel-control left" href="#pavdeals<?php echo $id;?>"   data-slide="prev">
            <i class="zmdi zmdi-chevron-left"></i>
          </a>
          <a class="carousel-control right" href="#pavdeals<?php echo $id;?>"  data-slide="next">
           <i class="zmdi zmdi-chevron-right"></i>
          </a>
        </div>

      <?php } ?>
      <div class="owl-carousel product-grid" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
       <?php
        $pages = array_chunk( $products, $itemsperpage);
       ?>

       <?php foreach ($pages as  $k => $tproducts ) {   ?>
          <div class="item <?php if($k==0) {?>active<?php } ?> products-block">
            <?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
              <?php if( $i%$cols == 1 || $cols == 1) { ?>
                <div class="row products-row">
                <?php } ?>
                <div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-12 col-xs-12 product-col">


                <div class="product-block clearfix row no-space-row">
                    <?php if ($product['thumb']) {    ?>
                        <div class="col-md-6 col-sm-6">
                            <div class="image">
                                <?php if( $product['special'] ) {   ?>
                                  <div class="product-label bts"><div class="product-label-special"><?php echo $objlang->get('text_sale'); ?></div></div>
                                <?php } ?>

                                  <a class="img" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                                    <img class="img-responsive" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                  </a>
                                  <button class="wishlist" type="button" data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="zmdi zmdi-favorite-outline"></i></button>
                                <div class="bottom">
                                    <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
                                       <button data-loading-text="Loading..." class="cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?>
                                      </button>
                                  <?php } ?>
                                 <?php if ($quickview) { ?>
                                    <a class="quickview iframe-link btn btn-outline-light radius-x border-width-2" data-toggle="tooltip" data-placement="top" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="zmdi zmdi-eye"></i></a>
                                  <?php } ?>
                                  <button class="btn btn-outline-light radius-x border-width-2 compare" type="button" data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="zmdi zmdi-tune"></i></button>
                                <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
                                    <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
                                      <a data-toggle="tooltip" data-placement="top" href="<?php echo $zimage;?>" class="zoom btn btn-outline-light radius-x border-width-2 info-view" title="<?php echo $product['name']; ?>"><i class="zmdi zmdi-plus"></i></a>
                                    <?php } ?>
                                <?php } ?>
                                </div>

                            </div>
                        </div>
                    <?php } ?>
                    <div class="col-md-6 col-sm-6">
                        <div class="product-meta">
                            <h6 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h6>
                            <?php if( isset($product['description']) ){ ?>
                            <p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,200);?>...</p>
                            <?php } ?>
                             <?php if ($product['rating']) { ?>
                              <div class="rating">
                                <?php for ($is = 1; $is <= 5; $is++) { ?>
                                <?php if ($product['rating'] < $is) { ?>
                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i>
                                </span>
                                <?php } ?>
                                <?php } ?>
                                </div>
                              <?php } ?>
                             <?php if ($product['price']) { ?>
                              <div class="price">
                                <?php if (!$product['special']) {  ?>
                                  <span class="price-new"><?php echo $product['price']; ?></span>
                                  <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?>
                                  <?php } ?>
                                <?php } else { ?>
                                  <span class="price-new"><?php echo $product['special']; ?></span>
                                  <span class="price-old"><?php echo $product['price']; ?></span>
                                  <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?>
                                  <?php } ?>

                                <?php } ?>
                              </div>
                              <?php } ?>
                              <div id="item_countdown_<?php echo $product['product_id']; ?>" class="item-countdown"></div>
                            </div>
                        </div>
                    </div>

                    <script type="text/javascript">
                      jQuery(document).ready(function($){
                        $("#item_countdown_<?php echo $product['product_id']; ?>").lofCountDown({
                          formatStyle:2,
                          TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($product['date_end_string'])); ?>",
                          DisplayFormat:"<ul class='list-inline'><li class='days'> %%D%% </li><li class='hours'> %%H%% </li><li class='minutes'> %%M%% </li><li class='seconds'> %%S%% </li></ul>",
                          FinishMessage: "<?php echo $objlang->get('text_finish');?>"
                        });
                      });
                    </script>


                </div>

                <?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
                </div>
            <?php } ?>
            <?php } //endforeach; ?>
            </div>
        <?php } ?>

        </div>
    </div>



</div>
</div>
<script type="text/javascript">
$('#pavdeals<?php echo $id;?>').carousel({interval:false,pause:'hover'});
</script>