<?php
class DBHelper {
	private $mysql_server_name = "localhost"; // 数据库服务器名称
	private $mysql_username = "root"; // 连接数据库用户名
	private $mysql_password = "root"; // 连接数据库密码
	private $mysql_database = "mynews"; // 数据库的名字
	private $conn; // 数据库连接
	function __construct() {
		$conn = mysql_connect ( $this->mysql_server_name, $this->mysql_username, $this->mysql_password ) or die ( "connect failed" . mysql_error () );
		mysql_select_db ( $this->mysql_database, $conn );
		mysql_query ( 'set names utf8' );
		$this->conn = $conn;
	}
	function execute($sql) {
		$res = mysql_query ( $sql, $this->conn );
		return $res;
	}
	function query($sql = 'select * from manager where 1=2') {
		$result = mysql_query ( $sql, $this->conn );
		$rowset = array ();
		if ($result) {
			while ( $row = mysql_fetch_row ( $result ) ) {
				$rowset [] = $row;
			}
		}
		mysql_free_result ( $result );
		return $rowset;
	}
	function page($sql, $page = 1, $page_size = 20) {
		// 获取总数据量
		$csql = "select count(a.id) as amount from (" . $sql . ") a";
		$result = mysql_query ( $csql, $this->conn );
		$row = mysql_fetch_row ( $result );
		$amount = $row [0];
		// 记算总共有多少页
		if ($amount) {
			if ($amount < $page_size) {
				$page_count = 1;
			} // 如果总数据量小于$PageSize，那么只有一页
			if ($amount % $page_size) { // 取总数据量除以每页数的余数
				$page_count = ( int ) ($amount / $page_size) + 1; // 如果有余数，则页数等于总数据量除以每页数的结果取整再加一
			} else {
				$page_count = $amount / $page_size; // 如果没有余数，则页数等于总数据量除以每页数的结果
			}
		} else {
			$page_count = 0;
		}
		// 翻页链接
		$page_string = '<nav class="mypage"><ul class="pagination">';
		
		if ($page == 1) {
			$page_string .= '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>';
			$page_string .= '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>';
		} else {
			$page_string .= '<li><a href="?pn=1">首页</a></li><li><a href="?pn=' . ($page - 1) . '">第一页</a></li>';
		}
		if (($page == $page_count) || ($page_count == 0)) {
			$page_string .= '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">下一月</span></a></li>';
			$page_string .= '<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">末页</span></a></li>';
		} else {
			$page_string .= '<li><a href="?pn=' . ($page + 1) . '">下一页</a></li><li><a href="?pn=' . $page_count . '">尾页</a></li>';
		}
		$page_string .= '</ul></nav>';
		// 获取数据，以二维数组格式返回结果
		$rowset = array ();
		if ($amount) {
			$sql .= " order by id desc limit " . ($page - 1) * $page_size . ", $page_size";
			mysql_query ( "SET NAMES 'utf8'" );
			$result = mysql_query ( $sql );
			if ($result) {
				while ( $row = mysql_fetch_row ( $result ) ) {
					$rowset [] = $row;
				}
			}
		} else {
			$rowset = array ();
		}
		return array (
				'data' => $rowset,
				'pagehtml' => $page_string 
		);
	}
}
?>