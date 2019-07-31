<?php


//Almacenar los datos/variables
$correo=$_POST['email'];
$password=$_POST['password'];


define('METHOD','AES-256-CBC');
define('SECRET_KEY','ELIAS');
define('SECRET_IV','04082000');


	class SODA{
		
		public static function encryption($password)
		{
			$output=FALSE;
			$key=hash('sha256', SECRET_KEY);
			$iv=substr(hash('sha256', SECRET_IV), 0, 16);
			$output=openssl_encrypt($password, METHOD, $key, 0, $iv);
			$output=base64_encode($output);
			return $output;
		}

	}


$conexion=mysqli_connect("localhost", "root", "", "refponce"); 

//Consulta para insertar
$insertar = "INSERT INTO personas (email, password)
VALUES ('$correo','$output') ";


 //Ejecutar consulta 
 $resultado = mysqli_query($conexion, $insertar); 
 if(!$resultado){ 

 	echo '<script>alert("Error al registrase");</script> ';
     } 
     else { 

	   	echo '<script>alert("Usuario registrado exitosamente");</script>';

		header("Location: login.html");
            } 


        
//cerrar conexion 
 mysqli_close($conexion); 
         
?>

