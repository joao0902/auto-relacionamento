-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Dez-2020 às 20:09
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`idcargo`, `cargo`) VALUES
(1, 'Professor'),
(2, ' coordInfo'),
(3, 'coordPedagogico'),
(4, 'coordEnsinoMedio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargofunc`
--

CREATE TABLE `cargofunc` (
  `codfuncionario` int(11) NOT NULL,
  `codcargo` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargofunc`
--

INSERT INTO `cargofunc` (`codfuncionario`, `codcargo`, `dataentrada`, `datasaida`) VALUES
(1, 1, '2010-12-01', '0000-00-00'),
(1, 4, '2012-12-10', '2015-12-31'),
(1, 3, '2016-12-15', '0000-00-00'),
(2, 1, '2011-12-02', '0000-00-00'),
(2, 2, '2010-02-25', '2012-09-08'),
(2, 2, '2014-12-08', '2016-12-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codfuncionario` int(11) NOT NULL,
  `nomefuncionario` varchar(255) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codfuncionario`, `nomefuncionario`, `dataentrada`, `datasaida`) VALUES
(1, 'Amanda', '2011-09-02', '0000-00-00'),
(2, 'Anderson', '2009-02-07', '0000-00-00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Índices para tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD KEY `codfuncionario` (`codfuncionario`),
  ADD KEY `codcargo` (`codcargo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codfuncionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idcargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codfuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD CONSTRAINT `cargofunc_ibfk_1` FOREIGN KEY (`codfuncionario`) REFERENCES `funcionario` (`codfuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofunc_ibfk_2` FOREIGN KEY (`codcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
