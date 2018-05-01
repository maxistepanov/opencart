
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<html dir="<?php echo $direction; ?>" class="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<?php  require( ThemeControlHelper::getLayoutPath( 'common/parts/head.tpl' ) );   ?>

<body class="<?php echo $class; ?> <?php echo $helper->getPageClass();?> layout-<?php echo $template_layout; ?>">
<div class="row-offcanvas row-offcanvas-left">
<!-- header -->
<header class="header">
  <nav id="topbar" class="topbar top-links">
    <div class="container">
      <div class="inner">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 column">
                <?php  require( ThemeControlHelper::getLayoutPath( 'common/parts/mainmenu.tpl' ) );   ?>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 column">
                <!-- logo -->
                <?php
                if( isset($_COOKIE[$themeName .'_skin']) && $_COOKIE[$themeName .'_skin'] ){
                  $skin = trim($_COOKIE[$themeName .'_skin']);
                }
                ?>
                <?php if( $logoType=='logo-theme'){ ?>
                <div id="logo-theme" class="logo text-center">
                  <a href="<?php echo $home; ?>">
                    <img src="image/catalog/<?php if(isset($skin)) echo $skin."/"; ?>logo_theme.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                  </a>
                </div>
                <?php } elseif ($logo) { ?>
                <div id="logo" class="logo text-center">
                  <a href="<?php echo $home; ?>">
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                  </a>
                </div>
                <?php } ?>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 column">
                <div class="pull-right"><?php echo $cart; ?></div>
                <div class="quick-setting pull-right">
                  <div class="button dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-setting"></i>
                  </div>
                  <div class="dropdown-menu pull-right">
                    <div class="language">
                      <?php echo $language; ?>
                    </div>
                    <hr>
                    <div class="currency">
                      <?php echo $currency; ?>
                    </div>
                    <hr>
                    <ul class="links">
                      <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
                      <li><a href="<?php echo $account; ?>"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
                      <li><a href="<?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a></li>
                      <li><a href="<?php echo $checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
                    </ul>
                    <ul class="links ">
                      <?php if ($logged) { ?>
                      <li><a href="<?php echo $logout; ?>"><i class="fa-fw fa fa-unlock"></i><?php echo $text_logout; ?></a></li>
                      <?php } else { ?>
                      <li><a href="<?php echo $register; ?>"><i class="fa-fw fa fa-users"></i><?php echo $text_register; ?></a></li>
                      <li><a href="<?php echo $login; ?>"><i class="fa-fw fa fa-lock"></i><?php echo $text_login; ?></a></li>
                      <?php } ?>
                    </ul>
                  </div>
                </div>
                <div class="quick-setting search-block pull-right">
                    <div class="button dropdown-toggle" data-toggle="dropdown">
                        <span class="icon-search"></span>
                    </div>
                    <div class="dropdown-menu pull-right">
                        <?php echo $search; ?>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </nav>
</header>
<!-- /header -->

  <?php
  /**
  * Showcase modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  //$modules = $helper->getCloneModulesInLayout( $blockid, $layoutID );
  $blockid = 'slideshow';
  $blockcls = "hidden-xs hidden-sm";
  $ospans = array(1=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>
  <?php
  /**
  * Showcase modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  $blockid = 'showcase';
  $blockcls = 'hidden-xs hidden-sm';
  $ospans = array(1=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>
  <?php
  /**
  * promotion modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  $blockid = 'promotion';
  $blockcls = "hidden-xs hidden-sm";
  $ospans = array(1=>12, 2=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>

<div class="maincols">