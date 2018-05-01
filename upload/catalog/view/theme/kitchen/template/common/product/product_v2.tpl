<?php 
  $load = $this->registry->get("load");
  $language = $load->language("module/themecontrol");
  $text_sale = $language['text_sale'];
  $ourl = $this->registry->get('url'); 
  $objlang = $this->registry->get('language'); 
  if (!empty($first_product)) {
?>
<div class="product-block product-v2">
  <div class="image large">
     <!-- Sale lable -->
    <?php if( $first_product['special'] ) {   ?>
      <span class="product-label sale"><?php echo $text_sale; ?></span>
    <?php } ?>
    <!-- / Sale lable -->
    <a href="<?php echo $first_product['href']; ?>">
      <img src="<?php echo $first_product['thumb']; ?>" alt="<?php echo $first_product['name']; ?>" title="<?php echo $first_product['name']; ?>" class="img-responsive" />
    </a>
    <div class="block-bottom">
      <div class="action text-left"> 
        <button data-toggle="tooltip" data-placement="top" class="btn btn-outline-light" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $first_product['product_id']; ?>');"><i class="icon-cart"></i></button>     
        <button class="btn btn-outline-light wishlist" type="button" data-placement="top" data-toggle="tooltip" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.add('<?php echo $first_product['product_id']; ?>');">
        <i class="fa fa-heart-o"></i></button>    
        <button class="btn btn-outline-light compare" type="button" data-placement="top" data-toggle="tooltip" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.add('<?php echo $first_product['product_id']; ?>');">
        <i class="fa fa-refresh"></i></button> 
         <?php if ( isset($quickview) && $quickview ) { ?>
          <a class="quickview iframe-link  btn btn-outline-light" href="<?php echo $ourl->link('themecontrol/product','product_id='.$first_product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="fa-fw fa fa-eye"></i></a>
        <?php } ?>
         <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $first_product['thumb'] ));  ?>
              <a data-toggle="tooltip" data-placement="top" href="<?php echo $zimage;?>" class="zoom info-view colorbox cboxElement btn btn-outline-light" title="<?php echo $first_product['name']; ?>"><i class="fa fa-search-plus"></i></a>
          <?php } ?>      
      </div>
      <div class="product-meta">
        <div class="pull-left">
          <h6 class="name"><a href="<?php echo $first_product['href']; ?>"><?php echo $first_product['name']; ?></a></h6>
          <?php if( isset($first_product['description']) ){ ?> 
            <p class="description"><?php echo utf8_substr( strip_tags($first_product['description']),0,200);?>...</p>
            <?php } ?>
          <?php if ($first_product['price']) { ?>
          <div class="price">
            <?php if (!$first_product['special']) { ?>
            <span class="price-new"><?php echo $first_product['price']; ?></span>
            <?php } else { ?>
            <span class="price-new"><?php echo $first_product['special']; ?></span> <span class="price-old"><?php echo $first_product['price']; ?></span>
            <?php } ?>
          </div>
          <?php } ?>
           
        </div>
        <div class="pull-right">
          <?php if ($first_product['rating']) { ?>
          <div class="rating">
            <?php for ($is = 1; $is <= 5; $is++) { ?>
            <?php if ($first_product['rating'] < $is) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star"></i>
            </span>
            <?php } ?>
            <?php } ?>
          </div>
          <?php } ?>
        </div>                                       
      </div>  
    </div> 
  </div>
  
    
</div>

  <?php } ?>


