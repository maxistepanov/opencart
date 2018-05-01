<div class="product-block first-product">
  <div class="image">
     <!-- Sale lable -->
    <?php if( $first_product['special'] ) {   ?>
      <span class="product-label sale"><?php echo $objlang->get("text_sale");?></span>
    <?php } ?>
    <!-- / Sale lable -->
    <a href="<?php echo $first_product['href']; ?>">
      <img src="<?php echo $first_product['thumb']; ?>" alt="<?php echo $first_product['name']; ?>" title="<?php echo $first_product['name']; ?>" class="img-responsive" />
    </a>
    <button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.add('<?php echo $first_product['product_id']; ?>');"><i class="zmdi zmdi-favorite-outline"></i></button>
    <div class="bottom">
       <button class="cart" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $first_product['product_id']; ?>');"><?php echo $objlang->get('button_cart'); ?></button>
       <?php if ($quickview) { ?>
        <a class="quickview iframe-link btn btn-outline-light radius-x border-width-2" data-toggle="tooltip" data-placement="top" href="<?php echo $ourl->link('themecontrol/product','product_id='.$first_product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="zmdi zmdi-eye"></i></a>
      <?php } ?>
      <button class="btn btn-outline-light radius-x border-width-2 compare" type="button" data-toggle="tooltip" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.add('<?php echo $first_product['product_id']; ?>');"><i class="zmdi zmdi-tune"></i></button>
       <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $first_product['thumb'] ));  ?>
            <a data-toggle="tooltip" data-placement="top" href="<?php echo $zimage;?>" class="zoom info-view btn btn-outline-light radius-x border-width-2" title="<?php echo $first_product['name']; ?>"><i class="zmdi zmdi-plus"></i></a>
        <?php } ?>
    </div>
  </div>
  <div class="product-meta">

          <h6 class="name"><a href="<?php echo $first_product['href']; ?>"><?php echo $first_product['name']; ?></a></h6>
          <?php if( isset($first_product['description']) ){ ?>
            <p class="description"><?php echo utf8_substr( strip_tags($first_product['description']),0,200);?>...</p>
          <?php } ?>
          <?php if ($first_product['rating']) { ?>
          <div class="rating pull-right">
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
        <?php if ($first_product['price']) { ?>
        <div class="price">
          <?php if (!$first_product['special']) { ?>
          <span class="price-new"><?php echo $first_product['price']; ?></span>
          <?php } else { ?>
          <span class="price-new"><?php echo $first_product['special']; ?></span><span class="price-old"><?php echo $first_product['price']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
    </div>

</div>




