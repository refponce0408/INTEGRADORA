



<form class="navbar-form navbar-right">



<form action="buscador.php" method="GET">
	<input id="busca"  name="busca" type="text"  placeholder="Buscar" >
    <button type="submit" title="BUSCAR"><i class="material-icons">search</i></button>
</form>

<?php
	error_reporting(0);
	include 'database.php';

	$buscar = $_GET['busca'];


		$sql = "SELECT * FROM producto WHERE nom_prod LIKE '".$buscar."%'";


	$res = mysqli_query($mysqli, $sql);
	if($res){
	while ($filas = mysqli_fetch_assoc($res)) {
			 
			echo $filas["nom_prod"];

			echo "<div>";

			echo "<center><img src='img/"; echo $filas["imagen"]; 

			echo "<div class=''>";

			echo "$";

			echo $filas["precio"];

			echo " ";

			echo "<form action='' method='GET'>";

			echo "<input type='hidden' name='id' id='id' value='"; echo $filas['id']; echo "'>";


			echo "<input type='hidden' name='nom_prod' id='nombre' value='"; echo $filas['nom_prod']; echo "'>";

		
			echo "<input type='hidden' name='precio' id='precio' value='"; echo $filas['precio']; echo "'>";

			echo "<input type='hidden' name='cant' id='cant' value='"; echo 1; echo "'>";
			?>


			<?php { ?>
			<button onclick="M.toast({html: 'Agregado al carrito'})" class="btn waves-effect waves-light" type="submit" name="btnAccion" value="agregar">Comprar <i class="material-icons right">shopping_cart</i>
  			</button>
			<?php } ?>


			<?php
 			
	}
	mysqli_free_result($res);
	mysqli_close($mysqli);
}


?>

