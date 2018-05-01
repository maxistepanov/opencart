<div class="interactive-banner interactive-banner-<?php echo $banner_type;?> <?php echo $effect_type;?> <?php echo $position;?> panel panel-default">
    <?php if( $show_title ) { ?>
    <div class="panel-heading widget-heading"><h3 class="panel-title"><?php echo $heading_title?></h3></div>
    <?php } ?>
    <div class="image">
         <?php if($thumbnailurl){?><img alt="" src="<?php echo $thumbnailurl;?>" class="img-responsive"><?php }?>
    </div>
    <div class="content">
        <div class="interactive-banner-profile">
            <div class="panel-heading">
                <?php if($sub_title){?><h6><?php echo $sub_title;?></h6><?php }?>
            </div>
            <div class="htmlcontent">
                <?php if($htmlcontent){echo $htmlcontent; }?>
            </div>
        </div>
        <?php if($text_link){?>
        <div class="action-button">
            <?php if($text_link){?>
                <a class="btn btn-primary" href="<?php echo $link;?>"><?php echo $text_link;?></a>
            <?php }?>
        </div>
        <?php }?>
    </div>

</div>

