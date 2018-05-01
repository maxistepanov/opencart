
<div class="product-block clearfix">
    <?php if ($product['thumb']) {    ?>
      <div class="image">
        <?php if( $product['special'] ) {   ?>
          <div class="product-label bts">
            <div class="product-label-special">
              <?php echo $objlang->get('text_sale'); ?>
            </div>
          </div>
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
        <div id="item_countdown_<?php echo $product['product_id']; ?>" class="item-countdown"></div>
      </div>
    <?php } ?>

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
