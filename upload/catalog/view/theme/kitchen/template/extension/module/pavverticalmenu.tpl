<div class="verticalmenu-head hidden-xs hidden-sm">
    <div class="vertical-title">
        <i class="zmdi zmdi-sort-amount-asc"></i><?php echo $objlang->get("shop_by_categories"); ?>
        <span class="pull-right zmdi zmdi-chevron-down"></span>
    </div>
    <div class="pav-verticalmenu">
        <div class="navbar navbar-default">
            <div class="verticalmenu" role="navigation">
                <div class="navbar-header">
                    <a href="javascript:;" data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <?php echo $treemenu; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>