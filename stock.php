<?php 
session_start(); 
?>
<?php 

	$id = $_POST['id'];
	$nombre = $_POST['nombre'];
	$categoria = $_POST['categoria'];
	$desc = $_POST['desc'];
	$stock = $_POST['stock'];
	$precio = $_POST['precio'];
	$imagen = $_POST['imagen'];	
		
		
	include 'database.php';
	$con = "INSERT INTO producto (Id_prod, nom_prod, desc_prod, stock, precio, imagen) VALUES ('".$id."','".$nombre."','".$categoria."','".$desc."','".$stock."','".$precio."','".$imagen."')";

	$res = mysqli_query($mysqli, $con);

	if ($res) {
	 echo "Agregado bien prronxd";
	 header("Location: stock.html");

	}else{
	 echo "Agregado mal prro";
	}
?>