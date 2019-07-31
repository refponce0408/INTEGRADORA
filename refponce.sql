-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2019 a las 02:16:00
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `refponce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_cat` int(11) NOT NULL COMMENT 'este atriburo representa el id con el que se identificará la categoría',
  `Id_prod` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el producto',
  `nom_cat` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el nombre de la categoría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ctrl_acceso`
--

CREATE TABLE `ctrl_acceso` (
  `Id_acceso` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el control de acceso de los usuarios.',
  `id_per` int(11) NOT NULL COMMENT 'este atributo representa el Id con el que se identificara el usuario.',
  `hora_acc` time NOT NULL COMMENT 'este atributo represent la fecha de acceso del cliente a la pagina.',
  `hora_sal` time NOT NULL COMMENT 'este atributo representa la hora de salida del usuario.',
  `fecha_acc` date NOT NULL COMMENT 'este atributo representa la fecha de acceso del usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ctrl_acciones`
--

CREATE TABLE `ctrl_acciones` (
  `Id_acciones` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el control de acciones de los usuarios.',
  `id_user` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el usuario.',
  `tabla` char(30) COLLATE utf8mb4_spanish2_ci NOT NULL COMMENT 'este atributo representa la tabla en el que el usuario realizó una acción.',
  `accion` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL COMMENT 'este atributo representa la acción que realizó el usuario.',
  `dato_ant` varchar(55) COLLATE utf8mb4_spanish2_ci NOT NULL COMMENT 'este aributo representa el dato anterior que estaba en la tabla seleccionada.',
  `dato_new` varchar(55) COLLATE utf8mb4_spanish2_ci NOT NULL COMMENT 'este aributo representa el dato nuevo que remplazó por el dato anterior.',
  `fecha_hora_accion` datetime NOT NULL COMMENT 'este atributo representa la fecha y hora en que se realizó la acción del usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_ped`
--

CREATE TABLE `det_ped` (
  `Id_detped` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el detalle del pedido del cliente.',
  `Id_ped` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el pedido del cliente.',
  `Id_prod` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el producto',
  `cantidad` int(11) NOT NULL COMMENT 'este atributo representa la cantidad de artículos en el pedido.',
  `p/u` float NOT NULL COMMENT 'este atributo representa el precio unitario de cada articulo.  ',
  `subtotal` float NOT NULL COMMENT 'este atributo representa el subtotal del pedido.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `Id_dir` int(11) NOT NULL COMMENT 'este atributo representa el Id  con el que se identificara la dirección del usuario.',
  `id_p` int(11) NOT NULL,
  `calle` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el nombre de la calle del usuario.',
  `colonia` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el nombre de la colonia del usuario.',
  `cp` int(11) NOT NULL COMMENT 'este atributo representa el código postal del usuario.',
  `n_int` int(11) NOT NULL COMMENT 'este atributo representa el número interior de la casa del usuario.',
  `n_ext` int(11) NOT NULL COMMENT 'este atributo representa el número exterior de la casa del usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombres`
--

CREATE TABLE `nombres` (
  `ctrl_reg` int(11) NOT NULL COMMENT 'este atributo representa el número de control de registro del nombre del usuario.',
  `id_p` int(11) NOT NULL,
  `Nombre` varchar(55) COLLATE utf8mb4_spanish_ci DEFAULT NULL COMMENT 'este atributo representa el/los nombre(s) del usuario.',
  `App` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el apellido paterno del usuario.',
  `Apm` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el apellido materno del usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id_ped` int(11) NOT NULL COMMENT 'este atributo representa el id del pedido del usuario.',
  `Id_vende` int(11) NOT NULL COMMENT 'este atributo representa el Id del usuario.',
  `Id_compra` int(11) NOT NULL,
  `fecha_ped` date NOT NULL COMMENT 'este atributo representa la fecha en que se realizó el pedido.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `Id_p` int(11) NOT NULL COMMENT 'este atributo representa el Id del usuario.',
  `rfc` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa la RFC del usuario.',
  `Telefono` int(15) DEFAULT NULL COMMENT 'este atributo representa el número de teléfono del usuario.',
  `password` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa la contraseña para el acceso a la cuenta de la pagina del usuario.',
  `email` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el correo electrónico del usuario.',
  `direccion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `pasadmin` varchar(250) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Tipo_per` enum('Adm','Emp','Cte') COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Cte' COMMENT 'este atributo representa el tipo de usuario.',
  `rol` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`Id_p`, `rfc`, `Telefono`, `password`, `email`, `direccion`, `pasadmin`, `Tipo_per`, `rol`) VALUES
(81, 'AHSGB755', 1234567897, 'clara123', 'clara@hotmail.com', 'concha', '', 'Cte', 0),
(82, '', NULL, '12345', 'test1@gmailcom', '', '', 'Adm', 1),
(84, '', NULL, '123', 'morelos', '', '', 'Cte', 0),
(92, '', NULL, '12345', 'cesar@gmail.com', '', '', 'Cte', 0),
(93, '', NULL, '12345', 'sin@gmail.com', '', '', 'Cte', 0),
(94, '', 0, '12345', 'ded@gmail.com', '', '', 'Cte', 0),
(97, '', NULL, '123', 'mma@gmail.com', '', '', 'Cte', 0),
(100, '', 0, '$2y$10$ouxPSgRNT1gzOPf5p.TAs.ypjblqcMCi2noy7XmsYyH1AIr5', 'admon@gmail.com', '', '', 'Adm', 1),
(102, '', 0, '$2y$10$CFfxN/eHGYFD4p9nggpQDOX2ThULLkqcn.1sPpdEaPEazOwV', 'mastercrown@gmail.com', '', '', 'Adm', 1),
(108, 'EEEEEEE10', 244343544, '0408', 'coca@gmail.com', '', '', 'Cte', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_prod` int(11) NOT NULL COMMENT 'este atributo representa el id con el que se identificara el producto',
  `nom_prod` varchar(55) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el nombre del producto',
  `desc_prod` varchar(800) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa la descripción del producto',
  `stock` int(11) NOT NULL COMMENT 'este atributo representa la cantidad del producto ',
  `precio` varchar(5) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'este atributo representa el precio del producto',
  `imagen` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_prod`, `nom_prod`, `desc_prod`, `stock`, `precio`, `imagen`) VALUES
(1, 'Bujia NGK', 'Las bujías NGK Laser Platinum aprobadas por el fabrican', 5, '300', 'bujia1.jpg'),
(2, 'Duralast Bujia', 'Electrodo central de platino para vida útil más larga. ', 5, '250', 'bujia2.jpg'),
(3, 'Bosch Iridium Bujia ', 'La única línea de bujías de iridio diseñadas tanto para alto rendimiento como para larga vida útil. Los electrodos centrales y a tierra con punta de iridio soldados con láser (doble iridio) proveen una excepcional larga vida útil.', 10, '250', 'bujia3.1.0.jpg'),
(4, 'Duralast Bujia ', 'Electrodo central de platino para vida útil más larga. La carcasa niquelada reduce la corrosión y el agarrotamiento. Aislante de cerámica acanalado para reducir saltos de corriente de la bujía. La punta cónica mejora la combustión y el encendido.', 20, '210', 'bujia4.jpg'),
(5, 'Bujia Motorcraft Platinum', 'Probada a especificaciones Ford para rendimiento y estándares de emisiones.', 10, '250', 'bujia5.0.png'),
(6, 'Duralast Gold Bateria ', 'Garantía superior. Capacidades que exceden los requerimientos de Equipo Original. Libre de Mantenimiento. Ciclos de vida más largos. Fabricada con tecnología de última generación.', 10, '800', 'bateria1.jpg'),
(7, 'Duralast Gold Bateria', 'Garantía superior. Capacidades que exceden los requerimientos de Equipo Original. Libre de Mantenimiento. Ciclos de vida más largos. Fabricada con tecnología de última generación.', 15, '870', 'bateria2.jpg'),
(8, 'Duralast Gold Bateria', 'Garantía superior. Capacidades que exceden los requerimientos de Equipo Original. Libre de Mantenimiento. Ciclos de vida más largos. Fabricada con tecnología de última generación.', 15, '820', 'bateria3.jpg'),
(9, 'Valucraft Bateria', 'Garantía justa de acuerdo al segmento. Producto calidad a bajo costo. Capacidad de Arranque optima de acuerdo a necesidad. Libre de Mantenimiento.', 10, '900', 'bateria4.jpg'),
(10, 'Valucraft Bateria', 'Garantía justa de acuerdo al segmento. Producto calidad a bajo costo. Capacidad de Arranque optima de acuerdo a necesidad. Libre de Mantenimiento.', 10, '899', 'bateria5.jpg'),
(11, 'Duralast Gold Balata- Front', '-	Número de refacción:	DG1596\r\n-	Ubicación:	Front\r\n-	Peso:	1.44lb\r\n', 10, '850', 'balata1.jpg'),
(12, 'Duralast Gold Balata- Front', '-	Detalles del producto\r\n-	Número de refacción:	DG96\r\n-	Ubicación:	Front\r\n-	Peso:	1.94lb\r\n', 10, '800', 'balata2.jpg'),
(13, 'Duralast Gold Balata- Front', '-	Número de refacción:	DG768AES\r\n-	Ubicación:	Front\r\n-	Peso:	1.59lb \r\n', 10, '610', 'balata3.jpg'),
(14, 'Valucraft Balata- Front ', '-	Número de refacción:	MKD768AV\r\n-	Ubicación:	Front\r\n-	Peso:	1.89lb\r\n', 10, '400', 'balata4.jpg'),
(15, 'Valucraft Balata- Front ', 'Esta balata ofrece un rendimiento estándar.\r\n-	Número de refacción: MKD273V\r\n-	Ubicación: FRONT\r\n-	Peso:  2.60lb\r\n', 10, '500', 'balata5.jpg'),
(16, 'Duralast Rotor - Freno Delantero ', 'Los rotores de frenos de disco marca Duralast se diseñan y fabrican para cumplir con la especificación SAE J431 y el rendimiento de equipo original de su vehículo. Nuestros rotores Duralast pueden reemplazar las partes de OE sin cambio en rendimiento y seguridad. \r\n\r\nDetalles del producto\r\n\r\n-Número de refacción:	F-DL55097\r\n-Ubicación:	Front\r\n-Peso:	30.32lb\r\n', 50, '1,250', 'rotor1.jpg'),
(17, 'Duralast Rotor - Freno Trasero ', 'Los rotores de frenos de disco marca Duralast se diseñan y fabrican para cumplir con la especificación SAE J431 y el rendimiento de equipo original de su vehículo.\r\n**Detalles del producto \r\n- Numero de refacción: J-DL5615\r\nUbicación: Front\r\n- - Peso: 34.43lb\r\n- Cantidad de orificios o birlos: 10\r\n- Grosor mínimo (mm): 33.53\r\n- Orificios o birlos: Orificios\r\n- Material del rotor: Aleación de hierro\r\n\r\n', 50, '1,040', 'rotor2.jpg'),
(18, 'Duralast Rotor - Freno Delantero ', 'Los rotores de frenos de disco marca Duralast se diseñan y fabrican para cumplir con la especificación SAE J431 y el rendimiento de equipo original de su vehículo. \r\n**Detalles del producto: \r\n- Numero de refacción: H-DL5549\r\n- Ubicación: Front \r\n- Peso: 27.01lb \r\n- Cantidad de orificios o birlos: 5\r\n- Grosor mínimo (mm): 24.28 mm\r\n- Orificios o birlos: Birlo\r\n- Material del rotor: Aleación de hierro\r\n', 50, '1,129', 'rotor3.jpg'),
(19, 'Duralast Rotor - Freno Delantero ', 'Los rotores de frenos de disco marca Duralast se diseñan y fabrican para cumplir con la especificación SAE J431 y el rendimiento de equipo original de su vehículo.\r\n** Detalles del producto: \r\n- Numero de refacción: B-DL3183\r\n- Ubicación: Front \r\n- Peso:  10.58lb \r\n- Cantidad de orificios o birlos: 4\r\n- Grosor mínimo (mm): 16.002 mm \r\n- Orificios o birlos: Orificios\r\n- Material del rotor: Aleación de hierro\r\n', 50, '1,200', 'rotor4.jpg'),
(20, 'Duralast Rotor - Freno ', 'Los rotores de frenos de disco marca Duralast se diseñan y fabrican para cumplir con la especificación SAE J431 y el rendimiento de equipo original de su vehículo. \r\n**Detalles del producto: \r\n- Numero de refacción: D-DL5381\r\n- Ubicación: Front \r\n- Peso:  13.23lb \r\n- Cantidad de orificios o birlos: 5	\r\n- Grosor mínimo (mm):  21.34 mm\r\n- Orificios o birlos: Orificios\r\n- Material del rotor: Aleación de hierro\r\n', 50, '520', 'rotor5.jpg'),
(21, 'Duralast  Mordaza de Freno ', 'Las mordazas de freno Duralast se fabrican bajo los estándares de calidad más estrictos, en instalaciones de última tecnología. \r\nDetalles del producto: \r\n• Numero de refacción: C8585\r\n• Peso:   5.00lb\r\n• Número de pistones de los frenos: 1\r\n• Acabado de la mordaza de los frenos: Sin acabado\r\n• Tamaño de la rosca de entrada de la manguera/línea de los frenos: M10x1\r\n', 50, '1,900', 'mordaza1.jpg'),
(22, 'Duralast Mordaza de Freno ', 'Las mordazas Duralast se remanufacturan para igualar o exceder el rendimiento del OEM.\r\n**Detalles del producto: \r\n• Numero de refacción: C8585\r\n• Peso:   5.00lb\r\n• Número de pistones de los frenos: 1\r\n• Acabado de la mordaza de los frenos: Sin acabado\r\n• Tamaño de la rosca de entrada de la manguera/línea de los frenos: M10x1\r\n• Soporte de mordaza incluido: No\r\n', 50, '1,700', 'mordaza2.jpg'),
(23, 'Duralast  Mordaza de Freno ', 'Las mordazas de freno Duralast se fabrican bajo los estándares de calidad más estrictos, en instalaciones de última tecnología.\r\n**Detalles del producto: \r\n• Numero de refacción: D8069\r\n• Peso:   20.82lb\r\n• Número de pistones de los frenos: 2\r\n• Acabado de la mordaza de los frenos: Sin acabado\r\n• Soporte de mordaza incluido: No\r\n', 50, '3,900', 'mordaza3.jpg'),
(24, 'Duralast  Mordaza de Freno C516', 'Las mordazas de freno Duralast se fabrican bajo los estándares de calidad más estrictos, en instalaciones de última tecnología. \r\n**Detalles del producto: \r\n• Numero de refacción: C516\r\n• Peso:   8.75lb\r\n• Número de pistones de los frenos: 2\r\n• Acabado de la mordaza de los frenos: Sin acabado\r\n• Soporte de mordaza incluido: No\r\n', 50, '1,200', 'mordaza4.jpg'),
(25, 'Duralast  Mordaza de Freno D5351 ', 'Las mordazas Duralast se remanufacturan para igualar o exceder el rendimiento del OEM.\r\n**Detalles del producto: \r\n- Numero de refacción: D5351\r\n- Peso:   16.25lb\r\n- Número de pistones de los frenos: 2\r\n- Acabado de la mordaza de los frenos: Sin acabado\r\n- Tamaño de la rosca de entrada de la manguera/línea de los frenos: 3/8 pulg.x24\r\n- Soporte de mordaza incluido: No\r\n', 50, '1,100', 'mordaza5.jpg'),
(26, 'Fram ExtendedGuar Filtro de Aceite ', 'El filtro de aceite Ultra Synthetic FRAM es nuestro mejor filtro. El medio filtrante sintético y de celulosa con doble capa se refuerza con un cedazo de metal y atrapa el 99% de la suciedad.\r\n** Detalles del producto \r\n- Número de refacción: XG3600\r\n- Peso: 1.00lb\r\n- Tamaño de la rosca del filtro: 3/4 pulg. – 16\r\n- Diámetro exterior del filtro (pulg.):	2.98\r\n- Altura del filtro (pulg.): 4.92\r\n- Remoción de tuerca:No\r\n- Estilo de filtro: Depósito enroscable\r\n', 50, '210', 'filtro1.jpg'),
(27, 'Fram ExtendedGuar Filtro de Aceite ', 'El filtro de aceite Ultra Synthetic FRAM es nuestro mejor filtro. El medio filtrante sintético y de celulosa con doble capa se refuerza con un cedazo de metal y atrapa el 99% de la suciedad. \r\n** Detalles del producto \r\n- Número de refacción: XG3387A\r\n- Peso: 0.72lb\r\n- Tamaño de la rosca del filtro: 18 x 1.5 mm\r\n- Diámetro exterior del filtro (pulg.): 2.98 \r\n- Altura del filtro (pulg.): 3.98\r\n- Remoción de tuerca: No\r\n- Estilo de filtro: Depósito enroscable\r\n', 50, '180', 'filtro2.jpg'),
(28, 'Fram ExtendedGuar Filtro de Aceite ', 'El filtro de aceite Ultra Synthetic FRAM es nuestro mejor filtro. El medio filtrante sintético y de celulosa con doble capa se refuerza con un cedazo de metal y atrapa el 99% de la suciedad. \r\n** Detalles del producto \r\n- Número de refacción: XG5\r\n- Peso: 1.40lb\r\n- Tamaño de la rosca del filtro: 13/16 pulg. - 16\r\n- Diámetro exterior del filtro (pulg.): 3.78 \r\n- Altura del filtro (pulg.): 5.17\r\n- Remoción de tuerca: No\r\n- Estilo de filtro: Depósito enroscable\r\n- Empuñadura antideslizable: sí\r\n', 50, '200', 'filtro3.jpg'),
(29, 'Fram ExtendedGuar Filtro de Aceite ', 'El filtro de aceite Ultra Synthetic FRAM es nuestro mejor filtro. El medio filtrante sintético y de celulosa con doble capa se refuerza con un cedazo de metal y atrapa el 99% de la suciedad. \r\n**Detalles del producto \r\n- Número de refacción: XG3976A\r\n- Peso: 1.64lb\r\n- Tamaño de la rosca del filtro: 1 - 16 pulg.\r\n- Diámetro exterior del filtro (pulg.): 3.66\r\n- Altura del filtro (pulg.): 6.91\r\n- Remoción de tuerca: No\r\n- Estilo de filtro: Depósito enroscable\r\n- Empuñadura antideslizable: no\r\n', 50, '330', 'filtro4.jpg'),
(30, 'Fram ExtendedGuar Filtro de Aceite', 'El filtro de aceite Ultra Synthetic  FRAM es nuestro mejor filtro. El medio filtrante sintético y de celulosa con doble capa se refuerza con un cedazo de metal y atrapa el 99% de la suciedad.\r\n**Detalles del producto \r\n- Número de refacción: XG8A\r\n- Peso: 1.35lb\r\n- Tamaño de la rosca del filtro: 3/4 pulg. - 16\r\n- Diámetro exterior del filtro (pulg.): 3.8\r\n- Altura del filtro (pulg.): 5.14\r\n- Remoción de tuerca: No\r\n- Estilo de filtro: Depósito enroscable\r\n', 50, '190', 'filtro5.jpg'),
(31, 'STP Filtro de ', 'Los filtros de aire STP se fabrican de acuerdo a los estándares más altos para proporcionar una capacidad de retención óptima, eficiencia de filtración y máxima protección para su motor contra los nocivos contaminantes aerotransportados.\r\n**Detalles del producto \r\n- Número de refacción: SA10497\r\n- Peso: 1.07lb\r\n- Filtro lavable:no\r\n- Filtro de aire prefiltrado:no\r\n- Incluye aceite para filtro de aire: No requiere aceite para filtro\r\n-	Forma del filtro de aire: Rectangular\r\n- Diseño del bastidor ', 50, '250', 'aire1.jpg'),
(32, 'STP Filtro de Aire ', 'Medio de filtro de aire de tecnología avanzada de exclusivo micropore que provee una mayor capacidad de retención de suciedad para una protección máxima del motor. Un filtro de aire limpio contribuirá en la eficiencia y desempeño de su vehículo.\r\n**Detalles del producto \r\n- Número de refacción: SA9711\r\n- Peso: 0.93lb\r\n- Longitud: 13.56 pulg. (344 mm.) \r\n- Altura: 2.75 pulg. (70 mm.)\r\n- Anchura: 5.33 pulg. (135 mm.)\r\n', 50, '230', 'aire2.jpg'),
(33, 'STP Filtro de Aire ', 'Los filtros de aire STP se fabrican de acuerdo a los estándares más altos para proporcionar una capacidad de retención óptima, eficiencia de filtración y máxima protección para su motor contra los nocivos contaminantes aerotransportados.\r\n**Detalles del producto \r\n- Número de refacción: SA10088\r\n- Peso: 0.56lb\r\n- Filtro lavable:no\r\n- Filtro de aire prefiltrado:no\r\n- Incluye aceite para filtro de aire: No requiere aceite para filtro\r\n- Forma del filtro de aire: Rectangular\r\n- Diseño del bastidor ', 50, '1,200', 'aire3.jpg'),
(34, 'K&N High Performance Filtro de Aire ', 'Los filtros de aire de reemplazo K&N se diseñan para incrementar la potencia y la aceleración mientras proveen excelente filtración. Hacemos más de 1200 filtros de aire de reemplazo diferentes para la mayoría de los vehículos en circulación. Estos filtros son lavables, reutilizables y de diseño personalizado para ajustar en la caja de aire de fábrica existente.\r\n**Detalles del producto \r\n- Número de refacción: 33-2362\r\n- Peso: 1.00lb\r\n- Filtro lavable:si\r\n- Filtro de aire prefiltrado:no\r\n- Anchu', 50, '1,389', 'aire4.jpg'),
(35, 'STP Filtro de Aire ', 'Medio de filtro de aire de tecnología avanzada de exclusivo micropore que provee una mayor capacidad de retención de suciedad para una protección máxima del motor. Un filtro de aire limpio contribuirá en la eficiencia y desempeño de su vehículo.\r\n**Detalles del producto \r\n- Número de refacción: SA10488\r\n- Peso: 0.84lb \r\n- Longitud: 7.87 pulg. (200 mm.)\r\n- Altura: 2.30 pulg. (58 mm.)\r\n- Anchura: 8.44 pulg. (214 mm.)\r\n', 50, '600', 'aire5.jpg'),
(36, 'Eiko Foco/Luz de Esquina ', 'Detalles del producto\r\n- Número de refacción: H755-BPMX\r\n- Aplicación: Hatchback\r\n- Vidrio: transparente (T3-1/2). \r\n- Filamentos: 1. \r\n- Watts: 55. \r\n- Base: 2 puntas (PX26d).\r\n', 50, '100', 'focoesquina1.jpg'),
(37, 'Valucraft Faro/Foco Delantero ', '**Detalles del producto\r\n- Número de refacción: 01003-BPMX\r\n- Aplicación: Haz de luz bajo\r\n- Aplicación: Modelo posterior (Producción)\r\n- Aplicación: Con luces delanteras de cápsula de halógeno.\r\n', 50, '100', 'focoesquina2.jpg'),
(38, 'Eiko Foco/Luz de Esquina  ', '**Detalles del producto:\r\n- Número de refacción: H1155-BPMX\r\n- Haz de luz alta y baja\r\n', 50, '150', 'focoesquina3.jpg'),
(39, 'Eiko Foco/Luz de Estribo/Cortesia  ', '**Detalles del producto:\r\n- Número de refacción: 9006-BPMX\r\n- Aplicación: Haz de luz bajo\r\n- Aplicación: Con luces delanteras tipo proyector\r\n', 50, '150', 'focoesquina4.jpg'),
(40, 'Eiko Foco/Luz de Uso de Dia', '**Detalles del producto:\r\n- Número de refacción:	9005-BPMX\r\n- Peso:	0.10lb\r\n- Notas:	Ingrese la información de su vehículo arriba para ver los detalles del producto.\r\n- Descripción:	12.8V 65W - HB3 60217 /T4-5/8 Ángulo preenfocado RT\r\n- Aplicaciones:	Faro\r\n- Tipo:	Reemplazo directo de OEM\r\n', 50, '100', 'focoesquina5.jpg'),
(41, 'Duralast Ignición – Interruptor', 'Todos los interruptores Duralast® están fabricados para cumplir o exceder el desempeño de OE, para que pueda instalarlos con confianza cada vez.\r\n**Detalles del producto: \r\n- Número de refacción:  LS559 \r\n- Peso:  0.39lb  \r\n- Grado del artículo: Estándar de OEM \r\n- Configuración del conector/terminal: Cuchilla/9 cuchillas, cuchilla \r\n- Contenido del paquete: 1 interruptor \r\n- Color/acabado de la caja de aire: Gris, negro/plástico\r\n', 50, '1,500', 'interruptor1.jpg'),
(42, 'Duralast Ignicion – Interruptor ', 'Todos los interruptores Duralast están fabricados para cumplir o exceder el desempeño de OE, para que pueda instalarlos con confianza cada vez.\r\n**Detalles del producto: \r\n- Número de refacción:  LS643 \r\n- Peso:  0.20lb  \r\n- Grado del artículo: Estándar de OEM \r\n- Configuración del conector/terminal: Hembra/11 cuchillas macho \r\n- Contenido del paquete: 1 interruptor \r\n- Color/acabado de la caja de aire: Negro/plástico\r\n', 50, '750', 'interruptor2.jpg'),
(43, 'Duralast Ignicion – Interruptor ', 'Los productos Duralast se diseñan y fabrican por Wells Vehicle Electronics, un proveedor líder global de soluciones electrónicas de vehículo avanzadas para aplicaciones del equipo original y de reemplazo.\r\n**Detalles del producto: \r\n- Número de refacción:  LS1492 \r\n- Peso:  0.12lb  \r\n- Configuración del conector/terminal: Conector hembra/5 pines macho \r\n- Contenido del paquete: Solo componente \r\n- Color/acabado de la caja de aire: Negro/plástico\r\n', 50, '750', 'interruptor3.jpg'),
(44, 'Duralast Ignicion - Interruptor ', 'Todos los interruptores Duralast se fabrican para cumplir o superar el rendimiento de OE, para que pueda instalarlos con confianza cada vez.\r\n**Detalles del producto \r\n- Número de refacción:  LS1583 \r\n- Peso:  0.05lb  \r\n- Grado del artículo: Estándar de OEM \r\n- Configuración del conector/terminal: Hembra/10 pines macho \r\n- Contenido del paquete: 1 interruptor \r\n- Color/acabado de la caja de aire: Negro, gris/plástico\r\n', 50, '2,900', 'interruptor4.jpg'),
(45, 'Duralast Ignicion - Interruptor ', 'Todos los interruptores Duralast se fabrican para cumplir o superar el rendimiento de OE, para que pueda instalarlos con confianza cada vez.\r\n**Detalles del producto \r\n- Número de refacción:  LS1640 \r\n- Peso:  0.22lb  \r\n- Grado del artículo: Estándar de OEM \r\n- Configuración del conector/terminal: Hembra/5 cuchillas macho \r\n- Contenido del paquete: 1 interruptor \r\n- Color/acabado de la caja de aire: Rojo, gris/plástico\r\n', 50, '1,900', 'interruptor5.jpg'),
(46, 'Philips Foco/Luz de Reversa', 'Los minifocos estándar Philips ofrecen la misma calidad de equipo original que las luces que le proporcionamos a los fabricantes de autos alrededor del mundo. Los minifocos estándar Philips ofrecen un excelente valor para cada aplicación.\r\n**Detalles del producto \r\n- Número de refacción:  P21-5WB2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 3 \r\n- Cantidad de terminales: 2 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12 V \r\n- Amperios: 1.75/0.42 amps \r\n- Watts: 21/5 \r\n- Material base: Metal \r\n- Tipo de Terminal: Contacto de presión \r\n- Tipo de Base: BAY15d\r\n', 50, '200', 'direcciones1.jpg'),
(47, 'Philips Foco/Luz de Cuartos    ', 'Los minifocos estándar Philips ofrecen la misma calidad de equipo original que las luces que le proporcionamos a los fabricantes de autos alrededor del mundo. Los minifocos estándar Philips ofrecen un excelente valor para cada aplicación. \r\n**Detalles del producto \r\n- Número de refacción:  3057B2 \r\n- Peso:  0.00lb  \r\n- Cantidad de contactos: 4 \r\n- Cantidad de terminales: 4 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12.8V \r\n- Amperios: 2.1/0.53 amps \r\n- Watts: 26.9/6.72 \r\n- Material base: Plástico \r\n- Tipo de Terminal: Cable conductor \r\n- Tipo de Base: W2, 5x16q\r\n', 50, '250', 'direcciones2.jpg'),
(48, 'Philips Foco/Luz de Alto Superiores   ', 'Los minifocos estándar Philips ofrecen la misma calidad de equipo original que las luces que le proporcionamos a los fabricantes de autos alrededor del mundo. Los minifocos estándar Philips ofrecen un excelente valor para cada aplicación. \r\n**Detalles del producto \r\n- Número de refacción:  P21WB2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 2 \r\n- Cantidad de terminales: 1 \r\n- Cantidad de filamentos: 1 \r\n- Voltios: 12 V \r\n- Amperios: 1.75 amps \r\n- Watts: 21 \r\n- Material base: Metal \r\n- Tipo de Terminal: Contacto de presión \r\n- Tipo de Base: BA15S\r\n', 50, '230', 'direcciones3.jpg'),
(49, 'Philips Foco/Luz de Esquina     ', 'Los focos LongerLife son para conductores que quieren hacer la mejor inversión de su dinero. Puede mejorar sus focos miniatura con focos LongerLife para obtener el doble de vida útil. Los minifocos Philips LongerLife son para conductores que quieren hacer la mejor inversión de su dinero. \r\n**Detalles del producto \r\n- Número de refacción:  1156B2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 2 \r\n- Cantidad de terminales: 1 \r\n- Cantidad de filamentos: 1 \r\n- Voltios: 12 V \r\n- Amperios: 2.24 \r\n- Watts: 26.9 \r\n- Material base: Metal \r\n- Tipo de Terminal: Contacto de presión \r\n- Tipo de Base: BA15S\r\n', 50, '210', 'direcciones4.jpg'),
(50, 'Philips Foco/Luz de Reversa        ', 'Los focos LongerLife son para conductores que quieren hacer la mejor inversión de su dinero. Puede mejorar sus focos miniatura con focos LongerLife para obtener el doble de vida útil. Los minifocos Philips LongerLife son para conductores que quieren hacer la mejor inversión de su dinero. \r\n**Detalles del producto:\r\n- Número de refacción:  1157B2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 3 \r\n- Cantidad de terminales: 4 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12.8V \r\n- Amperios: 0.06 amps \r\n- Watts: 0.75 \r\n- Material base: Metal \r\n- Tipo de Terminal: Contacto de presión \r\n- Tipo de Base: BAY15d\r\n', 50, '199', 'direcciones5.jpg'),
(51, 'Philips Foco/Luz Lateral     ', 'Los minifocos estándar Philips ofrecen la misma calidad de equipo original que las luces que le proporcionamos a los fabricantes de autos alrededor del mundo. Los minifocos estándar Philips ofrecen un excelente valor para cada aplicación.\r\n**Detalles del producto \r\n- Número de refacción:  7443B2 \r\n- Peso:  0.00lb  \r\n- Cantidad de contactos: 4 \r\n- Cantidad de terminales: 4 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 13.5 V \r\n- Amperios: 1.85/0.4 amps \r\n- Watts: 24.97/5.4 	\r\n- Material base: Plástico \r\n- Tipo de Terminal: Cable conductor \r\n- Tipo de Base: W3x16q\r\n', 50, '150', 'lateral1.jpg'),
(52, 'Philips Foco/Luz de Cuartos               ', 'Los focos LongerLife son para conductores que quieren hacer la mejor inversión de su dinero. Puede mejorar sus focos miniatura con focos LongerLife para obtener el doble de vida útil. Los minifocos Philips LongerLife son para conductores que quieren hacer la mejor inversión de su dinero.\r\n**Detalles del producto \r\n- Número de refacción:  2057B2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 3 \r\n- Cantidad de terminales: 2 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12.8V \r\n- Amperios: 2.1/0.53 amps \r\n- Watts: 26.9/6.72 \r\n- Material base: Metal \r\n- Tipo de Terminal: Cable conductor \r\n- Tipo de Base: BAY15d\r\n', 50, '150', 'lateral2.jpg'),
(53, 'Philips Foco/Luz de Reversa                 ', 'Los focos LongerLife son para conductores que quieren hacer la mejor inversión de su dinero. Puede mejorar sus focos miniatura con focos LongerLife para obtener el doble de vida útil. Los minifocos Philips LongerLife son para conductores que quieren hacer la mejor inversión de su dinero.\r\n**Detalles del producto \r\n- Número de refacción:  1157B2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 3 \r\n- Cantidad de terminales: 4 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12.8V \r\n- Amperios: 0.06 amps \r\n- Watts: 0.75 \r\n- Material base: Metal \r\n- Tipo de Terminal: Contacto de presión \r\n- Tipo de Base: BAY15d\r\n', 50, '175', 'lateral3.jpg'),
(54, 'Philips Foco/Luz de Uso de Dia', 'Los minifocos estándar Philips ofrecen la misma calidad de equipo original que las luces que le proporcionamos a los fabricantes de autos alrededor del mundo. Los minifocos estándar Philips ofrecen un excelente valor para cada aplicación. \r\n**Detalles del producto \r\n- Número de refacción:  3157B2 \r\n- Peso:  0.00lb  \r\n- Cantidad de contactos: 4 \r\n- Cantidad de terminales: 4 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12.8/14 V \r\n- Amperios: 2.1/0.59 amps \r\n- Watts: 26.9/8.26 \r\n- Material base: Plástico \r\n- Tipo de Terminal: Cable conductor \r\n- Tipo de Base: W2, 5x16q\r\n', 50, '175', 'lateral4.jpg'),
(55, 'Philips Foco/Luz de Reversa', 'Los minifocos estándar Philips ofrecen la misma calidad de equipo original que las luces que le proporcionamos a los fabricantes de autos alrededor del mundo. Los minifocos estándar Philips ofrecen un excelente valor para cada aplicación. \r\n**Detalles del producto \r\n- Número de refacción:  P21-5WB2 \r\n- Peso:  0.02lb  \r\n- Cantidad de contactos: 3 \r\n- Cantidad de terminales: 2 \r\n- Cantidad de filamentos: 2 \r\n- Voltios: 12 V \r\n- Amperios: 1.75/0.42 amps \r\n- Watts: 21/5 \r\n- Material base: Metal \r\n- Tipo de Terminal: Contacto de presión \r\n- Tipo de Base: BAY15d\r\n', 50, '125', 'lateral5.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_cat`),
  ADD KEY `Id_prod` (`Id_prod`);

--
-- Indices de la tabla `ctrl_acceso`
--
ALTER TABLE `ctrl_acceso`
  ADD PRIMARY KEY (`Id_acceso`);

--
-- Indices de la tabla `ctrl_acciones`
--
ALTER TABLE `ctrl_acciones`
  ADD PRIMARY KEY (`Id_acciones`);

--
-- Indices de la tabla `det_ped`
--
ALTER TABLE `det_ped`
  ADD PRIMARY KEY (`Id_detped`),
  ADD KEY `Id_c` (`Id_ped`),
  ADD KEY `Id_prod` (`Id_prod`),
  ADD KEY `Id_ped` (`Id_ped`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`Id_dir`),
  ADD KEY `id_p` (`id_p`);

--
-- Indices de la tabla `nombres`
--
ALTER TABLE `nombres`
  ADD PRIMARY KEY (`ctrl_reg`),
  ADD KEY `id_p` (`id_p`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id_ped`),
  ADD KEY `Id_per` (`Id_vende`),
  ADD KEY `Id_compra` (`Id_compra`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`Id_p`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_prod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_cat` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atriburo representa el id con el que se identificará la categoría';

--
-- AUTO_INCREMENT de la tabla `ctrl_acceso`
--
ALTER TABLE `ctrl_acceso`
  MODIFY `Id_acceso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el id con el que se identificara el control de acceso de los usuarios.';

--
-- AUTO_INCREMENT de la tabla `ctrl_acciones`
--
ALTER TABLE `ctrl_acciones`
  MODIFY `Id_acciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el id con el que se identificara el control de acciones de los usuarios.';

--
-- AUTO_INCREMENT de la tabla `det_ped`
--
ALTER TABLE `det_ped`
  MODIFY `Id_detped` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el id con el que se identificara el detalle del pedido del cliente.';

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `Id_dir` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el Id  con el que se identificara la dirección del usuario.';

--
-- AUTO_INCREMENT de la tabla `nombres`
--
ALTER TABLE `nombres`
  MODIFY `ctrl_reg` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el número de control de registro del nombre del usuario.';

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id_ped` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el id del pedido del usuario.';

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `Id_p` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el Id del usuario.', AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Id_prod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'este atributo representa el id con el que se identificara el producto', AUTO_INCREMENT=56;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`Id_prod`) REFERENCES `producto` (`Id_prod`);

--
-- Filtros para la tabla `det_ped`
--
ALTER TABLE `det_ped`
  ADD CONSTRAINT `det_ped_ibfk_1` FOREIGN KEY (`Id_ped`) REFERENCES `pedido` (`Id_ped`),
  ADD CONSTRAINT `det_ped_ibfk_2` FOREIGN KEY (`Id_prod`) REFERENCES `producto` (`Id_prod`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`id_p`) REFERENCES `personas` (`Id_p`);

--
-- Filtros para la tabla `nombres`
--
ALTER TABLE `nombres`
  ADD CONSTRAINT `nombres_ibfk_1` FOREIGN KEY (`id_p`) REFERENCES `personas` (`Id_p`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_vende`) REFERENCES `personas` (`Id_p`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Id_compra`) REFERENCES `personas` (`Id_p`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
