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
  <title>INDEX</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <link href="http://cdn.materialdesignicons.com/3.7.95/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <script src="js/jquery-3.2.1.js"></script>
    <script src="js/script.js"></script>

  <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
       <link rel="stylesheet" href="css/css/estilos.css">

</head>
<body>

  

      <center><h4> REFACCIONARIA PONCE</h4></center><!-- -->
      <h5 style="text-align: right; position: absolute; top: 2%; left: 85%;"><?php if(isset($_SESSION["email"])){ ?>Bienvenido, <?php echo  $_SESSION['email']; ?> <?php } ?> </h5>

	<nav class="navbar navbar-inverse " style="color: #E84C3D">
  <div class="container">
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
          
        <li><a href="actualizarusr.php" title="Mi Cuenta"><i class="material-icons">account_box</i></a></li>
        <?php } ?>
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 0){ ?>
        <li><a href="#" title="Mis Pedidos"><i class="material-icons">assignment</i></a></li>
        <?php } ?>
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 1){ ?>
        <li><a href="paneladmin.php" title="Panel"><i class="material-icons">web</i></a></li>
        <?php } ?>
        <?php if(isset($_SESSION["email"]) && $filas['rol'] == 1){ ?>
        <li><a href="stock.html " title="Stock"><i class="material-icons">assignment_turned_in</i></a></li>
        <?php } ?> <MAIN></MAIN>
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
      
      <ul class="nav navbar-nav navbar-right">

        <?php if(!isset($_SESSION["email"])){ ?>
        <li><a href="carro.html" title="CARRITO"><i class="material-icons">shopping_cart</i></a></li> 
        <li><a href="ayuda.html" title="AYUDA"><i class="material-icons">help</i></a></li>
        <li><a href="contact.html" title="CONTACTO"><i class="material-icons">contacts</i></a></li> 
        <?php } ?>
       </ul>

       
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<div class="wrap">



 <?php

     include 'database.php'; 

    ?>




    <h4>Productos Destacados</h4>


        <?php

        echo "<div class='categorias'>"; 
        echo " <div class='category'>";
        echo "<a href='' class='category_item' category='all'>Todo</a>";
        echo "<a href='' class='category_item' category='Afinación y mantenimiento'>Afinación y mantenimiento</a>";
        echo " <a href='' class='category_item' category='Frenos y control de tracción'>Frenos y control de tracción</a>";
        echo " <a href='' class='category_item' category='Productos eléctricos e iluminación'>Productos eléctricos e iluminación</a>";

        

        echo "</div>";

        echo "<section class='products-list'>";

          $consu = "SELECT * FROM producto";    

          $res = mysqli_query($mysqli, $consu);

            if($res){
              while ($filas = mysqli_fetch_assoc($res)) {

             echo '<div class="product-item" category="Frenos y control de tracción">';

             echo "<div text-align: center; font-size: 150%; color: black; margin: 5px; margin-left: 5.5%; margin-bottom: 2%; height: 250px; width: 415px;'>"; 
              echo '<h5 style="font-size: 15px; text-align: center;">';
            echo $filas["nom_prod"];
            echo '</h5>';

              echo "<center><img src='img/"; echo $filas["imagen"]; echo "'"; echo '</center>'; 
            echo " ";
            echo " <button style='height:40px; width:150px ;' onclick='M.toast({html: 'Producto Agregado Al Carrito'})'' class='' type='submit' name='btnAccion' value='agregar'>";

            echo "Comprar";

            echo "<i class='material-icons right'>shopping_cart</i>";
            echo " <br>";

            echo "</button>";

            echo " ";
            echo "<form action='' method='GET'>"; 

            echo "<input type='hidden' name='id' id='id' value='"; echo $filas['id']; echo "'>";

            echo "<input type='hidden' name='nom_prod' id='nombre' value='"; echo $filas['nom_prod']; echo "'>";
          
            echo "<input type='hidden' name='precio' id='precio' value='"; echo $filas['precio']; echo "'>";

            echo "<input type='hidden' name='cant' id='cant' value='"; echo 1; echo "'>";

            echo '</div>';
                        echo '</div>';


                       ?>
                  
     
        <?php
               }
            }
            
        ?>
    
</body>
</html>