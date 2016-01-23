<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>百度新闻管理系统</title>
  <link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="../static/css/main.css" rel="stylesheet" type="text/css"></head>
  <script src="../static/jquery/jquery.min.js"></script>
  <script src="../static/bootstrap/js/bootstrap.min.js"></script>
<body>
  <!-- 顶部导航菜单 -->
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">百度新闻管理系统</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li>
            <a href="manager.php">管理员</a>
          </li>
          <li>
            <a href="article.php">新闻</a>
          </li>
          <li>
            <a href="manager.php?method=bye">【<?=$_SESSION['manager'];?>】退出</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- 顶部导航菜单end -->
  <div class="container-fluid">
    <div class="row">
      <!-- 左侧菜单 -->
      <div class="col-sm-3 col-md-2 col-xs-12">
        <div class="panel panel-primary">
          <div class="panel-heading">用户管理</div>
          <div class="panel-body mu-panel-body">
            <a href="manager.php" class="list-group-item">用户列表</a>
            <a href="manager_add.php" class="list-group-item">添加用户</a>
          </div>
        </div>
        <div class="panel panel-success">
          <div class="panel-heading">文章管理</div>
          <div class="panel-body mu-panel-body">
            <a href="article_add.php" class="list-group-item">新增文章</a>
            <a href="article.php" class="list-group-item">文章列表</a>
          </div>
        </div>
      </div>
      <!-- 左侧菜单end -->