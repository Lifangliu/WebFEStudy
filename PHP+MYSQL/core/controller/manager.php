<?php
session_start ();
class ManagerCtrl {
	private $db;
	function __construct() {
		$this->db = new DBHelper ();
	}
	// 是否登录
	function isLogin() {
		return isset ( $_SESSION ['manager'] );
	}
	function login($username, $password) {
		$res = isset ( $username ) && isset ( $password );
		if ($res) {
			$sql = "select name from manager where username = '" . $username . "' and password = md5(md5('" . $password . "'))";
			$res = $this->db->query ( $sql );
			if ($res) {
				$_SESSION ['manager'] = $res [0] [0];
				$res = $_SESSION ['manager'];
			}
		}
		return $res;
	}
	function managerList($pn = 1) {
		$sql = "select * from manager";
		$res = $this->db->page ( $sql, $pn );
		return $res;
	}
	function del($id) {
		$res = isset ( $id );
		if ($res) {
			$sql = "delete from manager where id = " . $id;
			$this->db->execute ( $sql );
		}
		return $res;
	}
	function mod($id, $password, $name) {
		$sql = "update manager set name = '" . $name . "'";
		if (isset ( $password ) && ! empty ( $password )) {
			$sql .= " ,password = md5(md5('" . $password . "'))";
		}
		$sql .= " where id = " . $id;
		$this->db->execute ( $sql );
	}
	function add($username, $password, $name) {
		$sql = "insert into manager (username,password,name) values ('" . $username . "',md5(md5('" . $password . "')),'" . $name . "')";
		$res = $this->db->execute ( $sql );
		if ($res == 1) {
			$res = "【" . $name . "】" . "管理员新增成功!";
		} else {
			$res = "【" . $name . "】" . "管理员新增失败，可能是登录名“" . $username . "”已存在!";
		}
		return $res;
	}
}
?>