<?php


 	Guardar($_POST['id'], $_POST['email'], $_POST['pass'], $_POST['tel'], $_POST['rfc']);

 	function Guardar($id, $email, $pass, $tel, $rfc){
	require("database.php");
	$sql="UPDATE personas SET email='$email', password='$pass', Telefono='$tel', rfc='$rfc' WHERE Id_p='$id'";
	$ressql=mysqli_query($mysqli,$sql);
	//la variable  $mysqli viene de connect_db que lo traigo con el require("connect_db.php");
	$resent=mysqli_query($sql);
	if ($resent==null) {
		echo "Error de procesamieno no se han actuaizado los datos";
		echo '<script>alert("ERROR EN PROCESAMIENTO NO SE ACTUALIZARON LOS DATOS")</script> ';
		header("location: paneladmin.php");
		
		echo "<script>location.href='paneladmin.php'</script>";
	}else {
		echo '<script>alert("REGISTRO ACTUALIZADO")</script> ';
		
		echo "<script>location.href='paneladmin.php'</script>";	
	}
}
?>