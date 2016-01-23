<?php
  include_once("../core/util/dbhelper.php");
  include_once("../core/controller/manager.php");
  $manager = new ManagerCtrl();
  if(!$manager->isLogin()){
    header("Location:login.php");
    exit();
  }
  if(isset($_GET['method'])){
    if($_GET['method'] == 'bye'){
      session_destroy();
      header("Location:login.php");
      exit();
    }
    if($_GET['method'] == 'del'){
      $managerId = $_GET['id'];
      if(isset($managerId)){
        $manager->del($managerId);
        header("Location:manager.php");
        exit();
      }
    }
  }
  if($_SERVER["REQUEST_METHOD"] == 'POST'){
    $method = $_POST['method'];
    if($method == 'mod'){
      $id = $_POST['id'];
      $password = $_POST['password'];
      $name = $_POST['name'];
      $manager->mod($id,$password,$name);
      $pn = 1;
      if(isset($_GET['pn'])){
        $pn = $_GET['pn'];
      }
      header("Location:manager.php?pn=".$pn);
      exit();
    }
  }
  include_once("../core/view/head.php");
?>
      <div class="col-sm-9 col-md-10 col-xs-12">
        <h1 class="page-header">用户列表</h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>姓名</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <?php 
                $pn = 1;
                if(isset($_GET['pn'])){
                  $pn = $_GET['pn'];
                }
                $page = $manager->managerList($pn);
                $list = $page['data'];
                $pagehtml = $page['pagehtml'];
                foreach ($list as $manager) {
              ?>
              <tr>
                <td><?=$manager[0]?></td>
                <td><?=$manager[1]?></td>
                <td>******</td>
                <td><?=$manager[3]?></td>
                <td>
                  <button data-mid="<?=$manager[0]?>" data-musername="<?=$manager[1]?>" data-mname="<?=$manager[3]?>" type="button" class="btn btn-warning btn-mod" data-toggle="modal" data-target=".mod-modal">修改</button>
                  <button data-delid="<?=$manager[0]?>" type="button" class="btn btn-danger btn-del" data-toggle="modal" data-target=".del-modal">删除</button>
                </td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <?=$pagehtml;?>
        </div>
      </div>
      <div class="modal fade del-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
              <h4 class="modal-title" id="mySmallModalLabel">删除确认</h4>
            </div>
            <div class="modal-body">
                <h3>您确定要删除吗？</h3>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              <button type="button" class="btn btn-danger btn-del2">确认删除</button>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade mod-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
              <h4 class="modal-title" id="mySmallModalLabel">管理员修改</h4>
            </div>
            <div class="modal-body">
                <form method="post">
                  <input type="hidden" name="method" value="mod" />
                  <input type="hidden" name="id" />
                  <div class="form-group">
                    <label>用户名</label>
                    <input type="text" class="form-control" name="username" placeholder="请输入用户名" readonly>
                  </div>
                  <div class="form-group">
                    <label>密码</label>
                    <input type="password" class="form-control" name="password" value="" placeholder="******">
                  </div>
                  <div class="form-group">
                    <label>姓名</label>
                    <input type="text" class="form-control" name="name" placeholder="请输入管理员姓名">
                  </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              <button type="button" class="btn btn-warning btn-mod2">保存</button>
            </div>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        $(document).ready(function(){
          var delid;
          $('.btn-del').click(function(){
            delid = $(this).attr('data-delid');
          });
          $('.btn-del2').click(function(){
            window.location = 'manager.php?method=del&id='+delid;
          });
          $('.btn-mod').click(function(){
            $('input[name="id"]').val($(this).attr('data-mid'));
            $('input[name="username"]').val($(this).attr('data-musername'));
            $('input[name="password"]').val('');
            $('input[name="name"]').val($(this).attr('data-mname'));
          });
          $('.btn-mod2').click(function(){
            var name = $('input[name="name"]');
            if($(name).val() == ''){
              $(name).focus().keyup(function(){
                $(this).parent().removeClass('has-error');
              }).parent().addClass('has-error');
            }else{
              $('form').submit();
            }
          });
        });
      </script>
<?php include_once "../core/view/footer.php" ?>