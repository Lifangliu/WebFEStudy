<?php
	include_once("core/util/dbhelper.php");
  	include_once ("core/controller/article.php");
  	$article = new ArticleCtrl();
	//获取文章分类
	$types = $article->types();
	$type = 1;
	if(isset($_GET['type'])){
		$type = $_GET['type'];
	}

	$carousel = $article->carousel();
	$hotword = $article->hotword();
	$articles = $article->articles(1,$type);
	$articles = $articles['data'];
?>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<title>百度新闻</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="./static/css/news.css"></head>
<body>
	<div class="content">
		<div class="header">
			<a href="javascript:;" class="bdhome"></a>
			<a href="javascript:;" class="username"></a>
			<a href="javascript:;" class="search"></a>
			<a href="javascript:;" class="subscribe"></a>
		</div>
		<div class="main">
			<div class="navigator">
				<div class="divider"></div>
				<div class="nav-content">
					<ul>
						<?php foreach ($types as $t):?>
						<li class="<?php if($t[0] == $type):?>cur<?php endif;?> <?php if($t[2] == 2):?>double<?php endif;?>"> <b></b>
							<a href="?type=<?=$t[0];?>"><?=$t[1];?></a>
						</li>
						<?php endforeach;?>
					</ul>
				</div>
			</div>
			<?php if($type == 1):?>
			<div class="carousel">
				<ul>
					<?php foreach ($carousel as $c):?>
					<li>
						<a href="javascript:;">
							<img src="<?=$c[7];?>" />
							<h4><?=$c[1];?></h4>
						</a>
					</li>
					<?php endforeach;?>
				</ul>
				<ol>
					<?php foreach ($carousel as $c):?>
					<li><a href="javascript:;"></a></li>
					<?php endforeach;?>
				</ol>
			</div>
			<div class="hotword">
				<span>热点</span>
				<ul>
					<?php foreach ($hotword as $h):?>
					<li><a href="javascript:;"><strong><?=$h[1];?></strong><b></b></a></li>
					<?php endforeach;?>
				</ul>
			</div>
			<?php endif;?>
			<ul class="news-list">
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
			</ul>
			<button class="load-btn" data-pn="1" data-type="<?=$type;?>">点击加载更多</button>
		</div>
		<div class="footer">
			<a href="javascript:;"><span class="feedback">意见反馈</span></a>
			<a href="javascript:;"><span class="app-recommend">应用推荐</span></a>
			<a href="javascript:;"><span class="app-download">客户端</span></a>
		</div>
	</div>
	<script type="text/javascript" src="./static/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="./static/js/index.js"></script>
</body>
</html>