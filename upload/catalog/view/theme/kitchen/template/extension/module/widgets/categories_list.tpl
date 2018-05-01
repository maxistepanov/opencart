<div class="panel panel-default list-category <?php echo $addition_cls; ?> clearfix">
    <div class="img-category"><img alt="img" src="<?php echo $icon; ?>"></div>
    <div class="widget-inner">
        <?php if( $show_title ) { ?>
            <div class="panel-heading">
                <h5 class="panel-title"><?php echo $heading_title?></h5>
            </div>
        <?php } ?>
        <ul class="list-unstyled">
            <?php foreach ($categories_list as $category){ ?>
            <li><a href="<?php echo $category['href']; ?>"><span class="title"><?php echo $category['name']; ?></span></a></li>
            <?php } ?>
        </ul>
        <div><a class="btn-style" href="<?php echo $link; ?>"><?php echo $objlang->get('text_viewmore'); ?></a></div>
    </div>

</div>

