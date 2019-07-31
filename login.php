<?php
	$correo=$_POST['email'];
	$password = $_POST['password'];

	$conexion=mysqli_connect("localhost","root","","refponce");


	define('METHOD','AES-256-CBC');
	define('SECRET_KEY','ELIAS');
	define('SECRET_IV','04082000');


	class SODA{
		
		public static function decryption($password){
			$key=hash('sha256', SECRET_KEY);
			$iv=substr(hash('sha256', SECRET_IV), 0, 16);
			$output=openssl_decrypt(base64_decode($password), METHOD, $key, 0, $iv);
			return $output;
		}
	}
/*
	$consulta2 = "SELECT * FROM personas WHERE email='$correo'";
	$res = mysqli_query($conexion, $consulta2);

	if ($res) {
		while ($filas=mysqli_fetch_assoc($res)) {
			$pass = $filas['password'];
		}
	}
*/

$consulta = "SELECT * FROM personas WHERE email='$correo' and password= '$password' ";

 //Ejecutar consulta 
 $resultado = mysqli_query($conexion, $consulta); 

 $filas=mysqli_num_rows($resultado);

 if($filas>0){
 	session_start();
 	$_SESSION['email'] = $correo; 
    header("location:index.php");
 }else{
		echo '<script>alert("ESTE USUARIO NO EXISTE, PORFAVOR REGISTRESE PARA PODER INGRESAR")</script> ';
			
		echo "<script>location.href='registro.html'</script>";
		}






//cerrar conexion 


mysqli_free_result($resultado); 
 mysqli_close($conexion); 
 ?>
 