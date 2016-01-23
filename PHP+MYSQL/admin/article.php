<?php
  include_once("../core/util/dbhelper.php");
  include_once("../core/controller/manager.php");
  include_once ("../core/controller/article.php");
  $manager = new ManagerCtrl();
  $article = new ArticleCtrl();

  if(!$manager->isLogin()){
    header("Location:login.php");
    exit();
  }
  $type = 0;
  if(isset($_GET['type'])){
    $type = $_GET['type'];
  }
  if(isset($_GET['method'])){
    if($_GET['method'] == 'bye'){
      session_destroy();
      header("Location:login.php");
      exit();
    }
    if($_GET['method'] == 'del'){
      $articleId = $_GET['id'];
      if(isset($articleId)){
        $article->del($articleId);
        header("Location:article.php");
        exit();
      }
    }
  }
  $types = $article->types();
  include_once("../core/view/head.php");
?>
      <div class="col-sm-9 col-md-10 col-xs-12">
        <h1 class="page-header">文章列表</h1>
        <form class="form-inline">
          <div class="form-group">
            <label>分类查找:</label>
            <select class="form-control s_type" name="type">
              <option value="0">全部</option>
              <?php foreach ($types as $t):?>
                <option value="<?=$t[0];?>" <?php if($t[0] == $type):?>selected<?php endif;?>><?=$t[1];?></option>
              <?php endforeach;?>
            </select>
          </div>
        </form>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>文章标题</th>
                <th>分类</th>
                <th>来源</th>
                <th>发布日期</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <?php 
                $pn = 1;
                if(isset($_GET['pn'])){
                  $pn = $_GET['pn'];
                }
                $page = $article->articleList($pn,$type);
                $list = $page['data'];
                $pagehtml = $page['pagehtml'];
                foreach ($list as $article) {
              ?>
              <tr>
                <td><?=$article[0]?></td>
                <td><?=$article[1]?></td>
                <td><?=$article[13]?></td>
                <td><?=$article[2]?></td>
                <td><?=$article[12]?></td>
                <td>
                  <a href="article_edit.php?id=<?=$article[0]?>" class="btn btn-primary" role="button">编辑</a>
                  <button data-delid="<?=$article[0]?>" type="button" class="btn btn-danger btn-del" data-toggle="modal" data-target=".del-modal">删除</button>
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
      <script type="text/javascript">
        $(document).ready(function(){
          var delid;
          $('.btn-del').click(function(){
            delid = $(this).attr('data-delid');
          });
          $('.btn-del2').click(function(){
            window.location = 'article.php?method=del&id='+delid;
          });
          $('.s_type').change(function(){
            $('form').submit();
          });
        });
      </script>
<?php include_once "../core/view/footer.php" ?>