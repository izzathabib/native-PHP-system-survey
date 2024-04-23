<?php
include 'db_connect.php';
// Fetch data from database
$qry = $conn->query("SELECT * FROM users where id = ".$_GET['id'])->fetch_array();
foreach($qry as $k => $v){
	$$k = $v;
}
// ---End fetch data---
include 'new_user.php';
