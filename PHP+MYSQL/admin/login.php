<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>百度新闻管理系统-登录</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../static/css/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/jquery/jquery.min.js"></script>
	<?php 
		include_once("../core/util/dbhelper.php");
	    include_once("../core/controller/manager.php");
	    $manager = new ManagerCtrl();
	    if($manager->isLogin()){
	    	header("Location:manager.php");
	    	exit();
	    }else{
	    	if($_SERVER["REQUEST_METHOD"] == 'POST'){
	    		$username = $_POST['username'];
	    		$password = $_POST['password'];
	    		if(isset($username) && isset($password)){
	    			$res = $manager->login($username,$password);
	    			if($res){
	    				header("Location:manager.php");
	    				exit(); 
	    			}else{
	    				echo "<script>alert('登录失败,用户名或密码错误!');</script>";
	    			}
	    		}
	    	}
	    }
	?>
</head>
<body>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12">
			<!-- 登录面板 -->
			<div class="panel panel-info panel-login">
				<div class="panel-heading">
					<h3 class="panel-title">百度新闻管理系统用户登录</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" name="password" placeholder="请输入您的密码" required />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default btn-login">登录</button>
							</div>
						</div>
					</form>
				</div>
				<div class="panel-footer text-center">©2015 Baidu</div>
			</div>
			<!-- 登录面板end -->
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.btn-login').click(function(){
				var isNotNull = true;
				$('.form-control').each(function(){
					if($(this).val() == ''){
						isNotNull = false;
						$(this).focus().keyup(function(){
						  $(this).parent().removeClass('has-error');
						}).parent().addClass('has-error');
						return false;
					}
				});
				if(isNotNull){
					$('form').submit();
				}
			});
			
		});
	</script>
</body>
</html>