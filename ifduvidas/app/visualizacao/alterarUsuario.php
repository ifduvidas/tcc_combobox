<html>
<body>
	<!DOCTYPE html>
<html>
<head>
	
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">	
		
		$(document).ready(function () {
		
			$.getJSON('../visualizacao/cadastro.json', function (data) {

				var items = [];
				var options = '<option value="">Aluno ou Professor?</option>';	

				$.each(data, function (key, val) {
					options += '<option value="' + val.nome + '">' + val.nome + '</option>';
				});					
				$("#tipo").html(options);				
				
				$("#tipo").change(function () {				
				
					var options_cidades = '';
					var str = "";					
					
					$("#tipo option:selected").each(function () {
						str += $(this).text();
					});
					
					$.each(data, function (key, val) {
						if(val.nome == str) {							
							$.each(val.cidades, function (key_city, val_city) {
								options_cidades += '<option value="' + val_city + '">' + val_city + '</option>';
							});							
						}
					});

					$("#atributos").html(options_cidades);
					
				}).change();		
			
			});
		
		});
		
	</script>		


</head>

<body>
<?php include'menu.php' ?>

<div class="ui grid" >
  <div class="four wide column"></div>
  <div class="eight wide column">

    <form class="ui equal width aligned segment form" method="post" action="../controlador/Usuarios.php?acao=alterarUsuario" enctype='multipart/form-data'>
   <div class="field">
    <label>Novo Nome</label>
    <input type="text" name="nome">
  </div>
  <div class="field">
    <label>Nova Senha</label>
    <input type="password" name="senha">
  </div>
   <div class="field">
    <label>Novo Email</label>
    <input type="email" name="email">
  </div>
   <div class="field">
    <label>Nova Data de nascimento</label>
    <input type="date" name="data_nasc">
  </div>  
  <div class="field">
    <label>Você é...</label>
    <select class="ui dropdown" id="tipo" name="cod_tip">
			<option value=""></option>
		</select>
		<div class="field"></div>
		 <label>de</label>
		<select name="atributo" id="atributos">
		</select>
  </div>
     <div class="field">
    <label> Nova Foto</label>
    <input type="file" name="foto_perf">
  </div>
  <div class="field">
  </div>
   <button class="ui button" type="submit" value="gravar" name="gravar" id="gravar">Cadastrar</button>
</form>

  </div>
  <div class="four wide column"></div>
  </div>

>



</body>

</html>

</body>
