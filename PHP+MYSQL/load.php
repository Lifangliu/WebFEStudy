<?php
	include_once("core/util/dbhelper.php");
  	include_once ("core/controller/article.php");
  	$article = new ArticleCtrl();
	$type = 1;
	$pn = 2;
	if(isset($_GET['type'])){
		$type = $_GET['type'];
	}
	if(isset($_GET['pn'])){
		$pn = $_GET['pn'];
	}
	$articles = $article->articles($pn,$type);
	$articles = $articles['data'];
?>
<?php foreach ($articles as $a):?>
<?php if($a[6] == '0'):?>
<li>
	<a href="javascript:;">
		<img src="<?=$a[7];?>" />
		<div class="probable">
			<span class="title"><?=$a[1];?></span>
			<p class="desc"><?=$a[4];?></p>
		</div>
		<i class="time"><?=$a[12];?></i>
		<b class="source <?=$a[3];?>"><?=$a[2];?></b>
	</a>
</li>
<?php else:?>
<li>
	<a href="javascript:;">
		<span class="title1"><?=$a[1];?></span>
		<p><img src="<?=$a[7];?>" />
		<img src="<?=$a[8];?>" />
		<img src="<?=$a[9];?>" /></p>
		<i class="time lf0"><?=$a[12];?></i>
		<b class="source <?=$a[3];?>"><?=$a[2];?></b>
	</a>
</li>
<?php endif;?>
<?php endforeach;?>