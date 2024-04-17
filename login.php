<!DOCTYPE html>
<html lang="en">
<?php
//Store user behavior 
session_start();
include('./db_connect.php');
?>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Login | Online Survey System</title>
 	
<!--There were stysheet and web page title formatting in header.php-->
<?php include('./header.php'); ?>
<?php 
//Check whether $_SESSION already has its value or not
if(isset($_SESSION['login_id']))
//If yes it will redirect to the index.php
header("location:index.php?page=home");

?>

</head>
<style>
	body{
		width: 100%;
	    height: calc(100%);
	    position: fixed;
	    top:0;
	    left: 0
	    /*background: #007bff;*/
	}
	main#main{
		width:100%;
		height: calc(100%);
		display: flex;
	}

</style>

<body class="bg-dark">


  <main id="main" >
  	
  	<div class="align-self-center w-100">
		<h4 class="text-white text-center"><b>Online Survey System</b></h4>
  		<div id="login-center" class="bg-dark row justify-content-center">
  			<div class="card col-md-4">
  				<div class="card-body">
  					<form id="login-form" >
  						<div class="form-group">
  							<label for="email" class="control-label text-dark">Email</label>
  							<input type="text" id="email" name="email" class="form-control form-control-sm">
  						</div>
  						<div class="form-group">
  							<label for="password" class="control-label text-dark">Password</label>
  							<input type="password" id="password" name="password" class="form-control form-control-sm">
  						</div>
  						<center><button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Login</button></center>
  					</form>
  				</div>
  			</div>
  		</div>
  	</div>
  </main>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


</body>
<script>
	$('#login-form').submit(function(e){
		e.preventDefault()
		//Disable button when it is already clicked. To indicate the user that the button has been clicked
		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		//Used to handle login process without need to reload the entire web page
		$.ajax({
			url:'ajax.php?action=login', /*That serialize data was 
																		sent to ajax.php*/
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
				//If error occur .removeAttr('disabled') will bu used to re-enable the login button
				$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
			},
			success:function(resp){
				if(resp == 1){
					//If login succesful it will load the home page
					location.href ='index.php?page=home';
				}else{
					//Display error message
					$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
					//Re-enable login button
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		})
	})
	//The function will trigger when user input data in html element with class .number
	$('.number').on('input',function(){
				//Retrieve current value of the element store in variable val
        var val = $(this).val()
				//Sanitize input contains only number and comma
        val = val.replace(/[^0-9 \,]/, '');
				//Store the updated value after been sanitized
        $(this).val(val)
    })
</script>	
</html>