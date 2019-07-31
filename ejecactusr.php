<?php
    session_start();
	
 	Guardar($_POST['email'], $_POST['pass'], $_POST['tel'],$_POST['rfc'], $_POST['dir']);

 	function Guardar($email, $pass, $tel, $rfc, $dir){
	require("database.php");

	$sql="UPDATE personas SET email='$email', password='$pass', Telefono='$tel', rfc='$rfc', 
	direccion='$dir' WHERE email='$email'";

	$ressql=mysqli_query($mysqli,$sql);
	//la variable  $mysqli viene de connect_db que lo traigo con el require("connect_db.php");
	if (!$ressql) {
		echo "Error de procesamieno no se han actuaizado los datos";
		echo '<script>alert("ERROR EN PROCESAMIENTO NO SE ACTUALIZARON LOS DATOS")</script> ';
		header("location: actualizarusr.php");
		echo "<script>location.href='actualizarusr.php'</script>";
	}else {
		echo '<script>alert("REGISTRO ACTUALIZADO")</script> ';
		
		echo "<script>location.href='actualizarusr.php'</script>";
	}
}
?>