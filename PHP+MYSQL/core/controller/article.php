<?php
class ArticleCtrl {
	private $db;
	function __construct() {
		$this->db = new DBHelper ();
	}
	function types() {
		$sql = "select * from article_type order by id asc";
		$res = $this->db->query ( $sql );
		return $res;
	}
	function carousel() {
		$sql = "select * from article where iscarousel = 1 order by id desc ";
		$res = $this->db->query ( $sql );
		return $res;
	}
	function hotword() {
		$sql = "select * from article where ishot = 1 order by id desc ";
		$res = $this->db->query ( $sql );
		return $res;
	}
	function get($id) {
		$sql = "select * from article where id = ".$id;
		$res = $this->db->query ( $sql );
		return $res;
	}
	function articles($pn, $type) {
		$sql = "select * from article";
		$sql .= " where type = " . $type;
		$res = $this->db->page ( $sql, $pn );
		return $res;
	}
	function articleList($pn = 1,$type) {
		$sql = "select a.*,b.`name` as `type_name` from article a left join article_type b on a.type = b.id";
		if($type != 0){
			$sql .= " where a.type=".$type;
		}
		$res = $this->db->page ( $sql, $pn );
		return $res;
	}
	function del($id) {
		$res = isset ( $id );
		if ($res) {
			$sql = "delete from article where id = " . $id;
			$this->db->execute ( $sql );
		}
		return $res;
	}
	function add($title, $source, $source_color, $intro, $type, $show_type, $thumbnail1, $thumbnail2, $thumbnail3, $iscarousel, $ishot) {
		$sql = "insert into article (`title`,`source`,`source_color`,`intro`,`type`,`show_type`,`thumbnail1`,`thumbnail2`,`thumbnail3`,`iscarousel`,`ishot`,`publishtime`) values ('" . $title . "','" . $source . "','" . $source_color . "','" . $intro . "','" . $type . "','" . $show_type . "','" . $thumbnail1 . "','" . $thumbnail2 . "','" . $thumbnail3 . "','" . $iscarousel . "','" . $ishot . "',NOW())";
		$res = $this->db->execute ( $sql );
		if ($res == 1) {
			$res = "【" . $title . "】" . "新增成功!";
		} else {
			$res = "【" . $title . "】" . "新增失败!";
		}
		return $res;
	}
	function mod($id,$title, $source, $source_color, $intro, $type, $show_type, $thumbnail1, $thumbnail2, $thumbnail3, $iscarousel, $ishot) {
		$sql = "update article set";
		$sql .= " title = '".$title."'";
		$sql .= ",source = '".$source."'";
		$sql .= ",source_color = '".$source_color."'";
		$sql .= ",intro = '".$intro."'";
		$sql .= ",type = '".$type."'";
		$sql .= ",show_type = '".$show_type."'";
		if($thumbnail1 != ''){
			$sql .= ",thumbnail1 = '".$thumbnail1."'";
		}
		if($thumbnail2 != ''){
			$sql .= ",thumbnail2 = '".$thumbnail2."'";
		}
		if($thumbnail3 != ''){
			$sql .= ",thumbnail3 = '".$thumbnail3."'";
		}
		$sql .= ",iscarousel = '".$iscarousel."'";
		$sql .= ",ishot = '".$ishot."'";
		$sql .= " where id = ".$id;

		$res = $this->db->execute ( $sql );
		if ($res == 1) {
			$res = "【" . $title . "】" . "修改成功!";
		} else {
			$res = "【" . $title . "】" . "修改失败!";
		}
		return $res;
	}
}
?>