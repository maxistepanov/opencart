<?php 
  $load = $this->registry->get("load");
  $language = $load->language("module/themecontrol");
  $text_sale = $language['text_sale'];
  $ourl = $this->registry->get('url'); 
  $objlang = $this->registry->get('language'); 
?>
<div class="product-block product-v2">
  <div class="image">
     <!-- Sale lable -->
    <?php if( $product['special'] ) {   ?>
      <span class="product-label sale"><?php echo $text_sale; ?></span>
    <?php } ?>
    <!-- / Sale lable -->
    <a href="<?php echo $product['href']; ?>">
      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
    </a>
    <div class="block-bottom">
      <div class="product-meta">
          <h6 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h6>
          <?php if( isset($product['description']) ){ ?> 
            <p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,200);?>...</p>
            <?php } ?>
          <?php if ($product['price']) { ?>
          <div class="price">
            <?php if (!$product['special']) { ?>
            <span class="price-new"><?php echo $product['price']; ?></span>
            <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
            <?php } ?>
          </div>
          <?php } ?>                                       
      </div>  
    </div>
  </div>
  
    
</div>




