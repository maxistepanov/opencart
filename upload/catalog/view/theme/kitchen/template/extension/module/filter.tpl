<div class="panel panel-default refine-search">
  <div class="panel-heading"><h4 class="panel-title"><?php echo $heading_title; ?></h4></div>
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>" class="padding-left-20">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="text-right padding-10">
    <button type="button" id="button-filter" class="btn btn-outline btn-second btn-xs"><?php echo $button_filter; ?><i class="text-primary zmdi-hc-fw zmdi zmdi-chevron-right"></i></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  filter = [];

  $('input[name^=\'filter\']:checked').each(function(element) {
    filter.push(this.value);
  });

  location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
