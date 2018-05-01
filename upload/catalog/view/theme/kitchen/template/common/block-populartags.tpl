<?php

	$widget_populartags = $helper->getLangConfig('widget_populartags');
	$config  = $sconfig->get('themecontrol');

	$default = array(
		'widget_limit'  => "5",
		'min_font_size' => "9",
		'max_font_size' => "20",
		'font_weight'   => "bold",
	);
	$config = array_merge($default, $config);

	$limit = $config['widget_limit'];
	$min_font_size = $config['min_font_size'];
	$max_font_size = $config['max_font_size'];
	$font_weight = $config['font_weight'];


	$tags = $helper->getRandomTags($limit, $min_font_size, $max_font_size, $font_weight);

?>
<div class="pavpopulartag">
	<?php if($tags) { ?>
		<?php echo $tags; ?>
	<?php } ?>
</div>