<?php 
	include "CrudUsuarios.php";
	include "CrudPerguntas.php";
	include "crudRespostas.php";
	include "CrudComentarios.php";
	//include "curtida.php";

	//getCurtida('47');

	 $hora = "1";
	 $data = "10";
	 $descricao_pergunta = 'ble';
	 $titulo = 'teste';
	 $curso = 'informatica';
	 
	 $materia = 'matematica';
	 $id_pergunta = "4";
	 $id_usuario = "47";

	 $data_resposta= "12";
	 $texto_resposta = "ola";
	 $id_resposta = null;

	 $data_comentario= "1990-12-12";
	 $texto_comentario = "ola";
	 $id_comentario = null;

	 $Nome = "teste3";
	 $senha = "123";
	 $email = "teste@gmail.com";
	 $data_nasc = "10";
	 $atributo = "3info2";
	 $foto_perf = "aaa.com";
	 $cod_tip = "4";


	$novoUsuario = new Usuario($Nome, $senha, $email, $data_nasc, $atributo, $cod_tip);
	//$teste2 = new Pergunta($hora, $data, $descricao_pergunta, $titulo, $materia, $curso);
	//$teste3 = new Resposta($data_resposta, $texto_resposta, $id_resposta);
	//$teste4 = new Comentario($data_comentario, $texto_comentario, $id_comentario);




	$crud = new CrudUsuarios();
	$crud -> updateUsuario($novoUsuario, $foto_perf, 57);
	print_r($novoUsuario);

	//$crud = new CrudPerguntas();
	//$crud -> insertPergunta($teste2);


	//$crud = new CrudRespostas();
	//$crud -> getPerguntaRespondidasPorProf('51');

	//$crud = new CrudComentarios();
	//$crud -> insertComentario($teste4);

	//echo "MEU";
 ?>

 