-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2021 a las 01:56:47
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jlso94001`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualiza_estatus_deuda` (IN `Iestatus` INT, IN `IidDeuda` INT)  BEGIN
        	update deduas set pagado = Iestatus where id = IidDeuda;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_deuda` (IN `Icuenta` VARCHAR(30), IN `Ideuda` INT, IN `Iuser` INT)  BEGIN
    
    	insert into deduas(deuda,costo,id_usuarios,fecha_registro) VALUES(ICuenta, Ideuda, Iuser, CURRENT_DATE()); 
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_saldo` (IN `Isaldo` INT, IN `Iid` INT)  BEGIN
	INSERT INTO saldos(saldo,inicio_periodo,id_user) VALUES(Isaldo, CURRENT_DATE(), Iid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_usuarios` (IN `Inombre` VARCHAR(20), IN `Itelefono` VARCHAR(10))  BEGIN
        	select id,user,sha_pass from usuarios where user = Inombre and telefono = Itelefono;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_periodo_deudas` (IN `Iid` INT, IN `Iperiodo` DATE)  BEGIN
	select deuda,costo,date_format(fecha_registro, '%e-%m-%Y') as fecha_registro,pagado,id  from deduas where id_usuarios = Iid and fecha_registro >= Iperiodo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registra_usuarios` (IN `Inombre` VARCHAR(45), IN `Itelefono` VARCHAR(10), IN `Isha` VARCHAR(100))  BEGIN
        	INSERT into usuarios(user,telefono,sha_pass) VALUES(Inombre, Itelefono, Isha);
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_valida_usuario_existente` (IN `Itelefono` VARCHAR(10), IN `Iuser` VARCHAR(45))  BEGIN	
        	SELECT telefono FROM usuarios WHERE telefono = Itelefono AND user = Iuser;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deduas`
--

CREATE TABLE `deduas` (
  `deuda` varchar(30) NOT NULL,
  `costo` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `pagado` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deduas`
--

INSERT INTO `deduas` (`deuda`, `costo`, `id_usuarios`, `fecha_registro`, `pagado`, `id`) VALUES
('Renta', 1000, 3, '2021-01-04', 0, 1),
('Internet', 175, 3, '2021-01-04', 0, 2),
('luz', 350, 3, '2021-01-04', 0, 3),
('servicio agua', 250, 3, '2021-01-04', 0, 4),
('renta', 1000, 2, '2021-01-04', 0, 5),
('agua', 150, 2, '2021-01-04', 0, 6),
('agua', 100, 3, '2021-01-05', 0, 7),
('Internet', 350, 3, '2021-01-05', 0, 8),
('tarjetas', 855, 2, '2021-01-05', 0, 9),
('renta', 1000, 4, '2021-01-05', 0, 10),
('renta', 1000, 7, '2021-01-05', 1, 11),
('renta', 1500, 6, '2021-01-05', 0, 12),
('TC bnmx', 290, 7, '2021-01-06', 1, 13),
('comida', 1000, 7, '2021-01-06', 1, 14),
('extras', 200, 7, '2021-01-06', 1, 15),
('gasolina', 1000, 7, '2021-01-06', 1, 16),
('renta', 1000, 8, '2021-01-06', 1, 17),
('Luz', 150, 8, '2021-01-06', 1, 18),
('agua', 150, 8, '2021-01-06', 1, 19),
('leche', 250, 8, '2021-01-06', 1, 20),
('paÃ±ales', 350, 8, '2021-01-06', 1, 21),
('tc bnmx', 300, 8, '2021-01-06', 1, 22),
('tc h', 600, 8, '2021-01-06', 1, 23),
('renta', 1000, 14, '2021-01-07', 1, 24),
('Internet', 345, 8, '2021-01-07', 1, 25),
('Gas', 700, 8, '2021-01-07', 1, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldos`
--

CREATE TABLE `saldos` (
  `saldo` int(11) NOT NULL,
  `inicio_periodo` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldos`
--

INSERT INTO `saldos` (`saldo`, `inicio_periodo`, `id_user`, `id`) VALUES
(12000, '2020-12-30', 3, 1),
(21000, '2021-01-04', 2, 2),
(30000, '2021-01-05', 3, 5),
(226, '2021-01-05', 3, 6),
(31500, '2021-01-05', 3, 7),
(6000, '2021-01-05', 4, 8),
(31500, '2021-01-05', 7, 9),
(226, '2021-01-05', 7, 10),
(20500, '2021-01-05', 6, 11),
(6000, '2021-01-06', 8, 12),
(30000, '2021-01-07', 8, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(60) NOT NULL,
  `telefono` varchar(90) NOT NULL,
  `sha_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `telefono`, `sha_pass`) VALUES
(1, 'librado', '123456', ''),
(2, 'Jose', 'contra', ''),
(3, 'Calvin', '123', ''),
(4, 'kevin', '6677552211', '$2y$10$Urmkqxw2z/G1ClxgtqBC6.l75m/qM803IeK2FZ51NOrh5dx61lwDW'),
(5, 'Jose', '6677552110', '$2y$10$a7nCnEE.qycDys1kAN5txew0BMTPQ7AmLqBfAF6LV9hESwim/.jZS'),
(6, 'Jose', '6677552111', '$2y$10$nVJY0F7IrFBeG52CMW6OCO1VBQa7JYvqXcgD85ABs5aEucVW.wl9a'),
(7, 'Jose', '6677552112', '$2y$10$tl..44dwh0MmEH12nFDZ0OTqdLJe1tRLHQ/BmaTeCWme0Atw659bq'),
(8, 'librado', '6677552110', '$2y$10$OPp5x1qKuHrUUyFAWYF3TOVGayCMo7B1Jb6YAWgcakz6xKNh1VWcy'),
(9, 'librado', '6677552110', '$2y$10$sv6mB0rg0xfTThva3yUpLufIYnnN0SuCfJxEVxHXd/cc.iT2QbKDq'),
(10, 'librado', '6677552110', '$2y$10$kSpGyKs.B9PL.Hd7u9MO7.DNvKRRPIU.MtHUnJ7ne2f1rW1dmHyFa'),
(11, 'librado', '6677552110', '$2y$10$/hJFyx8l5nFAkQvdLmV7Q.6uJlkwBAz/bSh0snOzbYoOu8NMgwGve'),
(12, 'librado', '6677552110', '$2y$10$pI3tT2yc79LzcaSbLCfYKOuq6aAK9Bptkg3Nt5Ng6IiUx.QMSBMdO'),
(13, 'librado', '6677552110', '$2y$10$A5B2RjfFfcJGXX/JA7AjfuTqCliayz8J2GIg6fBuNJ1LDgiaVHUpi'),
(14, 'Maribel', '6672143721', '$2y$10$je.JNIpkqyZ1NkgCeHW71uDOqrCia3w7NwMXDQEXckO3/GKyIzW3O'),
(15, 'kevin', '6677552211', '$2y$10$1g/Vih2tJdNSrI4SutmoC..ObAortiIr5FMlsz44SwydhRYqgJ9OG'),
(16, 'kevin', '6677552110', '$2y$10$hFZVddjmnXhBq/gfOiENuejiS7m.jX15.4yGjJDuIlWqKettIS0kW'),
(17, 'kevin', '6672143721', '$2y$10$kY6tc9Y.TzxnaE7OCI696.mFjb7r1uQu4nCdxbj4U4XErUipfGWOi'),
(18, 'Mar', '6677552131', '$2y$10$74XDoh.w0OWR/IHWw.Z.z.4qIBigQtHnHTr3IEsFPA5z8G8dN5Z/C'),
(19, 'librado', '6677552121', '$2y$10$zoAuKawd.gy7LF1xkEuQIOEwl2po.786C3X0dZ9A.CVjLm4uBlvVm'),
(20, 'Jose', '6677552217', '$2y$10$lYjcY7cY/NI7Jnvxo2lbneZGAIltqf3fZOHUCiHfN3t7kT4uM/iPG'),
(21, 'Jose', '6677552117', '$2y$10$YSzl6M/PmAkvWZCO0NRR/uWNWO239RiHfNWe1YRcXVfcu1vxhqJN.'),
(22, 'Jose', '6677552117', '$2y$10$Tu7j/dNbrB6MtdEBuJukKu/6eDEj7plwVSsT8YKz.W.1QwhL0gaq6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deduas`
--
ALTER TABLE `deduas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indices de la tabla `saldos`
--
ALTER TABLE `saldos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deduas`
--
ALTER TABLE `deduas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `saldos`
--
ALTER TABLE `saldos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deduas`
--
ALTER TABLE `deduas`
  ADD CONSTRAINT `deduas_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `saldos`
--
ALTER TABLE `saldos`
  ADD CONSTRAINT `saldos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
