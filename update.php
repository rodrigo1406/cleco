<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include('../../inc/db_cleco.php');
// limpa variáveis para post -- NECESSÁRIO?? USANDO QUERIES PARAMETRIZADAS pg_query_params()
function limpa($p) {
	// procurar por: cláusulas SQL, apóstrofes ', aspas ", <script
	return $p;
}
function getPost($w,$default=null) {
	global $post;
	if (!empty($post[$w])) {
		$res = trim($post[$w]);
	} else {
		$res = $default;
	}
	return $res;
}
if (!empty($_POST)) {
	$post = limpa($_POST); // array copiado sem slice no PHP? Ou só a referência?
	$base = getPost('base');
	$anc = getPost('anc');
	$id = getPost('id');
	$nameAnt = getPost('nameAnt');
	$name = getPost('name');
	$eco = getPost('eco');
	$geo = getPost('geo');
	if (substr($geo,-1) == ',') {
		$geo = substr($geo,0,-1);
	}
	$nreg = getPost('nreg');
	$nest = getPost('nest');
	$doubt = getPost('doubt');
	$extinct = getPost('extinct');
	$namePT = getPost('namePT');
	$nameEN = getPost('nameEN');
	$nameZH = getPost('nameZH');
	$ref = getPost('ref');
	if (!$doubt) {
		$doubt = 0;
	} else {
		$doubt = 1;
	}
	if (!$extinct) {
		$extinct = 0;
	} else {
		$extinct = 1;
	}
	$status = 0;
	if ($anc) { // Adiciona
		$q = 'insert into taxon (anc,name,nreg,nest,eco,geo,doubt,extinct,namept,nameen,namezh,ref) values ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)';
		$res = pg_query_params($conn,$q,[$anc,$name,$nreg,$nest,$eco,$geo,$doubt,$extinct,$namePT,$nameEN,$nameZH,$ref]);
		if ($res) {
			echo "$name inserido com sucesso.";
			$status = 1;
		} else {
			$status = 3;
			echo "<span style='color:#F00'>$name não inserido!</span>";
		}
	} else { // Altera
		$q = 'update taxon set (name,nreg,nest,eco,geo,doubt,extinct,namept,nameen,namezh,ref) = ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) where id = $12';
		$res = pg_query_params($conn,$q,[$name,$nreg,$nest,$eco,$geo,$doubt,$extinct,$namePT,$nameEN,$nameZH,$ref,$id]);
		if ($res) {
			echo "$name alterado com sucesso.";
			$status = 2;
		} else {
			$status = 4;
			echo "<span style='color:#F00'>$name não alterado!</span>";
		}
	}
	if ($base) {
		if ($nameAnt == $base && $name != $nameAnt) { // editando a base da árvore
			header("Location:index.php?taxon=$name&upd=$name&status=$status");
		} else {
			echo "base:[$base],name:[$name],status:[$status]<br>";
			header("Location:index.php?taxon=$base&upd=$name&status=$status");
		}
	} else {
		header("Location:index.php?upd=$name&status=$status");
	}
}
?>
