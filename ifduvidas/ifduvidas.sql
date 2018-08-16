-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Ago-2018 às 02:21
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ifduvidas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_comenta`
--

CREATE TABLE `aluno_comenta` (
  `id_pergunta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_comentario` date DEFAULT NULL,
  `texto_comentario` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtida`
--

CREATE TABLE `curtida` (
  `id_usuario` int(11) DEFAULT NULL,
  `id_pergunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curtida`
--

INSERT INTO `curtida` (`id_usuario`, `id_pergunta`) VALUES
(58, 56),
(58, 56),
(58, 55),
(58, 56),
(58, 56),
(58, 56),
(58, 56),
(58, 56);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

CREATE TABLE `perguntas` (
  `hora` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `descricao_pergunta` varchar(150) DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `materia` varchar(30) DEFAULT NULL,
  `id_pergunta` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `curso` varchar(30) NOT NULL,
  `curtidas` varchar(30) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `perguntas`
--

INSERT INTO `perguntas` (`hora`, `data`, `descricao_pergunta`, `titulo`, `materia`, `id_pergunta`, `id_usuario`, `curso`, `curtidas`, `status`) VALUES
('00:00:20', '0000-00-00', 'teste', 'teste', 'matematica', 54, 58, '', '20', NULL),
('00:00:20', '0000-00-00', 'teste', 'teste', 'matematica', 55, NULL, '', '21', NULL),
('00:11:06', '2018-08-16', 'aaaa', 'aaaa', 'matematica', 56, 58, '', '7', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_resposta`
--

CREATE TABLE `prof_resposta` (
  `id_pergunta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_resposta` date DEFAULT NULL,
  `texto_resposta` varchar(150) DEFAULT NULL,
  `id_resposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tip_user`
--

CREATE TABLE `tip_user` (
  `cod_tip` int(11) NOT NULL,
  `desc_tip_user` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tip_user`
--

INSERT INTO `tip_user` (`cod_tip`, `desc_tip_user`) VALUES
(3, 'admin'),
(4, 'professor'),
(5, 'aluno');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `Nome` varchar(30) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `atributo` varchar(30) DEFAULT NULL,
  `foto_perf` varchar(160) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `cod_tip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`Nome`, `senha`, `email`, `data_nasc`, `atributo`, `foto_perf`, `id_usuario`, `cod_tip`) VALUES
('Joao', '123', 'joao@gmail.com', '2018-08-02', '', 'fotos/joe.jpg', 58, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno_comenta`
--
ALTER TABLE `aluno_comenta`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_pergunta` (`id_pergunta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `perguntas`
--
ALTER TABLE `perguntas`
  ADD PRIMARY KEY (`id_pergunta`),
  ADD KEY `id_usuario` (`id_usuario`);
ALTER TABLE `perguntas` ADD FULLTEXT KEY `titulo` (`titulo`,`descricao_pergunta`);

--
-- Indexes for table `prof_resposta`
--
ALTER TABLE `prof_resposta`
  ADD PRIMARY KEY (`id_resposta`),
  ADD KEY `id_pergunta` (`id_pergunta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `tip_user`
--
ALTER TABLE `tip_user`
  ADD PRIMARY KEY (`cod_tip`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `cod_tip` (`cod_tip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno_comenta`
--
ALTER TABLE `aluno_comenta`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `perguntas`
--
ALTER TABLE `perguntas`
  MODIFY `id_pergunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `prof_resposta`
--
ALTER TABLE `prof_resposta`
  MODIFY `id_resposta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno_comenta`
--
ALTER TABLE `aluno_comenta`
  ADD CONSTRAINT `aluno_comenta_ibfk_1` FOREIGN KEY (`id_pergunta`) REFERENCES `perguntas` (`id_pergunta`),
  ADD CONSTRAINT `aluno_comenta_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Limitadores para a tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Limitadores para a tabela `prof_resposta`
--
ALTER TABLE `prof_resposta`
  ADD CONSTRAINT `prof_resposta_ibfk_1` FOREIGN KEY (`id_pergunta`) REFERENCES `perguntas` (`id_pergunta`),
  ADD CONSTRAINT `prof_resposta_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cod_tip`) REFERENCES `tip_user` (`cod_tip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
