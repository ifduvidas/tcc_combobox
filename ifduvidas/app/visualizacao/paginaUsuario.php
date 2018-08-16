<!DOCTYPE html>
<html>
<body>

<?php include'menu.php' ?>


					<div id="frente">
			<div>

				<img src='<?=$usuario['foto_perf']?>'>
			</div>
			<div class="four wide column" id="sobre_usuario" >
					<h1> <?=$usuario['Nome']?> </h2>

					<?php if ($usuario['cod_tip'] == '5'){ ?>
						<h2> Turma: <?=$usuario['atributo']?> </h3>
						<h2>Perguntas feitas: <?=$numDePergutas['numeroDePerguntas']?></h3>
					<?php }; ?>

					<?php if ($usuario['cod_tip'] == '4'){ ?>
						<h2> Leciona: <?=$usuario['atributo']?> </h3>
						<!--<h2>Perguntas respondidas:<b> </h3> -->
					<?php }; ?> 

		<?php if ($_SESSION['id_usuario'] == $usuario['id_usuario']) { ?>
			<div id="botoes">
		<a  href="../controlador/Usuarios.php?acao=alterarUsuario">
		 <div class="ui animated button" id="configuracoes" tabindex="0">
  			<div class="visible content">Configurações</div>
  				<div class="hidden content">
    				<i class="settings icon"></i>
  				</div>
		</div> </a>
		<a href="../controlador/Usuarios.php?acao=deletarUsuario"> 
		<div class="ui animated button" id="excluir" tabindex="0">
  			<div class="visible content">Deletar Conta</div>
  				<div class="hidden content">
    				<i class="power off icon"></i>
  				</div>
		</div></a>
			</div>		
		<?php } ?>
		
				</div>
			</div>


					<div  id="tras">		
			<img id="imagem_tras" src="http://www.technikart.com/wp-content/uploads/2017/05/twin-peaks.jpg">			
				</div>


		


   
   	<div class="ui grid" id="conteudo">
   			   	
	
        
       <?php if ($cod_tip == '5') { ?>

       	<div class="ui horizontal section divider">Perguntas feitas por <?=$usuario['Nome']?></div>
      <div class="ui vertically divided grid">

	<?php foreach ($perguntas as $pergunta) { ?>
		
	<div class="row">
          <div class="sixteen wide column">
          <a href="../controlador/Usuarios.php?acao=pergunta&id_pergunta=<?=$pergunta['id_pergunta']?>" style="color: inherit; ">
       		 <h4 class="ui header"><?=$pergunta['titulo']?></h4>
          	<?=$pergunta['descricao_pergunta']?>
          	</a>
          </div>
        </div>

	<?php }} ?>

	       <?php if ($cod_tip == '4') { ?>

       	<div class="ui horizontal section divider">Perguntas respondidas por <?=$usuario['Nome']?></div>
      <div class="ui vertically divided grid">

	<?php foreach ($respostas as $resposta) { ?>
		
	<div class="row">
          <div class="sixteen wide column">
          <a href="../controlador/Usuarios.php?acao=pergunta&id_pergunta=<?=$resposta['id_pergunta']?>" style="color: inherit; ">
       		 <h4 class="ui header"><?=$resposta['titulo']?></h4>
          	<?=$resposta['descricao_pergunta']?>
          	</a>
          </div>
        </div>

	<?php }} ?>
      </div>
   		
   	</div>

<?php include'footer_smallpage.php' ?>

   	</body>
   		

	



		




