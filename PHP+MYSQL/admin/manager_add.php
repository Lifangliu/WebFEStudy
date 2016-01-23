<?php
  include_once("../core/util/dbhelper.php");
  include_once("../core/controller/manager.php");
  $manager = new ManagerCtrl();
  if(!$manager->isLogin()){
    header("Location:login.php");
    exit();
  }
  if($_SERVER["REQUEST_METHOD"] == 'POST'){
    $name = $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $res = $manager->add($username,$password,$name);
    echo "<script>alert('".$res."');</script>";
  }
  include_once("../core/view/head.php");
?>
      <div class="col-sm-6 col-md-5 col-xs-12">
        <h1 class="page-header">添加用户</h1>
        <form method="post">
          <div class="form-group">
            <label>用户名</label>
            <input type="text" class="form-control" name="username" valie="" placeholder="用户名"></div>
          <div class="form-group">
            <label>密码</label>
            <input type="password" class="form-control" name="password" valie="" placeholder="密码"></div>
          <div class="form-group">
            <label>姓名</label>
            <input type="text" class="form-control" name="name" valie="" placeholder="姓名"></div>
          <button type="button" class="btn btn-default">保存</button>
        </form>
      </div>
      <script type="text/javascript">
        $(document).ready(function(){
          $('.btn-default').click(function(){
            var isNotNull = true;
            $('.form-control').each(function(){
              if($(this).val() == ''){
                isNotNull = false;
                $(this).focus().keyup(function(){
                  $(this).parent().removeClass('has-error');
                }).parent().addClass('has-error')
                return false;
              }
            });
            if(isNotNull){
              $('form').submit();
            }

          });
        });
      </script>
<?php include_once "../core/view/footer.php" ?>