<?php 

session_start();

if (isset($_SESSION["email"])) {
  $connect = mysqli_connect("localhost","root","","refponce");
  $consulta = mysqli_query($connect, "SELECT * FROM personas WHERE email='".$_SESSION["email"]."' LIMIT 1");
  $filas = $consulta->fetch_assoc();
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>paneladmin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="css/css/estilos.css">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <link href="http://cdn.materialdesignicons.com/3.7.95/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/script.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
  </head>

<body bgcolor="#E0E4E5">
<center><h4> REFACCIONARIA PONCE</h4></center><!-- -->
      <h5 style="text-align: right; position: absolute; top: 2%; left: 77.5%;"><?php if(isset($_SESSION["email"])){ ?>Bienvenido, <?php echo  $_SESSION['email']; ?> <?php } ?> </h5>
<div class="container">
<header class="header">
<div class="row">
</div>
</header>

  <!-- Navbar
    ================================================== -->

<nav class="navbar navbar-inverse" style="color: #E84C3D">
  <div class="container" style="width: 100%;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.php" title="Ponce Motors"><i class="material-icons">home</i></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 0){ ?>
        <li><a href="#" title="Mi Cuenta"><i class="material-icons">account_box</i></a></li>
        <?php } ?>
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 0){ ?>
        <li><a href="#" title="Mis Pedidos"><i class="material-icons">assignment</i></a></li>
        <?php } ?>
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 1){ ?>
        <li><a href="paneladmin.php" title="Panel"><i class="material-icons">web</i></a></li>
        <?php } ?>
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 1){ ?>
        <li><a href="stock.html" title="Stock"><i class="material-icons">assignment_turned_in</i></a></li>
        <?php } ?>
        <?php if(!isset($_SESSION["email"])){ ?>
        <li><a href="login.html" title="Login"><i class="material-icons">input</i></a></li>
        <?php } ?>
        <?php if(!isset($_SESSION["email"])){ ?>
        <li><a href="registro.html" title="Registrate"><i class="material-icons">event_note</i></a></li>
        <?php } ?>



       </ul>
      

      <ul class="nav navbar-nav navbar-right">

        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 0){ ?>



		<li><a href="carro.html" title="CARRITO"><i class="material-icons">shopping_cart</i></a></li> 
		<li><a href="ayuda.html" title="AYUDA"><i class="material-icons">help</i></a></li>
  	    <li><a href="contact.html" title="CONTACTO"><i class="material-icons">contacts</i></a></li> 
  	          <?php } ?>

        <?php if(isset($_SESSION["email"])){ ?>
        <li><a href="desconectar.php" title="Logout"><i class="material-icons">exit_to_app</i></a></li>
        <?php } ?>
       </ul>
      
       
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- ======================================================================================================================== -->
<div class="row">
	
	
		
	<div class="span12">

		<div class="caption">
		
<!--///////////////////////////////////////////////////Empieza cuerpo del documento interno////////////////////////////////////////////-->
		<h2><center> Mi Cuenta</h2>	</center>
		<div class="well well-small">
		<hr class="soft"/>
		<h4>Tabla de Usuarios</h4>
		<div class="row-fluid">
		



			<?php

				$conexion=mysqli_connect("localhost","root","","refponce");
				$sql = "SELECT * FROM personas";
	
//la variable  $mysqli viene de connect_db que lo traigo con el require("connect_db.php");
				$query=mysqli_query($conexion,$sql);

				echo "<table border='1'; class='table table-hover';>";
					echo "<tr class='warning'>";
					echo "<td>email</td>";
					echo "<td>Password</td>";
					echo "<td>RFC</td>";
					echo "<td>Telfono</td>";
					echo "<td>Direccion</td>";

						
						
					
						echo "<td>Editar</td>";
					echo "</tr>";

			    
			?>
			  
			<?php 
				 while($arreglo=mysqli_fetch_array($query)){
				  	echo "<tr class='success'>";
				  	echo "<td>$arreglo[4]</td>";
				    echo "<td>$arreglo[3]</td>";
				    echo "<td>$arreglo[1]</td>";
				    echo "<td>$arreglo[2]</td>";
				    echo "<td>$arreglo[5]</td>";

				    	
				    	
				    	echo "<td><a href='actualizar.php?id=$arreglo[0]'><img src='botadmin/actualizar.gif' class='img-rounded'></td>";
				
					echo "</tr>";
				}
				echo "</table>";

					

			?>
			
				  
			  			  
			  
		
		
		<div class="span8">
		
		</div>	
		</div>	
		<br/>
		


		<!--EMPIEZA DESLIZABLE-->
		
		 <!--TERMINA DESLIZABLE-->



		
		
		</div>

		


		

<!--///////////////////////////////////////////////////Termina cuerpo del documento interno////////////////////////////////////////////-->
</div>

	</div>
</div>
<!-- Footer
      ================================================== -->
<hr class="soften"/>
</div><!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="bootstrap/js/jquery-1.8.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	</style>
  </body>
</html>