<?php
header("Content-type: text/html; charset=utf-8");
include_once("../core/util/dbhelper.php");
include_once ("../core/controller/manager.php");
include_once ("../core/controller/article.php");

$manager = new ManagerCtrl ();
$article = new ArticleCtrl();
if (! $manager->isLogin ()) {
  header ( "Location:login.php" );
  exit ();
}
//获取文章分类
$types = $article->types();

if ($_SERVER ["REQUEST_METHOD"] == 'POST') {
  $title = isset($_POST ['title'])?$_POST ['title']:"";
  $source = isset($_POST ['source'])?$_POST ['source']:"";
  $source_color = isset($_POST ['source_color'])?$_POST ['source_color']:"";
  $intro = isset($_POST ['intro'])?$_POST ['intro']:"";
  $type = isset($_POST ['type'])?$_POST ['type']:"";
  $show_type = isset($_POST ['show_type'])?$_POST ['show_type']:"";
  $ishot = isset($_POST ['ishot'])?$_POST ['ishot']:"";
  $iscarousel = isset($_POST ['iscarousel'])?$_POST ['iscarousel']:"";
  $thumbnail1 = "";
  if ((($_FILES ["thumbnail1"] ["type"] == "image/gif") || ($_FILES ["thumbnail1"] ["type"] == "image/jpeg") || ($_FILES ["thumbnail1"] ["type"] == "image/pjpeg")) && ($_FILES ["thumbnail1"] ["size"] < 20000)) {
    if ($_FILES ["thumbnail1"] ["error"] > 0) {
      echo "Return Code: " . $_FILES ["thumbnail1"] ["error"] . "<br />";
    } else {
      $tmp_pic = time ();
      $thumbnail1 = "upload/" . $tmp_pic . "_" . $_FILES ["thumbnail1"] ["name"];
      move_uploaded_file ( $_FILES ["thumbnail1"] ["tmp_name"], "../".$thumbnail1 );
    }
  }

  $thumbnail2 = "";
  if ((($_FILES ["thumbnail2"] ["type"] == "image/gif") || ($_FILES ["thumbnail2"] ["type"] == "image/jpeg") || ($_FILES ["thumbnail2"] ["type"] == "image/pjpeg")) && ($_FILES ["thumbnail2"] ["size"] < 20000)) {
    if ($_FILES ["thumbnail2"] ["error"] > 0) {
      echo "Return Code: " . $_FILES ["thumbnail2"] ["error"] . "<br />";
    } else {
      $tmp_pic = time ();
      $thumbnail2 = "upload/" . $tmp_pic . "_" . $_FILES ["thumbnail2"] ["name"];
      move_uploaded_file ( $_FILES ["thumbnail2"] ["tmp_name"], "../".$thumbnail2);
    }
  }

  $thumbnail3 = "";
  if ((($_FILES ["thumbnail3"] ["type"] == "image/gif") || ($_FILES ["thumbnail3"] ["type"] == "image/jpeg") || ($_FILES ["thumbnail3"] ["type"] == "image/pjpeg")) && ($_FILES ["thumbnail3"] ["size"] < 20000)) {
    if ($_FILES ["thumbnail3"] ["error"] > 0) {
      echo "Return Code: " . $_FILES ["thumbnail3"] ["error"] . "<br />";
    } else {
      $tmp_pic = time ();
      $thumbnail3 = "upload/" . $tmp_pic . "_" . $_FILES ["thumbnail3"] ["name"];
      move_uploaded_file ( $_FILES ["thumbnail3"] ["tmp_name"], "../".$thumbnail3);
    }
  }
  if($show_type == 0 && $thumbnail1 == ""){
    echo "<script>alert('保存失败,请上传一张缩略图!');</script>";
  }else if($show_type == 1 && ($thumbnail1 == "" || $thumbnail2 == "" || $thumbnail3 == "")){
    echo "<script>alert('保存失败,请上传三张缩略图!');</script>";
  }else{
    $res = $article->add($title,$source,$source_color,$intro,$type,$show_type,$thumbnail1,$thumbnail2,$thumbnail3,$iscarousel,$ishot);
    echo "<script>alert('".$res."');</script>";
  }
}
include_once ("../core/view/head.php");
?>
<style type="text/css">
.btn-save {
  float: right;
  margin-bottom: 30px;
}
</style>
<div class="col-sm-6 col-md-5 col-xs-12">
  <h1 class="page-header">添加文章</h1>
  <form method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label>标题</label> <input type="text" class="form-control nonull" name="title" valie="" placeholder="标题">
    </div>
    <div class="form-group">
      <label>新闻来源</label> <input type="text" class="form-control nonull" name="source" valie="" placeholder="新闻来源">
    </div>
    <div class="form-group">
      <label>来源颜色</label> <select class="form-control" name="source_color">
        <option>蓝色</option>
        <option value="redbg">红色</option>
      </select>
    </div>
    <div class="form-group">
      <label>分类</label> <select class="form-control" name="type">
        <?php foreach ($types as $type):?>
        <option value="<?=$type[0];?>"><?=$type[1];?></option>
        <?php endforeach;?>
      </select>
    </div>
    <div class="form-group">
      <label>简介</label>
      <textarea class="form-control" rows="3" name="intro"></textarea>
    </div>
    <div class="form-group">
      <label>显示样式</label> <select class="form-control" name="show_type">
        <option value="0">一图</option>
        <option value="1">三图</option>
      </select>
    </div>
    <div class="thumbnails">
      <div class="form-group">
        <label>缩略图1</label> <input type="file" name="thumbnail1" class="nonull">
      </div>
      <div class="form-group" style="display: none;">
        <label>缩略图2</label> <input type="file" name="thumbnail2">
      </div>
      <div class="form-group" style="display: none;">
        <label>缩略图3</label> <input type="file" name="thumbnail3">
      </div>
    </div>
    <div class="radio">
      <label> <input type="radio" name="ishot" id="optionsRadios1" value="0" checked> 不是热点新闻
      </label>
    </div>
    <div class="radio">
      <label> <input type="radio" name="ishot" id="optionsRadios2" value="1"> 是热点新闻
      </label>
    </div>
    <div class="radio">
      <label> <input type="radio" name="iscarousel" id="optionsRadios3" value="0" checked> 非首页轮播新闻
      </label>
    </div>
    <div class="radio">
      <label> <input type="radio" name="iscarousel" id="optionsRadios4" value="1"> 首页轮播新闻
      </label>
    </div>
    
    <button type="button" class="btn btn-default btn-save">保存</button>
  </form>
</div>
<script type="text/javascript">
        $(document).ready(function(){
          $('select[name="show_type"]').change(function(){
            if($(this).val() == '0'){
              $('.thumbnails > div').hide();
              $('.thumbnails > div:eq(0)').show();
              $('input[name="thumbnail2"]').removeClass('nonull');
              $('input[name="thumbnail3"]').removeClass('nonull');
            }else{
              $('.thumbnails > div').show();
              $('input[name="thumbnail2"]').addClass('nonull');
              $('input[name="thumbnail3"]').addClass('nonull');
            }
          });
          $('.btn-save').click(function(){
            var isNotNull = true;
            $('.nonull').each(function(){
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
<?php include_once "../core/view/footer.php" ?>