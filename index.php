<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include('../../inc/db_cleco.php');
$showInfo = false;
function limpa($p) { // limpa variáveis para get -- NECESSÁRIO?? USANDO QUERIES PARAMETRIZADAS pg_query_params()
	// procurar por: cláusulas SQL, apóstrofes ', aspas ", <script
	return $p;
}
$get;
function get($w,$default=null) {
	global $get;
	if (isset($get[$w])) {
		//echo "$w = $get[$w]<br>\n";
		$res = trim($get[$w]);
	} else {
		//echo "$w vazio<br>\n";
		$res = $default;
	}
	return $res;
}
$unfold = 0;
if (!empty($_GET)) {
	$get = limpa($_GET); // array copiado sem slice no PHP? Ou só a referência?
	$taxon = str_replace(' ','+',get('taxon'));
	$pop = get('pop');
	$eco = get('eco');
	$geo = get('geo');
	$unfold = get('u',$unfold);
	$filtro = '';
	if ($pop) {
		$filtro = "[$pop] ";
	}
	if ($eco) {
		$filtro .= "[$eco] ";
	}
	if ($geo) {
		$filtro .= "[$geo] ";
	}
	if ($filtro) {
		$filtro = substr($filtro,0,-1);
	}
	if ($taxon != '') {
		echo "<title>$taxon $filtro @ Cladística Ecológica | Árvore da Vida</title>";
	} else {
		echo "<title>$filtro Cladística Ecológica | Árvore da Vida</title>";
	}
} else {
	echo "<title>Cladística Ecológica | Árvore da Vida</title>";
}
/*

REGRAS
* Gênero, sub-gênero, espécie, sub-espécie... deve ser antecedido por / (põe o texto em itálico), e não pode conter = ou +
* Não deve haver espaços nos nomes (exceto "Gênero espécie"...), nem entre nomes e = ou +
* Não deve haver + e = no mesmo nome
* Podem ser usadas ... (por exemplo, "Metazoa+...")
* O mesmo nome de táxon não deve ser repetido, pois isso causa problemas na busca via GET (acrescentar restrição no banco de dados)

TO-DO
* se preciso, usar data-tags na lista de eco e geo: https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes
* pesquisa de imagens, acrescentar "animal", o ancestral imediato mais famoso, nome popular, se houver?
* aceitar dois ou mais hífens na mesma expressão (Caprimulgiformes)
* mudar a posição de um clado (mnu -> Posição)
* está passando por drawNode() antes de desenhar a árvore, quando devia estar só medindo (devia ser só no debug)
* inserir referências (outra tabela?)
* nomes populares: | vira , mas + não vira
* mostrar lista de ecologia/geografia para pesquisa também
* usar cores e/ou tamanho para indicar tamanho do grupo
* indicar grupos sem tamanho
* somar tamanho nos grupos cujos descendentes sejam conhecidos? (fazer isso por grupo?) - problema é que às vezes nem todos os grupos foram inseridos (pode só atualizar depois que inserir)
* quando fecha um clado à esquerda, o painel diminui a largura. Quando reabre, o painel não aumenta novamente
* Australasia != Australiana? (Atherospermataceae)
* quando dobrar em data, dobrar também em canv
* quando procurar por 飞, não mostrar 不飞
* distribuição: -(x) -> exceto em x
* espécie precisa usar espaço
* traços para zoologia:
	* r-estrategista 产 chǎn
	* K-estrategista 稀 xī
	* tempo de gestação (Delphinidae)
	* fóssil-vivo?
	* apomorfia?
	* genitália (Araneoclada)
* traços para botânica:
	* autótrofos
	* heterótrofos
	* síndrome de polinização
	* polinizador
	* dispersor de sementes
	* herbácea
	* arbustiva
	* semi-arbórea
	* arbórea 木
	* liana/cipó
	* epífita
	* 
* abrir link no tolweb.org, eol, brahms, gbif...
* pgUp e pgDown mudarem os ângulos, Home e End as distâncias, global e individualmente (selecionando com o mouse ou as setinhas+Ins=todos. Del não faz nada).
* 
*/
$ecoHab = '#00F';
$ecoMov = '#088';
$ecoFeed = '#F00';
$ecoSex = '#F0F';
$ecoBod = '#840';
$ecoBehav = '#080';
$ecoMorf = '#888';
?>
<style type="text/css">
html {
	height:100%;
}
body {
	height:100%;
	margin:0;
	padding:0;
	display:flex;
	flex-direction:row;
	background-color:#CFC;
	overflow-y:hidden;
}
#data {
	padding:10px;
	order:1;
	background-color:#CCF;
	overflow-y:auto;
	overflow-x:auto;
	max-width:300px;
}
#clado {
	display:none;
}
#searchFrm {
	text-align:center;
	display:none;
	margin-bottom:5px;
}
#search {
	display:grid;
	grid-gap:2px;
	margin-bottom:5px;
	grid-template-columns:auto 1fr;
}
#search > div {
	font-size:12px;
	padding:0;
}
#search1a {
	text-align:right;
	align-self:center;
	grid-column:1;
	grid-row:1;
}
#search1b {
	grid-column:2;
	grid-row:1;
}
#search2a {
	text-align:right;
	align-self:center;
	grid-column:1;
	grid-row:2;
}
#search2b {
	grid-column:2;
	grid-row:2;
}
#search3a {
	text-align:right;
	align-self:center;
	grid-column:1;
	grid-row:3;
}
#search3b {
	grid-column:2;
	grid-row:3;
}
#search > div > input {
  width:100%;
  box-sizing: border-box;
}
#canv {
	order:2;
	background-color:#CFC;
	border:0px solid #0F0;
}
#cladoEsc {
	font-size:12px;
	display:none;
}
.tit, .subtit {
	text-align:center;
	margin:5px;
}
.tit {
	font-weight:bold;
}
#cladoTit {
	text-align:center;
	margin-top:0px;
	margin-bottom:-10px;
	font-weight:bold;
}
#cladoPop {
	font-size:16px;
}
#cladoRef {
	font-size:12px;
}
ul {
	margin:0;
	padding-left:10px;
}
a {
	color:black;
	text-decoration:none;
}
a:hover {
	color:white;
}
#addOverlay {
	visibility:hidden;
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	text-align:center;
	z-index:1000;
	background-image:url(black50.png);
}
#addContent {
	width:1200px;
	margin:auto;
	background-color:#fff;
	border:1px solid #000;
	padding:5px;
	text-align:center;
}
#pAddTit {
	margin-top:0;
	margin-bottom:5px;
	font-weight:bold;
}
#addOverlay table {
	margin-left:auto;
	margin-right:auto;
	margin-bottom:5px;
}
#addOverlay tr > td:first-child { text-align:right; }
#addOverlay tr > td:first-child + td { text-align:left; }
#divEco {
	display:none;
	flex-direction:row;
	height:400px;
	overflow-y:auto;
}
#divEco legend {
	font-size:14px;
}
#divEco label {
	display:block;
	text-align:left;
	font-size:12px;
}
#ecoHab label:hover {
	color:<?= $ecoHab ?>;
}
#ecoMov label:hover {
	color:<?= $ecoMov ?>;
}
#ecoFeed label:hover {
	color:<?= $ecoFeed ?>;
}
#ecoSex label:hover {
	color:<?= $ecoSex ?>;
}
#ecoBody label:hover {
	color:<?= $ecoBod ?>;
}
#ecoBehav label:hover {
	color:<?= $ecoBehav ?>;
}
#ecoMorf label:hover {
	color:<?= $ecoMorf ?>;
}
#divEco div {
	padding-left:2px;
	padding-right:2px;
}
#divGeo {
	display:none;
	flex-direction:row;
	height:400px;
	overflow-y:auto;
}
#divGeo legend {
	font-size:14px;
}
#divGeo label {
	display:block;
	text-align:left;
	font-size:12px;
}
#geoG label:hover {
	color:#00F;
}
#geoF label:hover {
	color:#840;
}
#geoM label:hover {
	color:#080;
}
#geoS label:hover {
	color:#F00;
}
#geoT label:hover {
	color:#888;
}
#divGeo div {
	padding-left:2px;
	padding-right:2px;
}
#menu {
	visibility:hidden;
	position:absolute;
	padding:2px;
	background-color:#ccc;
}
#menu button {
	width:200px;
}
</style>
<script>
//var debug = true;
var debug = false;
//http://brian3kb.github.io/graham_scan_js/
/**
 * Graham's Scan Convex Hull Algorithm
 * @desc An implementation of the Graham's Scan Convex Hull algorithm in JavaScript.
 * @author Brian Barnett, brian@3kb.co.uk, http://brianbar.net/ || http://3kb.co.uk/
 * @version 1.0.5
 */
function ConvexHullGrahamScan() {
	this.anchorPoint = undefined;
	this.reverse = false;
	this.points = [];
}
ConvexHullGrahamScan.prototype = {
	constructor: ConvexHullGrahamScan,
	Point: function (x, y) {
		this.x = x;
		this.y = y;
	},
	_findPolarAngle: function (a, b) {
		var ONE_RADIAN = 57.295779513082;
		var deltaX, deltaY;
		if (!a || !b) return 0; //if the points are undefined, return a zero difference angle.
		deltaX = (b.x - a.x);
		deltaY = (b.y - a.y);
		if (deltaX == 0 && deltaY == 0) {
			return 0;
		}
		var angle = Math.atan2(deltaY, deltaX) * ONE_RADIAN;
		if (this.reverse){
			if (angle <= 0) {
				angle += 360;
			}
		} else {
			if (angle >= 0) {
				angle += 360;
			}
		}
		return angle;
	},
	addPoint: function (x, y) {
		//Check for a new anchor
		var newAnchor =
			( this.anchorPoint === undefined ) ||
			( this.anchorPoint.y > y ) ||
			( this.anchorPoint.y === y && this.anchorPoint.x > x );
		if (newAnchor) {
			if ( this.anchorPoint !== undefined ) {
				this.points.push(new this.Point(this.anchorPoint.x, this.anchorPoint.y));
			}
			this.anchorPoint = new this.Point(x, y);
		} else {
			this.points.push(new this.Point(x, y));
		}
	},
	_sortPoints: function () {
		var self = this;
		return this.points.sort(function (a, b) {
			var polarA = self._findPolarAngle(self.anchorPoint, a);
			var polarB = self._findPolarAngle(self.anchorPoint, b);
			if (polarA < polarB) {
				return -1;
			}
			if (polarA > polarB) {
				return 1;
			}
			return 0;
		});
	},
	_checkPoints: function (p0, p1, p2) {
		var difAngle;
		var cwAngle = this._findPolarAngle(p0, p1);
		var ccwAngle = this._findPolarAngle(p0, p2);
		if (cwAngle > ccwAngle) {
			difAngle = cwAngle - ccwAngle;
			return !(difAngle > 180);
		} else if (cwAngle < ccwAngle) {
			difAngle = ccwAngle - cwAngle;
			return (difAngle > 180);
		}
		return true;
	},
	getHull: function () {
		var hullPoints = [],
		points,
		pointsLength;
		this.reverse = this.points.every(function(point){
			return (point.x < 0 && point.y < 0);
		});
		points = this._sortPoints();
		pointsLength = points.length;
		//If there are less than 3 points, joining these points creates a correct hull.
		if (pointsLength < 3) {
			points.unshift(this.anchorPoint);
			return points;
		}
		//move first two points to output array
		hullPoints.push(points.shift(), points.shift());
		//scan is repeated until no concave points are present.
		while (true) {
			var p0,p1,p2;
			hullPoints.push(points.shift());
			p0 = hullPoints[hullPoints.length - 3];
			p1 = hullPoints[hullPoints.length - 2];
			p2 = hullPoints[hullPoints.length - 1];
			if (this._checkPoints(p0, p1, p2)) {
				hullPoints.splice(hullPoints.length - 2, 1);
			}
			if (points.length == 0) {
				if (pointsLength == hullPoints.length) {
					//check for duplicate anchorPoint edge-case, if not found, add the anchorpoint as the first item.
					var ap = this.anchorPoint;
					//remove any udefined elements in the hullPoints array.
					hullPoints = hullPoints.filter(function(p) { return !!p; });
					if (!hullPoints.some(function(p){
						return(p.x == ap.x && p.y == ap.y);
					})) {
						hullPoints.unshift(this.anchorPoint);
					}
					return hullPoints;
				}
				points = hullPoints;
				pointsLength = points.length;
				hullPoints = [];
				hullPoints.push(points.shift(), points.shift());
			}
		}
	}
};
// EXPORTS
if (typeof define === 'function' && define.amd) {
	define(function() {
		return ConvexHullGrahamScan;
	});
}
if (typeof module !== 'undefined') {
	module.exports = ConvexHullGrahamScan;
}
// https://github.com/acmeism/RosettaCodeData/blob/master/Task/Sutherland-Hodgman-polygon-clipping/JavaScript/sutherland-hodgman-polygon-clipping.js
function clip(pol1, pol2) { // retorna o polígono da interseção entre dois polígonos convexos
	var cp1, cp2, s, e;
	var inside = function (p) {
		return (cp2.x-cp1.x)*(p.y-cp1.y) > (cp2.y-cp1.y)*(p.x-cp1.x);
	};
	var intersection = function () {
		var dc = {x:cp1.x-cp2.x, y:cp1.y-cp2.y},
		dp = {x:s.x-e.x, y:s.y-e.y},
		n1 = cp1.x * cp2.y - cp1.y * cp2.x,
		n2 = s.x * e.y - s.y * e.x,
		n3 = 1.0 / (dc.x * dp.y - dc.y * dp.x);
		return {x:(n1*dp.x - n2*dc.x) * n3, y:(n1*dp.y - n2*dc.y) * n3};
	};
	var outputList = pol1;
	cp1 = pol2[pol2.length-1];
	for (j in pol2) {
		var cp2 = pol2[j];
		var inputList = outputList;
		outputList = [];
		s = inputList[inputList.length - 1];
		for (i in inputList) {
			var e = inputList[i];
			if (inside(e)) {
				if (!inside(s)) {
					outputList.push(intersection());
				}
				outputList.push(e);
			} else
			if (inside(s)) {
				outputList.push(intersection());
			}
			s = e;
		}
		cp1 = cp2;
	}
	return outputList;
}
//===================================================================
var tree = [];
// função recursiva que acrescenta um filho no nó 'id' e em todos os seus ancestrais, até a raiz (sem inclui-la)
function sumSon(id,raiz) {
	for (var i=0; i<tree.length; i++) {
		if (tree[i].id == id) {
			tree[i].descend++;
			if (tree[i].pai != raiz) {
				sumSon(tree[i].pai);
			}
			break;
		}
	}
}
var canv, ctx, mx=2, my=10, nomes, defFont='12pt Arial', defFont2='10pt Arial', l, r, t, b;
function medeTxt(t) {
	return ctx.measureText(t).width;
}
// mede a altura e largura do nó
function medeNo(no) {
	var j, w, ws = [];
	nomes=[];
	if (no.nome.substr(0,1) == '/') { // se for gênero/sub-gênero/espécie/sub-espécie... (não pode usar =)
		ctx.font = 'Italic ' + defFont;
		w = medeTxt(no.nome.substr(1)); // tira a / do início
		h = 12;
	} else {
		ctx.font = defFont;
		if (no.nome.indexOf('=') >= 0 || no.nome.indexOf('+') >= 0) { // sinônimos (+ e = não podem ocorrer no mesmo nome)
			var s;
			if (no.nome.indexOf('=') >= 0) {
				s = '=';
			} else
			if (no.nome.indexOf('+') >= 0) {
				s = '+';
			}
			nomes = no.nome.split(s);
			for (j=0; j<nomes.length; j++) {
				if (j < nomes.length-1) {
					nomes[j] = nomes[j] + s;
				}
				ws.push(medeTxt(nomes[j]));
			}
			var wsSort = ws.slice();
			wsSort.sort(function(a,b) {
				return a - b;
			});
			w = wsSort[wsSort.length-1];
			h = 12*nomes.length;
		} else {
			w = medeTxt(no.nome);
			h = 12;
		}
	}
	b = no.y + h/2 + 4;
	if (no.eco != '') {
		b += 12;
	}
	t = no.y - h/2 - 4;
	if (no.geo != '') {
		t -= 12;
	}
	ctx.font = defFont2;
	var wEco = medeTxt(no.eco);
	var wGeo = medeTxt(no.geo);
	w = Math.max(w,wEco,wGeo);
	l = no.x - w/2 - mx;
	r = no.x + w/2 + mx;
}
var nivelMax = 0, primeiroNo = true, nMaxAllowed = 20;
// acrescenta um novo nó na árvore
function addNode(id,pai,nome,nreg,nest,eco,geo,doubt,nomePT,nomeEN,nomeZH,ref) {
	var i, achou=false;
	for (i=0; i<tree.length; i++) { // só acrescenta até o nível máximo
		if (tree[i].id == pai) {
			achou = true;
			if (tree[i].nivel >= nMaxAllowed) {
				return;
			}
		}
	}
	if (achou || primeiroNo) {
		primeiroNo = false;
		if (!canv) {
			canv = document.getElementById('canv');
			ctx = canv.getContext('2d');
			ctx.font = defFont;
		}
		if (ref != '') {
			ref = JSON.parse(ref).ref;
		}
		var no = {
			id:id, // id deste nó
			nome:nome, // nome científico deste nó (se extinto, inclui um †)
			nomePT:nomePT.replace(/`/g,"'"), // nome popular em português
			nomeEN:nomeEN.replace(/`/g,"'"), // nome popular em inglês
			nomeZH:nomeZH.replace(/`/g,"'"), // nome popular em mandarim
			pai:pai, // id do nó pai deste nó
			doubt:doubt, // se há dúvida sobre o ancestral imediato (dúvida = "incertae sedis" = 1)
			eco:eco, // dados sobre ecologia
			geo:geo, // dados sobre geografia
			nreg:nreg,
			nest:nest,
			ref:ref,
			filhos:0, // número de filhos imediatos
			descend:0, // número total de descendentes
			ang:null, // ângulo em relação ao pai
			angA:Math.PI/2, // ângulo absoluto (em relação à posição do pai; a ser modificado na hora de calcular a árvore)
			angR:Math.PI/2, // ângulo relativo (em relação ao ângulo do pai; a ser modificado na hora de calcular a árvore)
			dist:20, // distância em linha reta até o pai (a ser modificada na hora de calcular a árvore)
			x:0,
			y:0, // posição x,y a ser calculada pra este nó
			dx:0,
			dy:0, // quantidade a mover pela gravidade a cada passo
			dAng:0, // ângulo a rodar por influência dos irmãos a cada passo
			raio:0, // raio incluindo todos os descendentes
			l:0,
			r:0,
			t:0,
			b:0, // posição Left, Right, Top e Bottom a ser calculada pra este nó
			w:0,
			h:0,  // largura e altura deste nó, depois de desenhado
			nivel:0, // profundidade na árvore (0 = raiz = desenhada na parte de baixo da tela = passada na URL)
			folded:true, // ainda não foi resolvida a sobreposição com nós vizinhos
			hull:[] // convex hull daquele ramo inteiro (este nó + todos seus descendentes)
		};
		medeNo(no);
		no.w = r-l;
		no.h = b-t;
		sumSon(pai,'null'); // acrescenta mais um descendente em todos os ancestrais deste nó, até a raiz indicada (recursivo)
		for (i=0; i<tree.length; i++) { // acrescenta mais um filho no ancestral direto deste nó (pai)
			if (tree[i].id == pai) {
				tree[i].filhos++;
				no.nivel = tree[i].nivel + 1;
				if (no.nivel > nivelMax) {
					nivelMax = no.nivel;
				}
				break;
			}
		}
		tree.push(no);
	}
}
var distMult = 1;
// calcula o ângulo de cada filho em relação ao ângulo e posição do pai
function angFilhos(pai,angPai,xPai,yPai) {
	var filhos = []; // ids dos filhos
	var descends = []; // número de descendentes dos filhos
	var i, iPai;
	for (i=0; i<tree.length; i++) { // lista o índice de todos os filhos, e o número de descendentes de cada
		if (tree[i].pai == pai) {
			filhos.push(i);
			descends.push(tree[i].descend);
		} else
		if (tree[i].id == pai) {
			iPai = i;
			tree[i].l = tree[i].x-tree[i].w/2;
			tree[i].r = tree[i].x+tree[i].w/2;
			tree[i].t = tree[i].y-tree[i].h/2;
			tree[i].b = tree[i].y+tree[i].h/2;
		}
	}
	// agora ordena os índices por ordem do número de descendentes
	filhos.sort(function(a,b) {
		return descends[filhos.indexOf(a)] - descends[filhos.indexOf(b)];
	});
	// se a árvore está indo para a direita, reverte a ordem dos filhos (assim os filhos com mais descendentes ficam sempre mais pro meio da árvore, e ela cresce mais vertical)
	if (angPai <= Math.PI/2) {
		filhos.reverse();
	}
	var n, f;
	var angVar = Math.PI/(filhos.length+1);
	// vê a mínima distância de não colisão entre os filhos (de 10 em 10)
	do {
		var colide = false;
		n = 1;
		for (f=0; f<filhos.length; f++) {
			i = filhos[f];
			tree[i].angR = Math.PI/2 - angVar*n; // determina os ângulos de cada filho, sempre da esquerda pra direita
			tree[i].angA = angPai + tree[i].angR;
			tree[i].dist += tree[i].w/4;
			tree[i].x = xPai + Math.cos(tree[i].angA)*tree[i].dist*distMult;
			tree[i].y = yPai - Math.sin(tree[i].angA)*tree[i].dist*distMult;
			tree[i].l = tree[i].x-tree[i].w/2;
			tree[i].r = tree[i].x+tree[i].w/2;
			tree[i].t = tree[i].y-tree[i].h/2;
			tree[i].b = tree[i].y+tree[i].h/2;
			n++;
		}
		i = filhos[0];
		if (tree[i].l < tree[iPai].r && tree[i].r > tree[iPai].l &&
			tree[i].t < tree[iPai].b && tree[i].b > tree[iPai].t) {
			colide = true;
		} else
		for (f=1; f<filhos.length; f++) {
			i = filhos[f];
			il = filhos[f-1]
			if (tree[i].l < tree[il].r && tree[i].r > tree[il].l &&
				tree[i].t < tree[il].b && tree[i].b > tree[il].t ||
				tree[i].l < tree[iPai].r && tree[i].r > tree[iPai].l &&
				tree[i].t < tree[iPai].b && tree[i].b > tree[iPai].t) {
				colide = true;
				break;
			}
		}
	} while (colide);
	n = 1;
	for (f=0; f<filhos.length; f++) {
		i = filhos[f];
		if (tree[i].filhos > 0) {
			angFilhos(tree[i].id,tree[i].angA,tree[i].x,tree[i].y);
		}
	}
}
function text(t,x,y,s=1) {
	if (s > 1) {
		ctx.font = defFont2;
	} else {
		ctx.font = defFont;
	}
	if (debug) {
		ctx.fillStyle = '#080';
		ctx.fillRect(x-medeTxt(t)/2,y-5,medeTxt(t),10);
		ctx.fillStyle = '#FFF';
	}
	if (t.substr(0,1) == '/') {
		ctx.font = 'Italic ' + ctx.font;
		ctx.fillText(t.substr(1),x - medeTxt(t.substr(1))/2,y+5);
	} else {
		ctx.fillText(t,x - medeTxt(t)/2,y+5);
	}
}
function drawNode(i,hov) {
	var no = tree[i];
	medeNo(no); // medir da primeira vez com a ecologia, tirar daqui !!
	ctx.lineWidth=1;
	ctx.fillStyle = '#C99';
	ctx.fillRect(l,t,r-l,b-t);
	//ctx.fillRect(no.l,no.t,no.r-no.l,no.b-no.t);
	if (hov) {
		ctx.strokeStyle = '#FFF';
		ctx.fillStyle = '#FFF';
	} else {
		ctx.strokeStyle = '#844';
		ctx.fillStyle = '#000';
	}
	ctx.strokeRect(l,t,r-l,b-t);
	//ctx.strokeRect(no.l,no.t,no.r-no.l,no.b-no.t);
	if (nomes.length > 0) {
		for (j=0; j<nomes.length; j++) {
			text(nomes[j],no.x,no.y + 15*j - (nomes.length-1)*7.5);
		}
		text(no.eco,no.x,no.y + (nomes.length+1)*7.5,2);
		text(no.geo,no.x,no.y - (nomes.length+1)*7.5,2);
	} else {
		//text(no.nome+' ('+no.nivel+')',no.x,no.y);
		text(no.nome,no.x,no.y);
		text(no.eco,no.x,no.y+15,2);
		text(no.geo,no.x,no.y-15,2);
	}
}
function descende(id,anc) {
	if (tree[id].pai == tree[anc].id) {
		return true;
	} else {
		if (id == 0) {
			return false; // chegou no início da árvore
		} else {
			for (var i=0; i<tree.length; i++) {
				if (tree[i].id == tree[id].pai) {
					return descende(i,anc);
				}
			}
		}
	}
}
function convexHull(j) {
	var cHull, hull, i;
	cHull = new ConvexHullGrahamScan();
	for (i=0; i<tree.length; i++) {
		if (i==j || descende(i,j)) {
			cHull.addPoint(tree[i].l,tree[i].t);
			cHull.addPoint(tree[i].l,tree[i].b);
			cHull.addPoint(tree[i].r,tree[i].t);
			cHull.addPoint(tree[i].r,tree[i].b);
		}
	}
	hull = cHull.getHull();
	if (debug) {
		ctx.beginPath();
		ctx.fillStyle = 'rgba(0,0,0,0.2)';
		ctx.moveTo(hull[0].x,hull[0].y);
		for (i=1; i<hull.length; i++) {
			ctx.lineTo(hull[i].x,hull[i].y);
		}
		ctx.fill();
	}
	return hull;
}
function carrega(iNo,xPai,yPai) { // carrega o nó filho, com seus descendentes, após o pai ter sofrido shiftNo()
	var no = tree[iNo];
	no.x = xPai + Math.cos(no.angA)*no.dist*distMult;
	no.y = yPai - Math.sin(no.angA)*no.dist*distMult;
	no.l = no.x-no.w/2;
	no.r = no.x+no.w/2;
	no.t = no.y-no.h/2;
	no.b = no.y+no.h/2;
	drawNode(iNo,false);
	for (var i=0; i<tree.length; i++) {
		if (tree[i].pai == no.id) {
			carrega(i,no.x,no.y);
		}
	}
}
function shiftNo(i,ang,xPai,yPai) { // desloca o nó pelo ângulo indicado, legando consigo todos os seus descendentes
	tree[i].angA += ang;
	tree[i].angR += ang;
	for (var j=0; j<tree.length; j++) {
		if (descende(j,i)) {
			tree[j].angA += ang;
		}
	}
	carrega(i,xPai,yPai);
}
function rollTree() {
	var i, maxyL=-1, maxyR=-1, xL, xR, angL, angR;
	for (i=1; i<tree.length; i++) {
		if (tree[i].x < tree[0].x) { // esquerda
			if (tree[i].y > maxyL) {
				maxyL = tree[i].y;
				xL = tree[i].x;
			}
		} else
		if (tree[i].x > tree[0].x) { // direita
			if (tree[i].y > maxyR) {
				maxyR = tree[i].y;
				xR = tree[i].x;
			}
		}
	}
	if (maxyL < 0 && maxyR < 0) {
		return;
	}
	angL = Math.atan2(tree[0].y-maxyL,xL-tree[0].x);
	if (angL < 0) {
		angL += Math.PI*2;
	}
	angL = angL - Math.PI;								// quantos graus passou do ângulo raso à esquerda
	angR = -Math.atan2(tree[0].y-maxyR,xR-tree[0].x);	// quantos graus passou do ângulo raso à direita
	for (i=1; i<tree.length; i++) {
		if (tree[i].pai == tree[0].id) {
			shiftNo(i,-(angL-angR)/2,tree[0].x,tree[0].y);
		}
	}
}
function unfold(no) {
	var i, p, f, filhos = [], hulls = [];
	for (i=0; i<tree.length; i++) {
		if (tree[i].pai == no.id) {
			filhos.push(i);
		}
	}
	if (filhos.length < 2) {
		return;
	}
	// ordena os filhos por ordem do ângulo (da esquerda pra direita)
	filhos.sort(function(a,b) {
		return tree[b].angR - tree[a].angR;
	});
	for (i=0; i<filhos.length; i++) {
		hulls.push(convexHull(filhos[i]));
	}
	var overlap, ang, angMin, angMax;
	if (filhos.length % 2 == 0) { // número par de filhos
		p = filhos.length/2; // primeiro índice à direita
		overlap = clip(hulls[p-1],hulls[p]); // dois grupos centrais
		for (i=0; i<overlap.length; i++) {
			ang = Math.atan2(overlap[i].y-no.y,overlap[i].x-no.x);
			if (i == 0) {
				if (debug) {
					ctx.fillStyle = 'red';
					ctx.beginPath();
					ctx.moveTo(overlap[0].x,overlap[0].y);
				}
				angMin = angMax = ang;
			} else {
				if (debug) {
					ctx.lineTo(overlap[i].x,overlap[i].y);
				}
				if (ang > angMax) {
					angMax = ang;
				} else
				if (ang < angMin) {
					angMin = ang;
				}
			}
		}
		if (angMax > angMin) {
			ang = angMax-angMin;
			if (debug) {
				ctx.lineTo(overlap[0].x,overlap[0].y);
				ctx.fill();
			}
			shiftNo(filhos[p-1],ang/2,no.x,no.y);
			shiftNo(filhos[p],-ang/2,no.x,no.y);
		}
		for (f=2; f<=filhos.length/2; f++) {
			// grupos à esquerda
			overlap = clip(hulls[p-f],hulls[p-f+1]);
			angMax = angMin = 0;
			for (i=0; i<overlap.length; i++) {
				ang = Math.atan2(overlap[i].y-no.y,overlap[i].x-no.x);
				if (i == 0) {
					if (debug) {
						ctx.fillStyle = 'red';
						ctx.beginPath();
						ctx.moveTo(overlap[0].x,overlap[0].y);
					}
					angMin = angMax = ang;
				} else {
					if (debug) {
						ctx.lineTo(overlap[i].x,overlap[i].y);
					}
					if (ang > angMax) {
						angMax = ang;
					} else
					if (ang < angMin) {
						angMin = ang;
					}
				}
			}
			if (angMax > angMin) {
				ang = angMax-angMin;
				if (debug) {
					ctx.lineTo(overlap[0].x,overlap[0].y);
					ctx.fill();
				}
				shiftNo(filhos[p-f],ang,no.x,no.y);
			}
			// grupos à direita
			overlap = clip(hulls[p+f-1],hulls[p+f-2]);
			angMax = angMin = 0;
			for (i=0; i<overlap.length; i++) {
				ang = Math.atan2(overlap[i].y-no.y,overlap[i].x-no.x);
				if (i == 0) {
					if (debug) {
						ctx.fillStyle = 'red';
						ctx.beginPath();
						ctx.moveTo(overlap[0].x,overlap[0].y);
					}
					angMin = angMax = ang;
				} else {
					if (debug) {
						ctx.lineTo(overlap[i].x,overlap[i].y);
					}
					if (ang > angMax) {
						angMax = ang;
					} else
					if (ang < angMin) {
						angMin = ang;
					}
				}
			}
			if (angMax > angMin) {
				ang = angMax-angMin;
				if (debug) {
					ctx.lineTo(overlap[0].x,overlap[0].y);
					ctx.fill();
				}
				shiftNo(filhos[p+f-1],-ang,no.x,no.y);
			}
		}
	} else { // número ímpar de filhos
		p = (filhos.length-1)/2; // índice do filho central
		for (f=1; f<(filhos.length+1)/2; f++) {
			// grupos à esquerda
			overlap = clip(hulls[p-f],hulls[p-f+1]);
			angMax = angMin = 0;
			for (i=0; i<overlap.length; i++) {
				ang = Math.atan2(overlap[i].y-no.y,overlap[i].x-no.x);
				if (i == 0) {
					if (debug) {
						ctx.fillStyle = 'red';
						ctx.beginPath();
						ctx.moveTo(overlap[0].x,overlap[0].y);
					}
					angMin = angMax = ang;
				} else {
					if (debug) {
						ctx.lineTo(overlap[i].x,overlap[i].y);
					}
					if (ang > angMax) {
						angMax = ang;
					} else
					if (ang < angMin) {
						angMin = ang;
					}
				}
			}
			if (angMax > angMin) {
				ang = angMax-angMin;
				if (debug) {
					ctx.lineTo(overlap[0].x,overlap[0].y);
					ctx.fill();
				}
				shiftNo(filhos[p-f],ang,no.x,no.y);
			}
			// grupos à direita
			overlap = clip(hulls[p+f],hulls[p+f-1]);
			angMax = angMin = 0;
			for (i=0; i<overlap.length; i++) {
				ang = Math.atan2(overlap[i].y-no.y,overlap[i].x-no.x);
				if (i == 0) {
					if (debug) {
						ctx.fillStyle = 'red';
						ctx.beginPath();
						ctx.moveTo(overlap[0].x,overlap[0].y);
					}
					angMin = angMax = ang;
				} else {
					if (debug) {
						ctx.lineTo(overlap[i].x,overlap[i].y);
					}
					if (ang > angMax) {
						angMax = ang;
					} else
					if (ang < angMin) {
						angMin = ang;
					}
				}
			}
			if (angMax > angMin) {
				ang = angMax-angMin;
				if (debug) {
					ctx.lineTo(overlap[0].x,overlap[0].y);
					ctx.fill();
				}
				shiftNo(filhos[p+f],-ang,no.x,no.y);
			}
		}
	}
	return false;
}
var emptyNodes = false; // mostrar nós "vazios", que normalmente não aparecem? (Só quando apertar Ctrl, para permitir inserir filhos.)
var polygons = false; // mostrar polígonos de sobreposição entre os ramos
function drawTwigs(no) {
	if (no == tree[0]) { // desenha a raiz
		ctx.beginPath();
		if (tree[0].doubt > 0) {
			ctx.setLineDash([2,2]);
		} else {
			ctx.setLineDash([]);
		}
		ctx.moveTo(tree[0].x,tree[0].y+100);
		ctx.lineTo(tree[0].x,tree[0].y);
		ctx.stroke();
	}
	for (var i=0; i<tree.length; i++) { // desenha o resto da árvore
		if (tree[i].pai == no.id) {
			ctx.beginPath();
			if (tree[i].doubt > 0) {
				ctx.setLineDash([2,2]);
			} else {
				ctx.setLineDash([]);
			}
			ctx.moveTo(no.x,no.y);
			ctx.lineTo(tree[i].x,tree[i].y);
			ctx.stroke();
			if (tree[i].filhos > 0) {
				drawTwigs(tree[i]);
			}
		}
	}
}
var data, hover = -1;
// desenha a árvore
function drawTree() {
	data = document.getElementById('data');
	canv.width = window.innerWidth-data.offsetWidth;
	canv.height = window.innerHeight;
	ctx.strokeStyle = '#844';
	ctx.lineWidth=2;
	drawTwigs(tree[0]);
	ctx.setLineDash([]);
	var i;
	for (i=0; i<tree.length; i++) {
		if (tree[i].nome.indexOf('+') < 0 && tree[i].nome.indexOf('-') < 0 || emptyNodes) {
			drawNode(i,i==hover || hover >= 0 && descende(i,hover));
			tree[i].l = l;
			tree[i].r = r;
			tree[i].t = t;
			tree[i].b = b;
		}
	}
}
// calcula as posições dos nós
function calcTree() {
	data = document.getElementById('data');
	var x = (window.innerWidth-data.offsetWidth)/2;
	var y = window.innerHeight-30;
	tree[0].x = x;
	tree[0].y = y;
	var nome = tree[0].nome;
	medeNo(tree[0]);
	tree[0].l = l;
	tree[0].r = r;
	tree[0].t = t;
	tree[0].b = b;
	if (tree[0].filhos > 0) {
		angFilhos(tree[0].id,tree[0].angA,x,y);
	}
	var i;
	if (debug) {
		drawTree();
		for (i=0; i<tree.length; i++) {
			if (tree[i].pai == tree[0].id) {
				convexHull(i);
			}
		}
		alert('debug');
	}
	var u = <?= $unfold ?>;
	if (u == 4) {
		for (i=1; i<tree.length; i++) {
			if (tree[i].nivel == 4 && tree[i].descend > 5) {
				unfold(tree[i]);
			}
		}
	}
	if (u >= 3) {
		for (i=1; i<tree.length; i++) {
			if (tree[i].nivel == 3 && tree[i].descend > 5) {
				unfold(tree[i]);
			}
		}
	}
	if (u >= 2) {
		for (i=1; i<tree.length; i++) {
			if (tree[i].nivel == 2 && tree[i].descend > 5) {
				unfold(tree[i]);
			}
		}
	}
	if (u >= 1) {
		for (i=1; i<tree.length; i++) {
			if (tree[i].nivel == 1 && tree[i].descend > 5) {
				unfold(tree[i]);
			}
		}
	}
	if (nivelMax > 1 && tree.length > 3) {
		/*var i;
		for (i=0; i<tree.length; i++) {
			if (tree[i].pai == tree[0].id) {
				unfold(tree[i]);
			}
		}*/
		unfold(tree[0]);
	}
	rollTree();
	drawTree();
}
var arv=[],nivel=0;
function getXY(id) {
	var i;
	for (i=0; i<arv.length; i++) {
		if (arv[i].id == id) {
			return([arv[i].x,arv[i].y]);
		}
	}
	return(null);
}
function getXYR(id) {
	var i;
	for (i=0; i<arv.length; i++) {
		if (arv[i].id == id) {
			return([arv[i].x,arv[i].y,arv[i].raio]);
		}
	}
	return(null);
}
function texto(txt,x,y) {
	var sep = '';
	if (txt.indexOf('+') > 0) {
		sep = '+';
	} else
	if (txt.indexOf('=') > 0) {
		sep = '=';
	}
	txt = txt.split(/\+|\=/);
	var i,h=ctx.measureText('M').width,
		hT = h*(txt.length-1.5),
		y1 = y-hT/2;
	for (i=0; i<txt.length; i++) {
		if (i < txt.length-1) {
			txt[i] += sep;
		}
		ctx.fillText(txt[i],x-medeTxt(txt[i])/2,y1+i*h);
	}
}
var wheelPos = 12;
// desenha as partes visíveis da árvore
function desenha() {
	var i, paiXY;
	ctx.fillStyle = '#CFC';
	ctx.fillRect(0,0,canv.width,canv.height);
	ctx.strokeStyle = '#00000040';
	ctx.fillStyle = '#000';
	console.log(wheelPos);
	for (i=0; i<arv.length; i++) {
		ctx.font = (wheelPos-arv[i].nivel)+'pt Arial';
		texto(arv[i].nome,arv[i].x,arv[i].y);
		ctx.lineWidth = (nivel - (arv[i].nivel - arv[0].nivel) + 1)/2;
		ctx.beginPath();
		ctx.arc(arv[i].x,arv[i].y,arv[i].raio,0,2*Math.PI);
		ctx.stroke();
		paiXY = getXY(arv[i].pai);
		if (paiXY != null) {
			ctx.beginPath();
			ctx.moveTo(arv[i].x,arv[i].y);
			ctx.lineTo(paiXY[0],paiXY[1]);
			ctx.stroke();
		}
		//console.log(arv[i].nome+': '+arv[i].x+','+arv[i].y);
	}
}
// acrescenta o nó "p" ao desenho da árvore (a partir daí começa a calcular a física)
function unfoldTree(p) {
	data = document.getElementById('data');
	canv.width = window.innerWidth-data.offsetWidth;
	canv.height = window.innerHeight;
	var x = (window.innerWidth-data.offsetWidth)/2;
	var y = window.innerHeight-30;
	tree[p].x = x;
	tree[p].y = y;
	arv.push(tree[p]);
	desenha();
}
function addChildren(pai,x,y) {
	var i,n=0,a,r;
	for (i=0; i<tree.length; i++) {
		if (tree[i].pai == pai) {
			a = 2*Math.PI*Math.random();
			r = 50 + 50*Math.random();
			tree[i].x = x + r*Math.cos(a);
			tree[i].y = y - r*Math.sin(a);
			/*tree[i].x = x + 200*Math.random()-100;
			tree[i].y = y + 200*Math.random()-100;*/
			tree[i].raio = medeTxt(tree[i].nome)/2 + 10;
			arv.push(tree[i]);
			n++;
		}
	}
	return(n);
}
function gravNo(id) {
	var i,
		n=0, // número de filhos de id (retornado pela função)
		f=0, // número de netos de id
		iID=0, // i deste id (arv[i])
		ang=null,angPai=null,angF,avoXY=null,paiXY;
	for (i=1; i<arv.length; i++) {
		if (arv[i].id == id) {
			iID = i;
		}
		if (arv[i].pai == id) {
			f += gravNo(arv[i].id);
			n++;
		}
	}
	//if (f == 0 && n > 0 && iID > 0) { // se não tem netos nem está na raiz, mexe os filhos
	if (n > 0) { // mexe os filhos
		console.log(arv[iID].nome+': '+n);
		paiXY = getXY(arv[iID].pai);
		for (i=0; i<arv.length; i++) {
			if (arv[i].id == arv[iID].pai) {
				avoXY = getXY(arv[i].pai);
				if (avoXY != null) {
					angPai = Math.atan2(avoXY[1]-paiXY[1],paiXY[0]-avoXY[0]);
				}
				break;
			}
		}
		if (paiXY != null) {
			ang = Math.atan2(paiXY[1]-arv[iID].y,arv[iID].x-paiXY[0]);
		}
		//console.log(arv[iID].nome+': '+ang+'/'+arv[iID].x+','+arv[iID].y);
		/*ctx.fillStyle = '#F00';
		if (angPai == null) {
			ctx.fillText(Math.round(ang*100)/100,arv[iID].x,arv[iID].y+15);
		} else {
			ctx.fillText(Math.round(ang*100)/100 + '|' + Math.round(angPai*100)/100,
				arv[iID].x,arv[iID].y+15);
		}*/
		// mexe cada filho
		var d, di=[], dAng=[], angIdeal;
		if (ang != null) {
			angIdeal = 2*Math.PI/(n+1);
		} else {
			angIdeal = 2*Math.PI/n;
		}
		ctx.fillStyle = '#00F';
		for (i=0; i<arv.length; i++) {
			if (arv[i].pai == arv[iID].id) {
				angF = Math.atan2(arv[iID].y-arv[i].y,arv[i].x-arv[iID].x);
				ctx.fillText(Math.round(angF*100)/100,arv[i].x,arv[i].y+15);
				d = angF - (ang-Math.PI);
				if (d > Math.PI) {
					d -= 2*Math.PI;
				}
				dAng.push(d);
				di.push(i);
			}
		}
		console.log(dAng);
		for (i=0; i<di.length; i++) {
			arv[di[i]].ang = ang-Math.PI+angIdeal*(i+1);
			arv[di[i]].x = arv[iID].x + (arv[iID].raio+arv[di[i]].raio)*Math.cos(arv[di[i]].ang);
			arv[di[i]].y = arv[iID].y - (arv[iID].raio+arv[di[i]].raio)*Math.sin(arv[di[i]].ang);
		}
	}
	return(n);
}
function gravidade() {
	console.log('-----');
	gravNo(arv[0].id);
	desenha();
	/*var i,j,dx,dy,dAng,angI,angJ,paiXY,
		Fx,Fy, // força linear
		R,Rx,Ry, // força radial
		maxD=50;
	for (i=1; i<arv.length; i++) { // quem vai mover
		for (j=0; j<arv.length; j++) { // quem vai aplicar força
			if (i != j) {
				
			}
			if (i != j) {
				dx = arv[i].x - arv[j].x;
				dy = arv[i].y - arv[j].y;
				if (arv[i].pai == arv[j].id) { // pai a partir de certa distância atrai ao invés de repelir
					maxD = 200;
				} else {
					maxD = 50;
				}
				if (dx > 0 && dx <= maxD) {
					Fx = 10 - 0.1*dx;
				} else
				if (dx < 0 && dx >= -maxD) {
					Fx = -10 - 0.1*dx;
				} else
				if (dx == 0) {
					var sinal = Math.random() < 0.5 ? -1 : 1;
					Fx = sinal*10;
				} else {
					Fx = 0;
				}
				if (dy > 0 && dy <= maxD) {
					Fy = 10 - 0.1*dy;
				} else
				if (dy < 0 && dy >= -maxD) {
					Fy = -10 - 0.1*dy;
				} else
				if (dy == 0) {
					var sinal = Math.random() < 0.5 ? -1 : 1;
					Fy = sinal*10;
				} else {
					Fy = 0;
				}
				Fx = Math.round(Fx*100)/100;
				Fy = Math.round(Fy*100)/100;
				if (arv[i].pai == arv[j].pai) { // irmãos se repelem pela força radial
					paiXY = getXY(arv[i].pai);
					angI = Math.atan2(paiXY[1]-arv[i].y,arv[i].x-paiXY[0]);
					angJ = Math.atan2(paiXY[1]-arv[j].y,arv[j].x-paiXY[0]);
					angI = Math.round(angI*100)/100;
					angJ = Math.round(angJ*100)/100;
					dAng = angI-angJ;
					if (dAng > Math.PI) {
						dAng = 2*Math.PI - dAng;
					} else
					if (dAng < -Math.PI) {
						dAng = -2*Math.PI + dAng;
					}
					dAng = Math.round(dAng*100)/100;
					if (dAng > 0) {
						R = Math.PI/100 + 0.01*dAng;
					} else {
						R = -Math.PI/100 - 0.01*dAng;
					}
				} else {
					dAng = null;
					R = 0;
				}
				console.log(arv[i].nome+'/'+arv[j].nome+': '+Fx+','+Fy+';'+angI+':'+angJ+'='+dAng+' ('+R+')');
				arv[i].dx += Fx;
				arv[i].dy += Fy;
				arv[i].dAng += R;
			}
		}
	}
	for (i=1; i<arv.length; i++) { // move (e reseta dx/dy/dAng)
		paiXY = getXY(arv[i].pai);
		R = Math.sqrt(Math.pow(arv[i].x-paiXY[0],2) + Math.pow(arv[i].y-paiXY[1],2));
		angI = Math.atan2(paiXY[1]-arv[i].y,arv[i].x-paiXY[0]);
		arv[i].x = paiXY[0] + R*Math.cos(angI+arv[i].dAng);
		arv[i].y = paiXY[1] - R*Math.sin(angI+arv[i].dAng);
		arv[i].x += arv[i].dx;
		arv[i].y += arv[i].dy;
		arv[i].dx = 0;
		arv[i].dy = 0;
		arv[i].dAng = 0;
	}
	desenha();*/
}
var gravidadeTimer;
function addNivel() {
	var i,n=0;
	for (i=0; i<tree.length; i++) {
		if (tree[i].nivel == nivel) {
			//console.log(tree[i]);
			n = addChildren(tree[i].id,tree[i].x,tree[i].y);
			tree[i].raio += n*25;
		}
	}
	nivel++;
	//gravidadeTimer = setTimeout(gravidade,500);
	//gravidadeTimer = setInterval(gravidade,50);
	desenha();
	//console.log(arv);
}
function startTree() {
	//console.log(tree);
	data = document.getElementById('data');
	canv.width = window.innerWidth-data.offsetWidth;
	canv.height = window.innerHeight;
	tree[0].x = (window.innerWidth-data.offsetWidth)/2;
	//tree[0].y = window.innerHeight-30;
	tree[0].y = window.innerHeight/2;
	arv.push(tree[0]);
	desenha();
}
function getHanGrp(zi,what=1) { // what = 1:name, 2:color
	var i, p, l, ls = document.getElementById('divEco').querySelectorAll('label');
	for (i=0; i<ls.length; i++) {
		if (ls[i].innerHTML.indexOf(zi) > 0) {
			p = ls[i].parentNode.querySelectorAll('legend')[0];
			if (what == 1) {
				return p.innerHTML; // nome do grupo
			} else {
				return window.getComputedStyle(p).getPropertyValue('color'); // cor do grupo
			}
		}
	}
	return '?';
}
function getGeoMean(sigla) {
	if (sigla == '') {
		return '';
	}
	if (sigla[0].search(/[0-9]/) == 0) { // começa com número
		var r = sigla[0], i;
		for (i=1; i<sigla.length; i++) {
			if (sigla[i].search(/[0-9]/) == 0) { // é número
				r = r + sigla[i];
			} else
			if (sigla[i].search(/[A-Za-zÀ-ÿ]/) == 0) {
				if (i-1 >= 0 && sigla[i-1].search(/[0-9]/) == 0) { // se tem um número colado antes é medida, não texto comum
					if (sigla[i] == 's' && i+1 < sigla.length && sigla[i+1] == 'p') {
						r = r + ' espécie';
						i++; // pula a próxima letra ('sp' tem duas)
					} else
					if (sigla[i] == 'g') {
						r = r + ' gênero';
					} else
					if (sigla[i] == 'f') {
						r = r + ' família';
					}
					if (sigla[0] != '1' || sigla.length > 1 && sigla[1].search(/[0-9]/) == 0) { // mais de um
						r = r+'s';
					}
				} else {
					r = r + sigla[i];
				}
			}
		}
		return r;
	} else
	switch (sigla) {
		case '†' :
			return 'extinto';
		case '-' :
			return 'a';
		case 'se' :
			return 'sudeste';
		case 'sw' :
			return 'sudoeste';
		case 'ne' :
			return 'nordeste';
		case 'nw' :
			return 'noroeste';
		case '>' :
			return 'introduzido em ';
		default :
			var i, l, ls = document.getElementById('divGeo').querySelectorAll('label');
			if (sigla[sigla.length-1] == '?') {
				sigla = sigla.substr(0,sigla.length-1);
				for (i=0; i<ls.length; i++) {
					if (ls[i].innerHTML.indexOf(sigla+' ') == 0) {
						l = ls[i].innerHTML;
						return l.substr(sigla.length+1) + ' (?)'; // dúvida sobre se é mesmo aquele local (igual abaixo, mas com ?)
					}
				}
			} else
			for (i=0; i<ls.length; i++) { // procura em todos os <label>
				if (ls[i].innerHTML.indexOf(sigla+' ') == 0) { // se encontrou aquela sigla
					l = ls[i].innerHTML;
					return l.substr(sigla.length+1); // retorna o texto imediatamente depois da sigla (pula o espaço entre os dois)
				}
			}
			return '?';
	}
}
function getGeoTokens(geo,tipo) {
	var t=[],		// locais nativo
		tintr=[],	// locais introduzido
		M='',		// Maiúscula
		m='',		// minúscula
		Mm = '',	// Maiúscula+minúscula(s)
		mean='',	// tradução, nome do local
		intr=false,	// introduzido em
		par='',		// parêntesis
		hif='',		// hífen
		ch, i;
	if (geo.substr(geo.length-1,1) != ',') {
		geo = geo + ','; // insere vírgula no final para processar dentro do loop, e não depois dele
	}
	while (geo != '') {
		ch = geo.substr(0,1);
		geo = geo.substr(1);
		if (ch.search(/[a-zA-ZÉ]/) == 0) { // letras
			if (ch.search(/[A-ZÉ]/) == 0) { // Maiúsculas: Continente/Região Biogeográfica
				//A,E,É,F,Fh,Fnn,Fss,G,H,Hn,Hs,I,M,N,O,P,Q,R,S,T,VM
				if (Mm != '') {
					mean = getGeoMean(Mm);
					if (mean != '?') {
						if (!intr) {
							t.push(mean);
						} else {
							tintr.push(mean);
						}
					} else {
						mean = '';
						for (i=0; i<Mm.length; i++) {
							if (['n','s'].indexOf(Mm[i]) >= 0) { // norte ou sul
								if (i < Mm.length-1 &&
									['e','w'].indexOf(Mm[i+1]) >= 0) { // leste ou oeste
									mean = mean + getGeoMean(Mm[i]+Mm[i+1]) + ' ';
									i++; // pula a próxima letra
								} else {
									mean = mean + getGeoMean(Mm[i]) + ' ';
								}
							} else {
								mean = mean + getGeoMean(Mm[i]) + ' ';
							}
						}
						if (!intr) {
							t.push(mean.substr(0,mean.length-1));
						} else {
							tintr.push(mean.substr(0,mean.length-1));
						}
					}
					Mm = '';
					M = ch;
				} else
				if (m != '') {
					if (m+ch == 'sT') {
						if (geo[0] == '!') {
							Mm = m+ch;
						} else
						if (!intr) {
							t.push(getGeoMean('sT'));
						} else {
							tintr.push(getGeoMean('sT'));
						}
						m = '';
					} else
					if (m.substr(0,2) == 'r.') { // rio
						m = m+ch;
					} else {
						if (!intr) {
							t.push(getGeoMean(m));
						} else {
							tintr.push(getGeoMean(m));
						}
						M = ch;
						m = '';
					}
				} else
				if (M != '') {
					if (!intr) {
						t.push(getGeoMean(M));
					} else {
						tintr.push(getGeoMean(M));
					}
					M = ch;
				} else {
					M = ch;
				}
			} else { // minúsculas: região menor ou categoria taxonômica (sp g f o...)
				if (par != '') {
					par = par+ch;
				} else
				if (Mm != '') {
					Mm = Mm+ch;
				} else
				if (M != '') {
					Mm = M+ch;
					M = '';
				} else {
					m = m+ch;
				}
			}
		} else {
			switch (ch) {
				case '-' :
					if (Mm != '') {
						mean = getGeoMean(Mm);
						if (mean == '?') {
							mean = '';
							for (i=0; i<Mm.length; i++) {
								if (['n','s'].indexOf(Mm[i]) >= 0) { // norte ou sul
									if (i < Mm.length-1 &&
										['e','w'].indexOf(Mm[i+1]) >= 0) { // leste ou oeste
										mean = mean + getGeoMean(Mm[i]+Mm[i+1]);
										i++; // pula a próxima letra
									} else {
										mean = mean + getGeoMean(Mm[i]) + ' ';
									}
								} else {
									mean = mean + getGeoMean(Mm[i]) + ' ';
								}
							}
							hif = mean.substr(0,mean.length-1);
						} else {
							hif = mean;
						}
						hif = mean + ' a ';
						Mm = '';
					} else
					if (M != '') {
						hif = getGeoMean(M) + ' a ';
						M = '';
					} else
					if (m != '') {
						hif = getGeoMean(m) + ' a ';
						m = '';
					} else
					if (hif != '') {
						hif = hif + ' a ';
					}
					break;
				case ' ' :
				case ',' : // terminou aquele local
					if (hif != '') {
						if (Mm != '') {
							mean = getGeoMean(Mm);
							if (mean == '?') {
								mean = '';
								for (i=0; i<Mm.length; i++) {
									if (['n','s'].indexOf(Mm[i]) >= 0) { // norte ou sul
										if (i < Mm.length-1 &&
											['e','w'].indexOf(Mm[i+1]) >= 0) { // leste ou oeste
											mean = mean + getGeoMean(Mm[i]+Mm[i+1]);
											i++; // pula a próxima letra
										} else {
											mean = mean + getGeoMean(Mm[i]) + ' ';
										}
									} else {
										mean = mean + getGeoMean(Mm[i]) + ' ';
									}
								}
								hif = hif + mean.substr(0,mean.length-1);
							} else {
								hif = hif + mean;
							}
							Mm = '';
						} else
						if (M != '') {
							hif = hif + getGeoMean(M);
							M = '';
						} else
						if (m != '') {
							hif = hif + getGeoMean(m);
							m = '';
						}
						if (!intr) {
							t.push(hif);
						} else {
							tintr.push(hif);
						}
						hif = '';
					} else
					if (Mm != '') {
						mean = getGeoMean(Mm);
						if (mean != '?') {
							if (!intr) {
								t.push(mean);
							} else {
								tintr.push(mean);
							}
						} else {
							mean = '';
							for (i=0; i<Mm.length; i++) {
								if (['n','s'].indexOf(Mm[i]) >= 0) { // norte ou sul
									if (i < Mm.length-1 &&
										['e','w'].indexOf(Mm[i+1]) >= 0) { // leste ou oeste
										mean = mean + getGeoMean(Mm[i]+Mm[i+1]) + ' ';
										i++; // pula a próxima letra
									} else {
										mean = mean + getGeoMean(Mm[i]) + ' ';
									}
								} else {
									mean = mean + getGeoMean(Mm[i]) + ' ';
								}
							}
							if (!intr) {
								t.push(mean.substr(0,mean.length-1));
							} else {
								tintr.push(mean.substr(0,mean.length-1));
							}
						}
						Mm = '';
					} else
					if (M != '') {
						if (!intr) {
							t.push(getGeoMean(M));
						} else {
							tintr.push(getGeoMean(M));
						}
						M = '';
					} else
					if (m != '') {
						if (!intr) {
							t.push(getGeoMean(m));
						} else {
							tintr.push(getGeoMean(m));
						}
						m = '';
					}
					break;
				case '(' :
					if (hif != '') {
						par = hif;
						hif = '';
					}
					if (Mm != '') {
						mean = getGeoMean(Mm);
						if (mean == '?') {
							mean = '';
							for (i=0; i<Mm.length; i++) {
								if (['n','s'].indexOf(Mm[i]) >= 0) { // norte ou sul
									if (i < Mm.length-1 &&
										['e','w'].indexOf(Mm[i+1]) >= 0) { // leste ou oeste
										mean = mean + getGeoMean(Mm[i]+Mm[i+1]);
										i++; // pula a próxima letra
									} else {
										mean = mean + getGeoMean(Mm[i]) + ' ';
									}
								} else {
									mean = mean + getGeoMean(Mm[i]) + ' ';
								}
							}
							par = par + mean.substr(0,mean.length-1) + ' (';
						} else {
							par = par + mean + ' (';
						}
						Mm = '';
					} else
					if (M != '') {
						par = par + getGeoMean(M) + ' (';
						M = '';
					} else
					if (m != '') {
						par = par + getGeoMean(m) + ' (';
						m = '';
					}
					break;
				case ')' :
					if (Mm != '') {
						par = par + getGeoMean(Mm) + ')';
						Mm = '';
					}
					if (M != '') {
						par = par + getGeoMean(M) + ')';
						M = '';
					} else
					if (m != '') {
						par = par + getGeoMean(m) + ')';
						m = '';
					} else {
						par = par + ')';
						var ult = par.lastIndexOf('(');
						par = par.substr(0,ult) + // parte antes dos ( )
							'(' + getGeoMean(par.substr(ult+1,par.length-ult-2)) + ')'; // parte dentro dos ( )
					}
					if (geo[0] != '-') {
						if (!intr) {
							t.push(par);
						} else {
							tintr.push(par);
						}
					} else {
						hif = par;
					}
					par = '';
					break;
				case '!' :
					if (Mm != '') {
						mean = getGeoMean(Mm);
						if (mean == '?') {
							mean = '';
							for (i=0; i<Mm.length; i++) {
								if (['n','s'].indexOf(Mm[i]) >= 0) { // norte ou sul
									if (i < Mm.length-1 &&
										['e','w'].indexOf(Mm[i+1]) >= 0) { // leste ou oeste
										mean = mean + getGeoMean(Mm[i]+Mm[i+1]);
										i++; // pula a próxima letra
									} else {
										mean = mean + getGeoMean(Mm[i]) + ' ';
									}
								} else {
									mean = mean + getGeoMean(Mm[i]) + ' ';
								}
							}
							Mm = mean.substr(0,mean.length-1);
						} else {
							Mm = mean;
						}
						if (!intr) {
							t.push(Mm + ' (maioria)');
						} else {
							tintr.push(Mm + ' (maioria)');
						}
						Mm = '';
					} else
					if (M != '') {
						if (!intr) {
							t.push(getGeoMean(M) + ' (maioria)');
						} else {
							tintr.push(getGeoMean(M) + ' (maioria)');
						}
						M = '';
					} else
					if (m != '') {
						if (!intr) {
							t.push(getGeoMean(m) + ' (maioria)');
						} else {
							tintr.push(getGeoMean(m) + ' (maioria)');
						}
						m = '';
					} else
					if (par != '') {
						if (!intr) {
							t.push(getGeoMean(par) + ' (maioria)');
						} else {
							tintr.push(getGeoMean(par) + ' (maioria)');
						}
						par = '';
					}
					break;
				case '>' :
					intr = true;
					break;
				default :
					if (ch == '+') {
						ch = '†';
					}
					if (par != '') {
						par = par+ch;
					} else
					if (Mm != '') {
						Mm = Mm+ch;
					} else
					if (M != '') {
						M = M+ch;
					} else
					if (m != '') {
						m = m+ch;
					} else
					if (ch == '>') {
						M = '>';
					}
			}
		}
	}
	var distGeo = t.join(', ');
	if (tintr.length > 0) {
		if (distGeo != '') {
			distGeo = distGeo + '; introduzido em ' + tintr.join(', ');
		} else {
			distGeo = 'introduzido em ' + tintr.join(', ');
		}
	}
	if (distGeo != '') {
		return 'Distribuição geográfica: ' + distGeo + '.';
	} else {
		return '';
	}
}
function getEcoMean(zi) {
	if (zi.search(/[\u4E00-\u9FFF]/) < 0) { // não é hanzi
		return zi;
	}
	var i, l, ls = document.getElementById('divEco').querySelectorAll('label');
	for (i=0; i<ls.length; i++) {
		if (ls[i].innerHTML.indexOf(zi) > 0) {
			l = ls[i].innerHTML;
			l = l.substr(0,l.indexOf(zi)-1); // apenas o português (parte inicial)
			return l;
		}
	}
	return '?';
}
function juntaEco(arr,sep=', ') {
	var i, j, r = '', maioria = false;
	for (i=0; i<arr.length; i++) {
		for (j=0; j<arr[i].length; j++) {
			if (arr[i][j] == '!') {
				maioria = true;
			} else
			if (arr[i][j] == '|') {
				r = r + '|';
			} else
			if (arr[i][j] == '=') {
				r = r + '=';
			} else
			if (arr[i][j] == '-') {
				r = r + ' a ';
			} else
			if (arr[i][j] == ' ') {
				r = r + ' ';
			} else
			if (arr[i][j] == '+') {
				r = r + ' ou mais' + sep;
			} else
			if (arr[i][j] == ':') {
				r = r + ': ';
			} else
			if (arr[i][j] == '<') {
				r = r + ' < ';
			} else
			if (arr[i][j] == '>') {
				r = r + ' > ';
			} else
			if (arr[i][j] == '(') {
				r = r + ' (';
			} else
			if (arr[i][j] == ')') {
				r = r + ')' + sep;
			} else
			if (arr[i][j].search(/[0-9]/) == 0) {
				r = r + arr[i][j];
			} else
			if (arr[i][j].search(/[A-Za-zÀ-ÿ,.]/) == 0) {
				if (j-1 >= 0 && arr[i][j-1].search(/[0-9]/) == 0) { // se tem um número colado antes é medida, não texto comum
					var jNum = j-1;
					if (arr[i][j] == 's' && j+1 < arr[i].length && arr[i][j+1] == 'p') {
						r = r + ' espécie';
						j++; // pula a próxima letra ('sp' tem duas)
					} else
					if (arr[i][j] == 'g') {
						r = r + ' gênero';
					} else
					if (arr[i][j] == 'f') {
						r = r + ' família';
					} else
					if (arr[i][j] == 'y') {
						r = r + ' ano';
					}
					if (arr[i][jNum] != '1' || arr[i].length > jNum+1 && arr[i][jNum+1].search(/[0-9]/) == 0) { // mais de um
						r = r+'s';
					}
				} else {
					r = r + arr[i][j];
				}
			} else {
				if (maioria) {
					if (arr[i][j] == '半') {
						r = r + 'semi-';
					} else
					if (arr[i][j] == '无') {
						r = r + 'sem ';
					} else
					if (arr[i][j] == '不') {
						r = r + 'não ';
					} else
					if (['久','点','几','很','众'].indexOf(arr[i][j]) >= 0) { // se o atual for 久 点 几 很 ou 众
						if (j < arr[i].length-1 && arr[i][j+1] == ')') {
							r = r + getEcoMean(arr[i][j]);
						} else {
							r = r + getEcoMean(arr[i][j]) + ' ';
						}
					} else
					if (j < arr[i].length-1 && ['-','(',')','<','>',':','?'].indexOf(arr[i][j+1]) >= 0) { // se o próximo for - ( ) < > : ou ? -> não usar separador
						r = r + getEcoMean(arr[i][j]) + ' (maioria)';
						maioria = false;
					} else {
						r = r + getEcoMean(arr[i][j]) + ' (maioria)' + sep;
						maioria = false;
					}
				} else {
					if (arr[i][j] == '半') {
						r = r + 'semi-';
					} else
					if (arr[i][j] == '无') {
						r = r + 'sem ';
					} else
					if (arr[i][j] == '不') {
						r = r + 'não ';
					} else
					if (['久','点','几','很','众'].indexOf(arr[i][j]) >= 0) { // se o atual for 久 点 几 很 ou 众
						if (j < arr[i].length-1 && arr[i][j+1] == ')') {
							r = r + getEcoMean(arr[i][j]);
						} else {
							r = r + getEcoMean(arr[i][j]) + ' ';
						}
					} else
					if (j < arr[i].length-1 && ['-','(',')','<','>',':','?'].indexOf(arr[i][j+1]) >= 0) { // se o próximo for - ( ) < > : ou ? -> não usar separador
						r = r + getEcoMean(arr[i][j]);
					} else {
						r = r + getEcoMean(arr[i][j]) + sep;
					}
				}
			}
		}
	}
	if (r.substr(r.length-sep.length) == sep) {
		r = r.substr(0,r.length-sep.length);
	}
	return r;
}
function getEcoTokens(ju,tipo) {
	var tHab=[],	// Habitat
		tMov=[],	// Locomoção
		tFeed=[],	// Dieta
		tSex=[],	// Reprodução
		tBod=[],	// Corpo
		tBehav=[],	// Comportamento
		tam='',		// Tamanho
		peso='',	// Peso
		vel='',		// Velocidade
		ch,			// cada caracter
		grupo='',	// grupo de que fazem parte os caracteres chineses
		ctempo='',	// hanzi (久) + tempo
		zh='',		// unir caracteres chineses temporariamente
		par=false,	// parêntesis
		save=false,	// se já está na hora de salvar zh num dos arrays
		num='',		// unir os números temporariamente
		und='',		// unir as unidades temporariamente
		nund='';	// unir números e unidades temporariamente
	ju = ju + ' '; // insere espaço no final para processar dentro do loop, e não depois dele
	while (ju != '') {
		ch = ju.substr(0,1);
		ju = ju.substr(1);
		if (ch.search(/[0-9]/) == 0) { // números
			if (zh == '<' || zh == '>') {
				num = zh + ch;
				zh = '';
			} else
			if (zh != '') {
				zh = zh + ch;
			} else {
				num = num + ch;
			}
			// depois dos números podem vir unidades (letras: cm, m, kg, sp, g, f, o, y, m, d...) ou hífen separando (ex: Lacertidae 9-46cm)
		} else
		if (ch.search(/[A-Za-zÀ-ÿ]/) == 0) { // letras
			/*if (zh != '') {
				zh = zh + ch;
			} else
			if (num != '') {
				und = und + ch;
			}*/
			if (num != '') {
				und = und + ch;
			} else {
				zh = zh + ch;
			}
		} else
		if (ch.search(/[\u4E00-\u9FFF]/) == 0) { // hanzi
			if (!par && ch != '半') {
				grupo = getHanGrp(ch);
			}
			zh = zh + ch;
			if (zh.indexOf('-') > 0 && ju[0] != '!' && ju[0] != ')' && zh.indexOf('半') < zh.length-1) { // pós -, próx não é ! ), se tiver 半 não é o último [salva]
				save = true;
			} else
			if (zh.indexOf('半') > 0 && zh.indexOf('半') < zh.length-1 && ju[0] != '!' && ju[0] != '-') { // pós 半, próx não é ! nem - [salva]
				save = true;
			} else
			if (grupo != 'Forma' && ch != '半' && ch != '久' && zh.indexOf('(') < 0 && ju[0] != '!' && ju[0] != '-' && ju[0] != '(' && ju[0] != '<' && ju[0] != '>' && ju[0] != '?') { // próx é ! - ( < > ou ? -> não salva
				save = true;
			}
			/*
			 próx é !, não salva
			 próx é -, não salva
			 - não salva
			 pós -, próx não é ! [salva]
			 ! (se próx não é -) [salva]
			 半 não salva
			 pós 半, próx não é ! nem - [salva]
			 próx é espaço [salva]
			*/
		} else {
			switch (ch) {
				case ' ' : // terminou aquele token (se não estiver nos parêntesis)
					if (!par) {
						if (num != '' && und != '') {
							nund = nund + num + und;
							if (ctempo != '') {
								grupo = 'Corpo'
								zh = ctempo + nund;
								ctempo = '';
							} else
							if (['mm','cm','m'].indexOf(und) >= 0) {
								if (tam != '') {
									tam = tam + ', ';
								}
								tam = tam + nund;
							} else
							if (['g','kg'].indexOf(und) >= 0) {
								if (peso != '') {
									peso = peso + ', ';
								}
								peso = peso + nund;
							} else
							if (['km/h','m/s'].indexOf(und) >= 0) {
								if (vel != '') {
									vel = vel + ', ';
								}
								vel = vel + nund;
							}
							num = '';
							und = '';
							nund = '';
						}
						save = true;
					} else {
						zh = zh + ' ';
					}
					break;
				case '!' :
					if (num != '' && und != '') {
						nund = nund + num + und;
						if (['mm','cm','m'].indexOf(und) >= 0) {
							tam = nund+'!';
						} else
						if (['g','kg'].indexOf(und) >= 0) {
							peso = nund+'!';
						} else
						if (['km/h','m/s'].indexOf(und) >= 0) {
							vel = nund+'!';
						}
						num = '';
						und = '';
						nund = '';
					} else {
						zh = '!' + zh;
						if (ju[0] != '-' && ju[0] != '(') {
							save = true;
						}
					}
					break;
				case '?' :
					zh = zh + '?';
					if (ju[0] != '-' && ju[0] != '(') {
						save = true;
					}
					break;
				case '/' :
					if (und != '') {
						und = und + '/';
					} else
					if (zh != '') {
						zh = zh + '/';
					}
					break;
				case '(' :
					if (zh != '') {
						zh = zh + '(';
					}
					par = true;
					break;
				case ')' :
					if (zh != '') {
						zh = zh + ')';
					}
					if (ju[0] != '!' && ju[0] != '-') {
						save = true;
					}
					break;
				case '-' :
					if (zh != '') {
						zh = zh + '-';
					} else
					if (num != '' && und != '') {
						nund = num + und + '-';
						num = '';
						und = '';
					} else
					if (num != '') {
						num = num + '-';
					}
					break;
				case '<' : // 女>男 <850kg
					zh = zh + '<';
					break;
				case '>' :
					zh = zh + '>';
					break;
				case '.' :
				case ',' : // decimal ou texto (se aparecer ponto, trocar por vírgula; se sucedidos por três algarismos (milhar), remover -- pode até introduzir separador de milhar automaticamente, mas não inserir no banco)
					if (num != '' && und != '') { // neste caso (que nem deveria acontecer), agir como espaço
						nund = nund + num + und;
						if (['mm','cm','m'].indexOf(und) >= 0) {
							tam = nund;
						} else
						if (['g','kg'].indexOf(und) >= 0) {
							peso = nund;
						} else
						if (['km/h','m/s'].indexOf(und) >= 0) {
							vel = nund+'!';
						}
						num = '';
						und = '';
						nund = '';
					} else
					if (num != '') {
						num = num + ',';
					}
					break;
				case '+' :
					if (num != '' && und != '') {
						nund = nund + num + und + '+';
						if (ctempo != '') {
							//grupo = 'Corpo'
							zh = 'Longevidade: ' + nund;
							ctempo = '';
							save = true;
						} else
						if (['mm','cm','m'].indexOf(und) >= 0) {
							tam = nund;
						} else
						if (['g','kg'].indexOf(und) >= 0) {
							peso = nund;
						} else
						if (['km/h','m/s'].indexOf(und) >= 0) {
							vel = nund;
						}
						num = '';
						und = '';
						nund = '';
					} else
					if (zh != '') {
						zh = zh + '+';
					}
					break;
				default: // ? :
					zh = zh + ch;
					break;
			}
		}
		if (save) {
			if (par) {
				par = false;
			}
			switch (grupo) {
				case 'Habitat' :
					tHab.push(zh);
					break;
				case 'Locomoção' :
					tMov.push(zh);
					break;
				case 'Dieta' :
					tFeed.push(zh);
					break;
				case 'Reprodução' :
					tSex.push(zh);
					break;
				case 'Corpo' :
					tBod.push(zh);
					break;
				case 'Comportamento' :
					tBehav.push(zh);
					break;
				case '' :
				case 'Forma' :
					if (zh != '') {
						tBod.push(zh);
					}
			}
			zh = '';
			grupo = '';
			save = false;
		}
	}
	var sep;
	if (tipo == 2) {
		sep = '. ';
	} else {
		sep = '.<br>';
	}
	var texto = '';
	if (tHab.length > 0) {
		texto = texto + "<span style='color:" + <?= "'$ecoHab'" ?> + "'>Habitat: "+juntaEco(tHab)+"</span>"+sep;
	}
	if (tMov.length > 0) {
		texto = texto + "<span style='color:" + <?= "'$ecoMov'" ?> + "'>Locomoção: "+juntaEco(tMov)+"</span>"+sep;
	}
	if (tFeed.length > 0) {
		texto = texto + "<span style='color:" + <?= "'$ecoFeed'" ?> + "'>Dieta: "+juntaEco(tFeed)+"</span>"+sep;
	}
	if (tSex.length > 0) {
		texto = texto + "<span style='color:" + <?= "'$ecoSex'" ?> + "'>Reprodução: "+juntaEco(tSex)+"</span>"+sep;
	}
	if (tBod.length > 0) {
		texto = texto + "<span style='color:" + <?= "'$ecoBod'" ?> + "'>Corpo: "+juntaEco(tBod)+"</span>"+sep;
	}
	if (tBehav.length > 0) {
		texto = texto + "<span style='color:" + <?= "'$ecoBehav'" ?> + "'>Comportamento: "+juntaEco(tBehav)+"</span>"+sep;
	}
	if (tam != '') {
		tam = tam.replace('<','até ');
		tam = tam.replace('>','acima de ');
		tam = tam.replace('-',' a ');
		tam = tam.replace('+',' ou mais');
		tam = tam.replace('!',' (maioria)');
		texto = texto + 'Tamanho: '+tam+sep;
	}
	if (peso != '') {
		peso = peso.replace('<','até ');
		peso = peso.replace('>','acima de ');
		peso = peso.replace('-',' a ');
		peso = peso.replace('+',' ou mais');
		peso = peso.replace('!',' (maioria)');
		texto = texto + 'Peso: '+peso+sep;
	}
	if (vel != '') {
		vel = vel.replace('<','até ');
		vel = vel.replace('>','acima de ');
		vel = vel.replace('-',' a ');
		vel = vel.replace('+',' ou mais');
		vel = vel.replace('!',' (maioria)');
		texto = texto + 'Velocidade: '+vel+sep;
	}
	texto = texto.substr(0,texto.length-1);
	/*if (tipo == 2) {
		texto = texto.substr(0,texto.length-1);
	} else {
		texto = texto.substr(0,texto.length-4);
	}*/
	return texto;
}
function isValidURL(str) { // https://stackoverflow.com/a/34695026/1086511
	var a  = document.createElement('a');
	a.href = str;
	return (a.host && a.host != window.location.host);
}
function isNumeric(n) {
	return !isNaN(parseFloat(n)) && isFinite(n);
}
var keep = false;
function mouseMove(e) {
	if (canvasMenu) {
		return;
	}
	var rect = canv.getBoundingClientRect();
	var x = e.clientX - rect.left;
	var y = e.clientY - rect.top;
	var nenhum = true, mantem = false;
	var i, j, k;
	for (i=0; i<tree.length; i++) {
		if ((tree[i].nome.indexOf('+') < 0 && tree[i].nome.indexOf('-') < 0 || emptyNodes) &&
				tree[i].l < x && tree[i].r > x &&
				tree[i].t < y && tree[i].b > y &&
				i == hover) {
			// ainda está sobre o mesmo clado
			mantem = true;
			nenhum = false;
		}
	}
	for (i=0; i<tree.length; i++) {
		if ((tree[i].nome.indexOf('+') < 0 && tree[i].nome.indexOf('-') < 0 || emptyNodes) &&
				tree[i].l < x && tree[i].r > x &&
				tree[i].t < y && tree[i].b > y && !mantem) {
			if (keep) {
				break;
			}
			// está sobre um clado diferente
			nenhum = false;
			if (hover >= 0) {
				// desmarca o clado anterior, se houver
				for (j=0; j<tree.length; j++) {
					if ((tree[j].nome.indexOf('+') < 0 && tree[j].nome.indexOf('-') < 0 || emptyNodes) && descende(j,hover)) {
						drawNode(j,false);
					}
				}
				drawNode(hover,false);
			}
			hover = i;
			// marca o clado atual
			if (tree[i].nome.substr(0,1) != '/') {
				document.getElementById('cladoTit').innerHTML = tree[i].nome;
			} else {
				var nome = tree[i].nome.substr(1);
				if (nome.indexOf('.') > 0) { // espécie ou subespécie
					for (j=0; j<tree.length; j++) {
						if (tree[j].id == tree[i].pai) {
							if (nome.lastIndexOf('.') != nome.indexOf('.')) { // subespécie
								nome = tree[j].nome.substr(1) + ' ' + nome.substr(nome.lastIndexOf('.')+1);
								for (k=0; k<tree.length; k++) {
									if (tree[k].id == tree[j].pai) {
										nome = tree[k].nome.substr(1) + ' ' + tree[j].nome.substr(tree[j].nome.indexOf('.')+1) + ' ' + tree[i].nome.substr(tree[i].nome.lastIndexOf('.')+1);
										break;
									}
								}
								break;
							} else { // espécie
								nome = tree[j].nome.substr(1) + ' ' + nome.substr(nome.indexOf('.')+1);
								break;
							}
						}
					}
				}
				document.getElementById('cladoTit').innerHTML = '<i>' + nome + '<i>';
			}
			if (tree[i].nomePT != '' || tree[i].nomeEN != '' || tree[i].nomeZH != '') {
				var nomePop = '';
				if (tree[i].nomePT != '') {
					nomePop = nomePop + "<span style='color:#080'>" + tree[i].nomePT + '</span>|';
				}
				if (tree[i].nomeEN != '') {
					nomePop = nomePop + "<span style='color:#008'>" + tree[i].nomeEN + '</span>|';
				}
				if (tree[i].nomeZH != '') {
					nomePop = nomePop + "<span style='color:#800'>" + tree[i].nomeZH + '</span>|';
				}
				nomePop = nomePop.substr(0,nomePop.length-1).replace(/[|+]/g,', ');
				document.getElementById('cladoPop').innerHTML = nomePop;
			} else {
				document.getElementById('cladoPop').innerHTML = '';
			}
			document.getElementById('cladoEco').innerHTML = getEcoTokens(tree[i].eco,1);
			document.getElementById('cladoGeo').innerHTML = getGeoTokens(tree[i].geo,1);
			if (tree[i].nreg) {
				if (tree[i].nreg.indexOf(',') > 0 && tree[i].nreg[tree[i].nreg.indexOf(',')-1].search(/[0-9]/) < 0) { // famílias/gêneros e espécies para o mesmo táxon (tem que ter vírgula, e não pode ter número logo antes da vírgula)
					var regs = tree[i].nreg.split(','), regsT = '';
					for (j=0; j<regs.length; j++) {
						if (isNumeric(regs[j]) && (j < regs.length-1)) {
							j++;
							regs[j] = regs[j-1] + ',' + regs[j];
						}
						if (regs[j].indexOf('bf') == regs[j].length-2) {
							regsT = regsT + regs[j].substr(0,regs[j].length-2) + ' subfamílias, ';
						} else
						if (regs[j].indexOf('f') == regs[j].length-1) {
							regsT = regsT + regs[j].substr(0,regs[j].length-1) + ' famílias, ';
						} else
						if (regs[j].indexOf('t') == regs[j].length-1) {
							regsT = regsT + regs[j].substr(0,regs[j].length-1) + ' tribos, ';
						} else
						if (regs[j].indexOf('g') == regs[j].length-1) {
							regsT = regsT + regs[j].substr(0,regs[j].length-1) + (regs[j].substr(0,regs[j].length-1) == 1 ? ' gênero, ' : ' gêneros, ');
						} else {
							regsT = regsT + regs[j] + (regs[j] == 1 ? ' espécie, ' : ' espécies, ');
						}
					}
					if (regsT.substr(regsT.length-9) == 'gêneros, ') {
						document.getElementById('cladoNReg').innerHTML = regsT.substr(0,regsT.length-2)+' registrados.';
					} else {
						document.getElementById('cladoNReg').innerHTML = regsT.substr(0,regsT.length-2)+' registradas.';
					}
				} else
				if (tree[i].nreg.length > 2 && tree[i].nreg.indexOf('bf') == tree[i].nreg.length-2) {
					document.getElementById('cladoNReg').innerHTML = tree[i].nreg.substr(0,tree[i].nreg.length-2) + ' subfamílias registradas.';
				} else
				if (tree[i].nreg.indexOf('f') == tree[i].nreg.length-1) {
					document.getElementById('cladoNReg').innerHTML = tree[i].nreg.substr(0,tree[i].nreg.length-1) + ' famílias registradas.';
				} else
				if (tree[i].nreg.indexOf('t') == tree[i].nreg.length-1) {
					document.getElementById('cladoNReg').innerHTML = tree[i].nreg.substr(0,tree[i].nreg.length-1) + ' tribos registradas.';
				} else
				if (tree[i].nreg.indexOf('g') == tree[i].nreg.length-1) {
					document.getElementById('cladoNReg').innerHTML = tree[i].nreg.substr(0,tree[i].nreg.length-1) + ' gêneros registrados.';
				} else {
					document.getElementById('cladoNReg').innerHTML = tree[i].nreg + (tree[i].nreg == 1 ? ' espécie registrada.' : ' espécies registradas.');
				}
			} else {
				document.getElementById('cladoNReg').innerHTML = '';
			}
			if (tree[i].nest) {
				document.getElementById('cladoNEst').innerHTML = tree[i].nest + (tree[i].nest == 1 ? ' espécie estimada.' : ' espécies estimadas.');
			} else {
				document.getElementById('cladoNEst').innerHTML = '';
			}
			if (tree[i].ref) {
				var refs = tree[i].ref.split('<br>'), refs1;
				if (refs.length == 1) {
					refs1 = 'Referência: ';
				} else {
					refs1 = 'Referências: ';
				}
				for (j=0; j<refs.length; j++) {
					if (isValidURL(refs[j])) {
						refs1 = refs1 + "<a href='"+refs[j]+"' target='_blank'>"+refs[j]+'</a><br>';
					} else {
						refs1 = refs1 + refs[j] + '<br>';
					}
				}
				document.getElementById('cladoRef').innerHTML = refs1.substr(0,refs1.length-4);
			} else {
				document.getElementById('cladoRef').innerHTML = '';
			}
			document.getElementById('clado').style.display='block';
			document.getElementById('data').scrollTop = 0;
			for (j=0; j<tree.length; j++) {
				if ((tree[j].nome.indexOf('+') < 0 && tree[j].nome.indexOf('-') < 0 || emptyNodes) && descende(j,i)) {
					drawNode(j,true);
				}
			}
			drawNode(i,true);
			break;
		}
	}
	if (nenhum && hover >= 0 && !keep) {
		// não está mais sobre nenhum clado, desmarca o anterior
		i = hover;
		hover = -1;
		document.getElementById('clado').style.display='none';
		for (j=0; j<tree.length; j++) {
			if ((tree[j].nome.indexOf('+') < 0 && tree[j].nome.indexOf('-') < 0 || emptyNodes) && descende(j,i)) {
				drawNode(j,false);
			}
		}
		drawNode(i,false);
	}
}
var canvasMenu = false, mnuHover = -1;
function getParameterByName(name) { //https://stackoverflow.com/a/901144/1086511
	var url = window.location.href;
	name = name.replace(/[\[\]]/g, "\\$&");
	var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		results = regex.exec(url);
	if (!results) return null;
	if (!results[2]) return '';
	return decodeURIComponent(results[2].replace(/\+/g, " "));
}
function mnuNavegar() {
	var m = document.getElementById('menu');
	m.style.visibility='hidden';
	var nome = tree[mnuHover].nome;
	if (nome.indexOf('†') >= 0) {
		nome = nome.replace('†','');
	}
	if (getParameterByName('pop') || getParameterByName('eco') || getParameterByName('geo')) {
		var pPop = getParameterByName('pop') ? '&pop='+getParameterByName('pop') : '';
		var pEco = getParameterByName('eco') ? '&eco='+getParameterByName('eco') : '';
		var pGeo = getParameterByName('geo') ? '&geo='+getParameterByName('geo') : '';
		window.location.href = 'index.php?taxon='+nome+pPop+pEco+pGeo;
	} else {
		window.location.href = 'index.php?taxon='+nome;
	}
}
function mnuEditar() {
	var el = document.getElementById('addOverlay');
	var m = document.getElementById('menu');
	m.style.visibility='hidden';
	if (tree[mnuHover].nome.substr(0,1) == '/') {
		document.getElementById('pAddTit').innerHTML = 'Editar <span style="color:red"><i>' + tree[mnuHover].nome.substr(1,tree[mnuHover].nome.length-1) + '</i></span>';
	} else {
		document.getElementById('pAddTit').innerHTML = 'Editar <span style="color:red">' + tree[mnuHover].nome + '</span>';
	}
	document.getElementById('addId').value = tree[mnuHover].id;
	document.getElementById('addAnc').value = '';
	var extinct = tree[mnuHover].nome[tree[mnuHover].nome.length-1] == '†';
	if (extinct) {
		document.getElementById('addName').value = tree[mnuHover].nome.substr(0,tree[mnuHover].nome.length-1);
	} else {
		document.getElementById('addName').value = tree[mnuHover].nome;
	}
	document.getElementById('addNameAnt').value = document.getElementById('addName').value;
	document.getElementById('addNamePT').value = tree[mnuHover].nomePT;
	document.getElementById('addNameEN').value = tree[mnuHover].nomeEN;
	document.getElementById('addNameZH').value = tree[mnuHover].nomeZH;
	document.getElementById('addRef').value = tree[mnuHover].ref;
	document.getElementById('addReg').value = tree[mnuHover].nreg;
	document.getElementById('addEst').value = tree[mnuHover].nest;
	var txtEco = document.getElementById('addEco');
	txtEco.value = tree[mnuHover].eco;
	var meanEco = document.getElementById('meanEco');
	meanEco.innerHTML = getEcoTokens(txtEco.value,2);
	var txtGeo = document.getElementById('addGeo');
	txtGeo.value = tree[mnuHover].geo;
	var meanGeo = document.getElementById('meanGeo');
	meanGeo.innerHTML = getGeoTokens(txtGeo.value,2);
	document.getElementById('addDoubt').checked = tree[mnuHover].doubt ? 'checked' : '';
	document.getElementById('addExtinct').checked = extinct ? 'checked' : '';
	document.getElementById('btnAdd').innerHTML = 'Altera';
	document.getElementById('btnAdd').disabled = true;
	el.style.visibility = 'visible';
	setTimeout(function() { document.getElementById('addName').focus(); },200);
}
function mnuInserir() {
	var el = document.getElementById('addOverlay');
	var m = document.getElementById('menu');
	m.style.visibility='hidden';
	if (tree[mnuHover].nome.substr(0,1) == '/') {
		document.getElementById('pAddTit').innerHTML = 'Adicionar táxon a <span style="color:red"><i>' + tree[mnuHover].nome.substr(1,tree[mnuHover].nome.length-1) + '</i></span>';
	} else {
		document.getElementById('pAddTit').innerHTML = 'Adicionar táxon a <span style="color:red">' + tree[mnuHover].nome + '</span>';
	}
	document.getElementById('addId').value = '';
	document.getElementById('addAnc').value = tree[mnuHover].id;
	document.getElementById('addName').value = '';
	document.getElementById('addNamePT').value = '';
	document.getElementById('addNameEN').value = '';
	document.getElementById('addNameZH').value = '';
	document.getElementById('addReg').value = '';
	document.getElementById('addEst').value = '';
	document.getElementById('addEco').value = '';
	meanEco.innerHTML = '';
	document.getElementById('addGeo').value = '';
	meanGeo.innerHTML = '';
	document.getElementById('addDoubt').checked = '';
	document.getElementById('addExtinct').checked = '';
	document.getElementById('btnAdd').innerHTML = 'Adiciona';
	document.getElementById('btnAdd').disabled = true;
	el.style.visibility = 'visible';
	setTimeout(function() { document.getElementById('addName').focus(); },200);
}
function mnuFixar(fixa) {
	if (fixa == 1) {
		document.getElementById('cladoEsc').style.display='block';
		document.getElementById('cladoTit').style.color = 'white';
		document.getElementById('btnFixar').innerHTML = 'Cancelar (Esc)';
		keep = true;
	} else
	if (fixa == 0) {
		document.getElementById('cladoEsc').style.display='none';
		document.getElementById('cladoTit').style.color = 'black';
		document.getElementById('btnFixar').innerHTML = 'Fixar (Enter)';
		keep = false;
	} else
	if (keep) {
		document.getElementById('cladoEsc').style.display='none';
		document.getElementById('cladoTit').style.color = 'black';
		document.getElementById('btnFixar').innerHTML = 'Fixar (Enter)';
		keep = false;
	} else {
		document.getElementById('cladoEsc').style.display='block';
		document.getElementById('cladoTit').style.color = 'white';
		document.getElementById('btnFixar').innerHTML = 'Cancelar (Esc)';
		keep = true;
	}
	var m = document.getElementById('menu');
	m.style.visibility='hidden';
}
function mnuVoltar() {
	var m = document.getElementById('menu');
	m.style.visibility='hidden';
	var b = document.getElementById('back');
	window.location.href = b.href;
}
function mnuImagens() {
	if (document.getElementById('addOverlay').style.visibility != 'visible') {
		var m = document.getElementById('menu');
		m.style.visibility='hidden';
		canvasMenu = false;
		var l = document.getElementById('linkImg');
		var taxon = tree[hover].nome;
		if (taxon[0] == '/') {
			taxon = taxon.substr(1,taxon.length-1);
		}
		if (taxon[taxon.length-1] == '†') {
			taxon = taxon.substr(0,taxon.length-1);
		}
		l.href = 'https://www.google.com.br/search?q='+taxon+'&tbm=isch&nfpr=1&tbs=itp:photo'; // incluir o nome da raiz ??
		l.click();
	}
}
function mnuAPI() {
	
}
function mouseDown(e) {
	var m = document.getElementById('menu');
	if (hover >= 0) {
		mnuHover = hover;
		if (e.button == 0) {
			if (m.style.visibility == 'visible') {
				mnuHover = -1;
				m.style.visibility='hidden';
				canvasMenu = false;
			} else {
				if (!e.ctrlKey && !e.shiftKey) {
					mnuNavegar();
				} else
				if (e.ctrlKey) {
					mnuInserir();
				} else
				if (e.shiftKey) {
					mnuEditar();
				}
			}
		} else
		if (e.button == 2) {
			var rect = canv.getBoundingClientRect();
			var x = e.clientX;
			var y = e.clientY;
			if (y + m.offsetHeight > rect.height) {
				y = rect.height - m.offsetHeight;
			}
			m.style.left = x + 'px';
			m.style.top = y + 'px';
			if (tree[hover].nome[0] == '/') {
				document.getElementById('mnuClado').innerHTML = '<i>'+tree[hover].nome.substr(1)+'</i>';
			} else {
				document.getElementById('mnuClado').innerHTML = tree[hover].nome;
			}
			m.style.visibility='visible';
			canvasMenu = true;
		}
	} else {
		mnuHover = -1;
		m.style.visibility='hidden';
		canvasMenu = false;
	}
}
function canvMenu(e) {
	if (canvasMenu) {
		e.preventDefault();
	}
}
function dataOver() {
	if (hover >= 0 && !keep) { // desmarca o clado anterior, se houver
		for (var i=0; i<tree.length; i++) {
			if ((tree[i].nome.indexOf('+') < 0 && tree[i].nome.indexOf('-') < 0 || emptyNodes) && descende(i,hover)) {
				drawNode(i,false);
			}
		}
		drawNode(hover,false);
		hover = -1;
		document.getElementById('clado').style.display='none';
	}
}
function mouseOver(id) {
	/*for (var i=0; i<tree.length; i++) {
		if (tree[i].id == id) {
			drawNode(i,true);
			break;
		}
	}*/
}
function mouseOut(id) {
	/*for (var i=0; i<tree.length; i++) {
		if (tree[i].id == id) {
			if (tree[i].nome.indexOf('+') >= 0 || tree[i].nome.indexOf('-') >= 0) {
				drawTree();
			} else {
				drawNode(i,false);
			}
			break;
		}
	}*/
}
function keyDown(e) {
	/*if (e.key == 'Control' && document.getElementById('addOverlay').style.visibility != 'visible') {
		emptyNodes = true;
		drawTree();
	}*/
}
function keyUp(e) {
	/*if (e.key == 'Escape') {
		var b = document.getElementById('btnCancelAdd');
		b.click();
		var m = document.getElementById('menu');
		if (m.style.visibility == 'visible') {
			mnuHover = -1;
			m.style.visibility='hidden';
		}
		mnuFixar(0);
	} else
	if (document.getElementById('addOverlay').style.visibility != 'visible') {
		if (e.key == 'Control') {
			emptyNodes = false;
			if (hover >= 0 && (tree[hover].nome.indexOf('+') >= 0 || tree[hover].nome.indexOf('-') >= 0)) {
				hover = -1;
			}
			drawTree();
		} else
		if (e.key == 'Enter') {
			if (hover >= 0) {
				mnuFixar(1);
			}
		} else
		if (e.key == 'Backspace' && document.getElementById('searchFrm').style.display != 'block') {
			mnuVoltar();
		} else
		if (e.key == 'i') {
			mnuImagens();
		}
	}*/
}
function wheel(e) {
	/*wheelPos -= e.deltaY/3;
	distMult = Math.pow(1.1,wheelPos);
	drawTree();*/
	var i,niv=0,paiXY;
	if (e.deltaY < 0) {
		wheelPos++;
	} else {
		wheelPos--;
	}
	for (i=0; i<arv.length; i++) {
		if (e.deltaY < 0) {
			arv[i].raio *= 1.1;
		} else {
			arv[i].raio /= 1.1;
		}
	}
	for (niv=0; niv<=nivel; niv++) {
		for (i=1; i<arv.length; i++) {
			if (arv[i].nivel == niv) {
				paiXY = getXYR(arv[i].pai);
				arv[i].x = paiXY[0] + (paiXY[2]+arv[i].raio)*Math.cos(arv[i].ang);
				arv[i].y = paiXY[1] - (paiXY[2]+arv[i].raio)*Math.sin(arv[i].ang);
			}
		}
	}
	desenha();
}
function addNameInput() {
	var b = document.getElementById('btnAdd');
	b.disabled = document.getElementById('addName').value == '';
}
function resizeEco() {
	var f = document.getElementById('frmAdd').offsetHeight;
	var pad = parseInt(window.getComputedStyle(document.getElementById('addContent')).getPropertyValue('padding-top'),10);
	var el = document.getElementById('divEco');
	el.style.height = (window.innerHeight-f-pad) + 'px';
}
function resizeGeo() {
	var f = document.getElementById('frmAdd').offsetHeight;
	var pad = parseInt(window.getComputedStyle(document.getElementById('addContent')).getPropertyValue('padding-top'),10);
	var el = document.getElementById('divGeo');
	el.style.height = (window.innerHeight-f-pad) + 'px';
}
function addEcoInput() {
	var b = document.getElementById('btnAdd');
	b.disabled = document.getElementById('addName').value == '';
	var meanEco = document.getElementById('meanEco');
	var txtEco = document.getElementById('addEco');
	meanEco.innerHTML = getEcoTokens(txtEco.value,2);
	resizeEco();
	resizeGeo();
}
function addGeoInput() {
	var b = document.getElementById('btnAdd');
	b.disabled = document.getElementById('addName').value == '';
	var meanGeo = document.getElementById('meanGeo');
	var txtGeo = document.getElementById('addGeo');
	meanGeo.innerHTML = getGeoTokens(txtGeo.value,2);
	resizeEco();
	resizeGeo();
}
function searchKeyUp(e) {
	if (e.key == 'Enter' && document.getElementById('searchFrm').style.display == 'block') {
		var b = document.getElementById('btnSearch');
		b.click();
	} else
	if (e.key == 'Escape') {
		var b = document.getElementById('btnCancelSearch');
		b.click();
	}
}
function addKeyUp(e) {
	if (e.key == 'Enter' && document.getElementById('addOverlay').style.visibility == 'visible') {
		var b = document.getElementById('btnAdd');
		b.click();
	} else
	if (e.key == 'Escape') {
		var b = document.getElementById('btnCancelAdd');
		b.click();
	}
}
function addOk(who) {
	var F = who.form;
	F.submit();
}
function addCancel() {
	var el = document.getElementById('addOverlay');
	el.style.visibility = 'hidden';
	canvasMenu = false;
}
function searchOk(who) {
	var sPop = document.getElementById('searchPop').value;
	var sEco = document.getElementById('searchEco').value;
	var sGeo = document.getElementById('searchGeo').value;
	var q = '?';
	if (sPop != '') {
		q = q + 'pop=' + sPop + '&';
	}
	if (sEco != '') {
		q = q + 'eco=' + sEco + '&';
	}
	if (sGeo != '') {
		q = q + 'geo=' + sGeo + '&';
	}
	q = q.substr(0,q.length-1);
	window.location.href = 'index.php'+q;
}
function searchCancel() {
	var el = document.getElementById('searchFrm');
	el.style.display = 'none';
}
function ecoClick() {
	var el = document.getElementById('divEco');
	var outro = document.getElementById('divGeo');
	el.style.display = (el.style.display == 'none' || el.style.display == '') ? 'flex' : 'none';
	if (el.style.display == 'flex') {
		outro.style.display = 'none';
		resizeEco();
	}
	document.getElementById('addEco').focus();
}
function geoClick() {
	var el = document.getElementById('divGeo');
	var outro = document.getElementById('divEco');
	el.style.display = (el.style.display == 'none' || el.style.display == '') ? 'flex' : 'none';
	if (el.style.display == 'flex') {
		outro.style.display = 'none';
		resizeGeo();
	}
	document.getElementById('addGeo').focus();
}
function ecoLabelClick(who) {
/* https://stackoverflow.com/a/1366113/1086511
Block                                   Range       Comment
CJK Unified Ideographs                  4E00-9FFF   Common
CJK Unified Ideographs Extension A      3400-4DBF   Rare
CJK Unified Ideographs Extension B      20000-2A6DF Rare, historic
CJK Unified Ideographs Extension C      2A700–2B73F Rare, historic
CJK Unified Ideographs Extension D      2B740–2B81F Uncommon, some in current use
CJK Unified Ideographs Extension E      2B820–2CEAF Rare, historic
CJK Compatibility Ideographs            F900-FAFF   Duplicates, unifiable variants, corporate characters
CJK Compatibility Ideographs Supplement 2F800-2FA1F Unifiable variants
*/
	var ch = who.innerHTML.replace(/[^\u4E00-\u9FFF]*/g,'');
	var txtEco = document.getElementById('addEco');
	if (txtEco.value.search(ch) < 0) { // pode ter exceções!! ex: muito/muitos 众, pouco/poucos 少, superior/anterior 上, inferior/posterior 下, exterior/externo 外, interior/interno 内, parcial 半, completo 全
		var p1 = txtEco.selectionStart;
		var p2 = txtEco.selectionEnd;
		var t1 = txtEco.value.substr(0,p1);
		var t2 = txtEco.value.substr(p2);
		txtEco.value = t1 + ch + t2;
		txtEco.selectionStart = txtEco.selectionEnd = p1+1;
		var b = document.getElementById('btnAdd');
		b.disabled = document.getElementById('addName').value == '';
		var meanEco = document.getElementById('meanEco');
		meanEco.innerHTML = getEcoTokens(txtEco.value,2);
	}
	resizeEco();
	txtEco.focus();
}
function geoLabelClick(who) {
	var p = who.innerHTML.indexOf(' ');
	var ch = who.innerHTML.substr(0,p) + ' ';
	var txtGeo = document.getElementById('addGeo');
	if (txtGeo.value.search(ch) < 0) {
		var p1 = txtGeo.selectionStart;
		var p2 = txtGeo.selectionEnd;
		var t1 = txtGeo.value.substr(0,p1);
		var t2 = txtGeo.value.substr(p2);
		txtGeo.value = t1 + ch + t2;
		txtGeo.selectionStart = txtGeo.selectionEnd = p1+ch.length;
		var b = document.getElementById('btnAdd');
		b.disabled = document.getElementById('addName').value == '';
		var meanGeo = document.getElementById('meanGeo');
		meanGeo.innerHTML = getGeoTokens(txtGeo.value,2);
	}
	resizeGeo();
	txtGeo.focus();
}
function clickPol() {
	polygons = !polygons;
	drawTree();
	//unfold(tree[0]);
}
var dataFont = 100;
function clickm() {
	dataFont *= 0.9;
	document.getElementById('data').style.fontSize = dataFont+'%';
	drawTree();
}
function clickM() {
	dataFont *= 1.1;
	document.getElementById('data').style.fontSize = dataFont+'%';
	drawTree();
}
function searchInput() {
	var sPop = document.getElementById('searchPop').value;
	var sEco = document.getElementById('searchEco').value;
	var sGeo = document.getElementById('searchGeo').value;
	document.getElementById('btnSearch').disabled = sPop == '' && sEco == '' && sGeo == '';
}
function search() {
	var d = document.getElementById('searchFrm');
	if (d.style.display == 'none' || d.style.display == '') {
		d.style.display = 'block';
		document.getElementById('searchPop').value = '';
		document.getElementById('searchEco').value = '';
		document.getElementById('searchGeo').value = '';
		document.getElementById('searchPop').focus();
	} else {
		d.style.display = 'none';
	}
}
function foldData(divID,who,e) {
	if (e.target.tagName != 'LI') return; // não ativar quando clicar no link
	var d = document.getElementById('divData'+divID);
	if (d) {
		if (d.style.display == 'block') {
			d.style.display = 'none';
			who.style="list-style:url('ball1.png')";
		} else {
			d.style.display = 'block';
			who.style="list-style:url('ball.png')";
		}
	}
}
function addRefResize() {
	setTimeout(function() { resizeEco(); resizeGeo(); },200);
}
</script>
</head>
<body>
<canvas id='canv' oncontextmenu='canvMenu(event)'>
Seu navegador não suporta o recurso "canvas" do HTML 5.
</canvas>
<div id='data' onmouseover='dataOver()'>
	<button onclick='addNivel()'>+ 1 nível</button>
	<button onclick='gravidade()'>gravidade</button>
	<div id='clado'>
		<span id='cladoEsc'>Táxon fixo, aperte Esc para cancelar.</span>
		<p id='cladoTit'>Clado</p>
		<p id='cladoPop'>nomes populares</p>
		<p id='cladoEco'></p>
		<p id='cladoGeo'></p>
		<p id='cladoNReg'></p>
		<p id='cladoNEst'></p>
		<p id='cladoRef'></p>
	<hr>
	</div>
	<p class='tit'><a href='javascript:search()' style='font-weight:normal;font-size:12px'>[pesquisar]</a> <a href='index.php'>Cleco</a></p>
	<div id='searchFrm'>
		<div id='search'>
			<div id='search1a'>
				<label for='searchPop'>Nomes populares</label>
			</div>
			<div id='search1b'>
				<input type='text' id='searchPop' onkeyup='searchKeyUp(event)' oninput='searchInput()'>
			</div>
			<div id='search2a'>
				<label for='searchEco'>Ecologia</label>
			</div>
			<div id='search2b'>
				<input type='text' id='searchEco' onkeyup='searchKeyUp(event)' oninput='searchInput()'>
			</div>
			<div id='search3a'>
				<label for='searchGeo'>Geografia</label>
			</div>
			<div id='search3b'>
				<input type='text' id='searchGeo' onkeyup='searchKeyUp(event)' oninput='searchInput()'>
			</div>
		</div>
		<button type='button' id='btnSearch' onclick='searchOk()' disabled>Pesquisa</button>
		<button type='button' id='btnCancelSearch' onclick='searchCancel()'>Cancela</button>
	</div>
<?php
$id = 'null'; // Mostra a Árvore da Vida do início, se não houver parâmetros
$anc = '';
$doubt = 0;
$pesquisa = false;
function prDescLim($anc,$lim) {
	global $conn;
	if ($anc == '') {
		$q = 'select * from taxon where anc is null and id in ('.implode(',',$lim).') order by id';
		$res = pg_query($conn,$q);
	} else {
		$q = 'select * from taxon where anc = $1 and id in ('.implode(',',$lim).') order by id';
		$res = pg_query_params($conn,$q,[$anc]);
	}
	if ($res) {
		$nFilhos = pg_num_rows($res);
		if ($nFilhos > 0) {
			if ($anc == '') {
				echo "<ul>";
			} else {
				echo "<ul><div id='divData$anc' style='display:block'>";
			}
		}
		while ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) {
			$taxon = $row[2];
			$taxonNode = $taxon;
			$taxonEcho = $taxon;
			if ($row[8] > 0) { // extinct
				$taxonNode.='†';
				$taxonEcho.='†';
			}
			$ee = '';
			global $showInfo;
			if ($showInfo) {
				if ($row[5]) { // eco
					$ee = $row[5];
				}
				if ($row[6]) { // geo
					if ($ee) {
						$ee.='|';
					}
					$ee.=$row[6];
				}
				if ($ee) {
					$ee = " ($ee)";
				}
			}
			$namePT = str_replace("'","`",$row[9]);
			$nameEN = str_replace("'","`",$row[10]);
			$nameZH = str_replace("'","`",$row[11]);
			$ref = str_replace("\r\n","<br>",$row[12]);
			$ref = str_replace('"','\"',$ref);
			$ref = json_encode(array('ref' => $ref),JSON_HEX_QUOT | JSON_HEX_TAG);
			echo "<script>addNode($row[0],'$anc','$taxonNode','$row[3]','$row[4]','$row[5]','$row[6]',$row[7],'$namePT','$nameEN','$nameZH','$ref')</script>";
			if (substr($taxon,0,1) == '/') {
				$taxonEcho = '<i>'.substr($taxonEcho,1).'</i>';
			}
			global $link;
			$link1 = substr($link,0,-2)."&taxon=$taxon'";
			echo "<li style=\"list-style:url('ball.png')\" onclick='foldData($row[0],this,event)'>$link1 onmouseover='mouseOver($row[0])' onmouseout='mouseOut($row[0])'>$taxonEcho$ee</a></li>\n";
			prDescLim($row[0],$lim);
		}
		if ($nFilhos > 0) {
			if ($anc == '') {
				echo "</ul>";
			} else {
				echo "</div></ul>";
			}
		}
	}
}
$taxon = '';
if (!empty($_GET)) {
	$get = limpa($_GET); // array copiado sem slice no PHP? Ou só a referência?
	$taxon = str_replace(' ','+',get('taxon'));
	$pop = get('pop');
	$eco = get('eco');
	$geo = get('geo');
	if ($pop || $eco || $geo) { // pesquisa
		$pesquisa = true;
		// mostra a pesquisa em curso
		$link = "<a href='index.php?";
		$q = "Pesquisando ";
		if ($pop) {
			$link = $link."pop=$pop&";
			$q .= "['$pop' em nome popular], ";
		}
		if ($eco) {
			$link = $link."eco=$eco&";
			$q .= "['$eco' em ecologia], ";
		}
		if ($geo) {
			$link = $link."geo=$geo&";
			$q .= "['$geo' em geografia], ";
		}
		$link = substr($link,0,-1)."'>";
		if ($taxon) {
			$linkRem = "index.php?taxon=$taxon";
		} else {
			$linkRem = "index.php";
		}
		echo $link.substr($q,0,-2)."</a> <a href='$linkRem' style='font-size:12px'>[remover]</a><br><br>\n";
		// faz a pesquisa no banco de dados
		$q = '';
		$n = 0;
		if ($pop) {
			$n1 = $pop;
			$n++;
			$q = "(namept like $$n or nameen like $$n or namezh like $$n) ";
		}
		if ($eco) {
			if ($q != '') {
				$n2 = $eco;
				$q .= 'and ';
			} else {
				$n1 = $eco;
			}
			$n++;
			$q .= "(eco like $$n) ";
		}
		if ($geo) {
			if ($q != '') {
				if ($n == 1) {
					$n2 = $geo;
				} else
				if ($n == 2) {
					$n3 = $geo;
				}
				$q .= 'and ';
			} else {
				$n1 = $geo;
			}
			$n++;
			$q .= "(geo like $$n) ";
		}
		$q = "select id,name from taxon where $q";
		if ($showInfo) {
			echo "táxon: [$taxon]<br>";
			echo "$q<br><br>";
		}
		switch ($n) {
			case 1 :
				$res = pg_query_params($conn,$q,["%$n1%"]);
				break;
			case 2 :
				$res = pg_query_params($conn,$q,["%$n1%","%$n2%"]);
				break;
			case 3 :
				$res = pg_query_params($conn,$q,["%$n1%","%$n2%","%$n3%"]);
		}
		if ($res) {
			$IDs = [];
			while ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) { // para cada táxon com pop/eco/geo encontrado
				if ($showInfo) {
					print_r($row);
				}
				// pega todos os ancestrais deste clado, até a origem da vida
				$q =
					"with recursive tree as (
						select t.id, t.anc, t.name
						from taxon t
						left join taxon tp on tp.id = t.anc
						where t.id = $1
						union
						select t.id, t.anc, t.name
						from taxon t
						left join taxon tp on tp.id = t.anc
						join tree on (t.id = tree.anc)
					)
					select id from tree";
				$res1 = pg_query_params($conn,$q,[$row[0]]);
				if ($res1) {
					while ($row1 = pg_fetch_array($res1,NULL,PGSQL_NUM)) { // acrescenta todos os ancestrais (não repetidos) em $IDs
						if (!in_array($row1[0],$IDs)) {
							$IDs[] = $row1[0];
						}
					}
				}
				if ($showInfo) {
					echo '<br>';
				}
			}
			if ($showInfo) {
				echo '<br>';
			}
			sort($IDs); // já tem a lista de todos os IDs que podem aparecer na árvore
			$q = 'select * from taxon where id in ('.implode(',',$IDs).') order by id';
			if ($showInfo) {
				echo "$q<br><br>";
			}
			$res = pg_query($conn,$q);
			if ($res) {
				$startTaxon = '';
				while ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) {
					if ($row[2] == $taxon) {
						$startTaxon = $row[0];
						break;
					}
				}
				if ($startTaxon != '') {
					$ancID = $row[1];
					$ancestrais = '';
					$ancLinkID = " id='back'";
					while ($ancID != '') {
						$q = 'select anc,name from taxon where id = $1';
						$res1 = pg_query_params($conn,$q,[$ancID]);
						if ($row1 = pg_fetch_array($res1,NULL,PGSQL_NUM)) {
							if (!preg_match('/[+-]/',$row1[1])) {
								if ($row1[0] == '') {
									$link1 = substr($link,3,-1);
								} else {
									$link1 = substr($link,3,-2)."&taxon=$row1[1]'";
								}
								if ($row1[1][0] == '/') {
									$ancestrais = "<a$ancLinkID $link1><i>".substr($row1[1],1)."</i></a><br>\n$ancestrais";
								} else {
									$ancestrais = "<a$ancLinkID $link1>$row1[1]</a><br>\n$ancestrais";
								}
							}
							$ancID = $row1[0];
						}
						$ancLinkID = '';
					}
					echo $ancestrais;
					echo "<ul>";
					$taxonNode = $row[2];
					$taxonEcho = $row[2];
					if ($row[8] > 0) { // extinct
						$taxonNode.='†';
						$taxonEcho.='†';
					}
					$ee = '';
					global $showInfo;
					if ($showInfo) {
						if ($row[5]) { // eco
							$ee = $row[5];
						}
						if ($row[6]) { // geo
							if ($ee) {
								$ee.='|';
							}
							$ee.=$row[6];
						}
						if ($ee) {
							$ee = " ($ee)";
						}
					}
					$namePT = str_replace("'","`",$row[9]);
					$nameEN = str_replace("'","`",$row[10]);
					$nameZH = str_replace("'","`",$row[11]);
					$ref = str_replace("\r\n","<br>",$row[12]);
					$ref = str_replace('"','\"',$ref);
					$ref = json_encode(array('ref' => $ref),JSON_HEX_QUOT | JSON_HEX_TAG);
					echo "<script>addNode($row[0],'$row[1]','$taxonNode','$row[3]','$row[4]','$row[5]','$row[6]',$row[7],'$namePT','$nameEN','$nameZH','$ref')</script>";
					if (substr($taxon,0,1) == '/') {
						$taxonEcho = '<i>'.substr($taxonEcho,1).'</i>';
					}
					echo "<li><a href='index.php?taxon=$row[2]' onmouseover='mouseOver($row[0])' onmouseout='mouseOut($row[0])'>$taxonEcho$ee</a></li>\n";
					prDescLim($startTaxon,$IDs);
					echo "</ul>";
				} else {
					prDescLim('',$IDs);
				}
			} else {
				echo "<span style='color:red'>Erro 1!</span><br>\n";
			}
		} else {
			echo "<span style='color:red'>Erro 2!</span><br>\n";
		}
	} else { // mostra táxon indicado ou a partir da raiz
		$upd = get('upd');
		if ($upd[0] == '/') {
			$upd = '<i>'.substr($upd,1).'</i>';
		}
		$status = get('status');
		if ($status == 1) {
			echo "$upd inserido com sucesso.<br><br>";
		} else
		if ($status == 2) {
			echo "$upd alterado com sucesso.<br><br>";
		} else
		if ($status == 3) {
			echo "<span style='color:#F00'>$upd não inserido!</span><br><br>";
		} else
		if ($status == 4) {
			echo "<span style='color:#F00'>$upd não alterado!</span><br><br>";
		}
		//echo "taxon = '$taxon'<br>";
		$q = 'select * from taxon where name = $1';
		$res = pg_query_params($conn,$q,[$taxon]);
		if ($res) {
			if ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) {
				$id = $row[0];
				$anc = $row[1];
				// $taxon = $row[2];
				$nreg = $row[3];
				$nest = $row[4];
				$eco = $row[5];
				$geo = $row[6];
				$doubt = $row[7];
				$extinct = $row[8];
				$namePT = str_replace("'","`",$row[9]);
				$nameEN = str_replace("'","`",$row[10]);
				$nameZH = str_replace("'","`",$row[11]);
				$ref = str_replace("\r\n","<br>",$row[12]);
				$ref = str_replace('"','\"',$ref);
				$ref = json_encode(array('ref' => $ref),JSON_HEX_QUOT | JSON_HEX_TAG);
			}
		}
		$ancName = '';
		if ($anc != '') {
			$q = 'select name from taxon where id = $1';
			$res = pg_query_params($conn,$q,[$anc]);
			if ($res) {
				if ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) {
					$ancName = $row[0];
				}
			}
		}
	}
}
function prDesc($anc) { // Procura Descendentes: insere cada item em 'data' e como um objeto no JavaScript, a ser processado em drawTree()
	global $conn;
	if ($anc == 'null') {
		$q = 'select * from taxon where anc is null';
		$res = pg_query($conn,$q);
	} else {
		$q = 'select * from taxon where anc = $1 order by id';
		$res = pg_query_params($conn,$q,[$anc]);
	}
	if ($res) {
		$nFilhos = pg_num_rows($res);
		if ($nFilhos > 0) {
			if ($anc == 'null') {
				echo "<ul>";
			} else {
				echo "<ul><div id='divData$anc' style='display:block'>";
			}
		}
		while ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) {
		/* origem:	sem sinal de extinção, com a barra;
		 * addNode:	com sinal de extinção, com a barra;
		 * GET:		sem sinal de extinção, com a barra;
		 * echo:	com sinal de extinção, sem a barra (vira itálico);
		 */
			$taxon = $row[2];
			$taxonNode = $taxon;
			$taxonEcho = $taxon;
			if ($row[8] > 0) { // extinct
				$taxonNode.='†';
				$taxonEcho.='†';
			}
			$ee = '';
			global $showInfo;
			if ($showInfo) {
				if ($row[5]) { // eco
					$ee = $row[5];
				}
				if ($row[6]) { // geo
					if ($ee) {
						$ee.='|';
					}
					$ee.=$row[6];
				}
				if ($ee) {
					$ee = " ($ee)";
				}
			}
			$namePT = str_replace("'","`",$row[9]);
			$nameEN = str_replace("'","`",$row[10]);
			$nameZH = str_replace("'","`",$row[11]);
			$ref = str_replace("\r\n","<br>",$row[12]);
			$ref = str_replace('"','\"',$ref);
			$ref = json_encode(array('ref' => $ref),JSON_HEX_QUOT | JSON_HEX_TAG);
			echo "<script>addNode($row[0],'$anc','$taxonNode','$row[3]','$row[4]','$row[5]','$row[6]',$row[7],'$namePT','$nameEN','$nameZH','$ref')</script>";
			if (substr($taxon,0,1) == '/') {
				$taxonEcho = '<i>'.substr($taxonEcho,1).'</i>';
			}
			echo "<li style=\"list-style:url('ball.png')\" onclick='foldData($row[0],this,event)'><a href='index.php?taxon=$taxon' onmouseover='mouseOver($row[0])' onmouseout='mouseOut($row[0])'>$taxonEcho$ee</a></li>\n";
			prDesc($row[0]);
		}
		if ($nFilhos > 0) {
			if ($anc == 'null') {
				echo "</ul>";
			} else {
				echo "</div></ul>";
			}
		}
	}
}
if (!$pesquisa) {
	if ($id != 'null') {
		if ($ancName != '') {
			$ancID = $anc;
			$ancestrais = '';
			$ancLinkID = " id='back'";
			while ($ancID != '') {
				$q = 'select anc,name from taxon where id = $1';
				$res = pg_query_params($conn,$q,[$ancID]);
				if ($row = pg_fetch_array($res,NULL,PGSQL_NUM)) {
					if (!preg_match('/[+-]/',$row[1])) {
						if ($row[0] == '') {
							$ancestrais = "<a$ancLinkID href='index.php'>$row[1]</a><br>\n$ancestrais";
						} else {
							if ($row[1][0] == '/') {
								$ancestrais = "<a$ancLinkID href='index.php?taxon=$row[1]'><i>".substr($row[1],1)."</i></a><br>\n$ancestrais";
							} else {
								$ancestrais = "<a$ancLinkID href='index.php?taxon=$row[1]'>$row[1]</a><br>\n$ancestrais";
							}
						}
					}
					$ancID = $row[0];
				}
				$ancLinkID = '';
			}
			echo $ancestrais;
		}
		echo "<ul>";
		$taxonNode = $taxon;
		$taxonEcho = $taxon;
		if ($extinct > 0) {
			$taxonNode.='†';
			$taxonEcho.='†';
		}
		$ee = '';
		if ($showInfo) {
			if ($eco) {
				$ee = $eco;
			}
			if ($geo) {
				if ($ee) {
					$ee.='|';
				}
				$ee.=$geo;
			}
			if ($ee) {
				$ee = " ($ee)";
			}
		}
		echo "<script>addNode($id,'$anc','$taxonNode','$nreg','$nest','$eco','$geo',$doubt,'$namePT','$nameEN','$nameZH','$ref')</script>";
		if (substr($taxon,0,1) == '/') {
			$taxonEcho = '<i>'.substr($taxonEcho,1).'</i>';
		}
		echo "<li><a href='index.php?taxon=$taxon' onmouseover='mouseOver($id)' onmouseout='mouseOut($id)'>$taxonEcho$ee</a></li>\n";
	}
	prDesc($id);
	if ($id != 'null') {
		echo "</ul>";
	}
}
echo "<script>startTree()</script>";
?>
</div>
</body>
<script>
document.getElementById('canv').onmousemove = mouseMove;
document.getElementById('canv').onmousedown = mouseDown;
document.getElementById('canv').addEventListener('wheel',wheel);
document.onkeydown = keyDown;
document.onkeyup = keyUp;
</script>
<div id='addOverlay'>
	<div id='addContent'>
		<form id='frmAdd' autocomplete='off' method='post' action='update.php'>
			<p id='pAddTit'>Adicionar táxon a ...</p>
			<input id='addAnc' name='anc' type='hidden'>
			<input id='addId' name='id' type='hidden'>
			<input id='addNameAnt' name='nameAnt' type='hidden'>
			<input id='addBase' name='base' type='hidden' value='<?= $taxon ?>'>
			<table>
				<tr><td><label for='addName'>Nomes: científico</label></td><td>
					<input id='addName' name='name' type='text' onkeyup='addKeyUp(event)' oninput='addNameInput(this)'>
					<label for='addNamePT'>populares</label> <input id='addNamePT' name='namePT' type='text' onkeyup='addKeyUp(event)' oninput='addNameInput(this)' placeholder='português'>
					<input id='addNameEN' name='nameEN' type='text' onkeyup='addKeyUp(event)' oninput='addNameInput(this)' placeholder='english'>
					<input id='addNameZH' name='nameZH' type='text' onkeyup='addKeyUp(event)' oninput='addNameInput(this)' placeholder='中文'>
				</td></tr>
				<tr><td><label for='addReg'>Espécies: registradas</label></td><td><input id='addReg' name='nreg' type='text' onkeyup='addKeyUp(event)' oninput='addNameInput(this)'>
					<label for='addEst'>estimadas</label> <input id='addEst' name='nest' type='text' onkeyup='addKeyUp(event)' oninput='addNameInput(this)'></td></tr>
				<tr><td><label for='addEco'>Ecologia</label></td><td><input id='addEco' name='eco' type='text' size=60 onkeyup='addKeyUp(event)' oninput='addEcoInput(this)'>
					<button type='button' onclick='ecoClick()'>Eco</button></td></tr>
				<tr><td></td><td><span id='meanEco'></span></td></tr>
				<tr><td><label for='addGeo'>Geografia</label></td><td><input id='addGeo' name='geo' type='text' size=60 onkeyup='addKeyUp(event)' oninput='addGeoInput(this)'>
					<button type='button' onclick='geoClick()'>Geo</button></td></tr>
				<tr><td></td><td><span id='meanGeo'></span></td></tr>
				<tr><td><label for='addDoubt'>Posição incerta</label></td><td><input id='addDoubt' name='doubt' type='checkbox' oninput='addNameInput(this)'>
					&emsp;<label for='addExtinct'>Extinto</label> <input id='addExtinct' name='extinct' type='checkbox' oninput='addNameInput(this)'></td></tr>
				<tr><td><label for='addRef'>Referências</label></td><td><textarea id='addRef' name='ref' cols=100 onmouseup='addRefResize()' ondblclick='addRefResize()' oninput='addNameInput(this)'></textarea></td></tr>
			</table>
			<button type='button' id='btnAdd' onclick='addOk(this)' disabled>Adiciona</button>
			<button type='button' id='btnCancelAdd' onclick='addCancel()'>Cancela</button>
		</form>
		<div id='divEco'>
			<div id='ecoHab'>
				<legend style='color:<?= $ecoHab ?>'>Habitat</legend>
				<label onclick='ecoLabelClick(this)'>árido/desértico 漠 mò</label>
				<label onclick='ecoLabelClick(this)'>montanha 山 shān</label>
				<label onclick='ecoLabelClick(this)'>floresta 林 lín</label>
				<label onclick='ecoLabelClick(this)'>borda 边 biān</label>
				<label onclick='ecoLabelClick(this)'>aberto 开 kāi</label>
				<label onclick='ecoLabelClick(this)'>savana 草 cǎo</label>
				<label onclick='ecoLabelClick(this)'>arborícolas 木 mù</label>
				<label onclick='ecoLabelClick(this)'>pedra/rupestres 石 shí</label>
				<label onclick='ecoLabelClick(this)'>intersticial 尘 hén</label>
				<label onclick='ecoLabelClick(this)'>areia 沙 shā</label>
				<label onclick='ecoLabelClick(this)'>terrestres/solo 土 tǔ</label>
				<label onclick='ecoLabelClick(this)'>marinhos 海 hǎi</label>
				<label onclick='ecoLabelClick(this)'>água salobra 咸 xián</label>
				<label onclick='ecoLabelClick(this)'>água doce 清 qīng</label>
				<label onclick='ecoLabelClick(this)'>rápidos 流 liú</label>
				<label onclick='ecoLabelClick(this)'>remansos 宁 níng</label>
				<label onclick='ecoLabelClick(this)'>aquáticos 水 shuǐ</label>
				<label onclick='ecoLabelClick(this)'>semi-aquáticos 汢 tǔ</label>
				<label onclick='ecoLabelClick(this)'>poças temporárias 暂 zàn</label>
				<label onclick='ecoLabelClick(this)'>profundo 深 shēn</label>
				<label onclick='ecoLabelClick(this)'>raso 浅 qiǎn</label>
				<label onclick='ecoLabelClick(this)'>costeiro 岸 àn</label>
				<label onclick='ecoLabelClick(this)'>mar aberto/pelágico 远 yuǎn</label>
				<label onclick='ecoLabelClick(this)'>superfície d'água 表 biǎo</label>
				<label onclick='ecoLabelClick(this)'>fundo/bentônico 底 dǐ</label>
				<label onclick='ecoLabelClick(this)'>intertidal 汐 xī</label>
				<label onclick='ecoLabelClick(this)'>alta altitude 高 gāo</label>
				<label onclick='ecoLabelClick(this)'>baixa altitude 低 dī</label>
				<label onclick='ecoLabelClick(this)'>serrapilheira/liteira 朽 xiǔ</label>
				<label onclick='ecoLabelClick(this)'>casca de árvore 朴 pǔ</label>
				<label onclick='ecoLabelClick(this)'>úmido 泽 zé</label>
				<label onclick='ecoLabelClick(this)'>lago 泊 bó</label>
				<label onclick='ecoLabelClick(this)'>mangue 红 hóng</label>
				<label onclick='ecoLabelClick(this)'>pântano/pantanal 沼 zhǎo</label>
				<label onclick='ecoLabelClick(this)'>buraco/cavidade 穴 xué</label>
				<label onclick='ecoLabelClick(this)'>caverna 洞 dòng</label>
				<label onclick='ecoLabelClick(this)'>cacto 未 wèi</label>
				<label onclick='ecoLabelClick(this)'>arbusto 灌 guàn</label>
				<label onclick='ecoLabelClick(this)'>bambu 竹 zhú</label>
			</div>
			<div id='ecoMov'>
				<legend style='color:<?= $ecoMov ?>'>Locomoção</legend>
				<label onclick='ecoLabelClick(this)'>nadadores ativos 泳 yǒng</label>
				<label onclick='ecoLabelClick(this)'>plantônicos 浮 fú</label>
				<label onclick='ecoLabelClick(this)'>rápidos 快 kuài</label>
				<label onclick='ecoLabelClick(this)'>lentos 慢 màn</label>
				<label onclick='ecoLabelClick(this)'>noturnos 夜 yè</label>
				<label onclick='ecoLabelClick(this)'>diurnos 日 rì</label>
				<label onclick='ecoLabelClick(this)'>crepusculares 夕 xī</label>
				<label onclick='ecoLabelClick(this)'>ativos dia e noite 天 tiān</label>
				<label onclick='ecoLabelClick(this)'>voam 飞 fēi</label>
				<label onclick='ecoLabelClick(this)'>planam 翔 xiáng</label>
				<label onclick='ecoLabelClick(this)'>rastejam 爬 pá</label>
				<label onclick='ecoLabelClick(this)'>fossoriais/escavadores 挖 wā</label>
				<label onclick='ecoLabelClick(this)'>tubícolas 管 guǎn</label>
				<label onclick='ecoLabelClick(this)'>migratórios 迁 qiān</label>
				<label onclick='ecoLabelClick(this)'>sedentários 定 dìng</label>
				<label onclick='ecoLabelClick(this)'>escansoriais 登 dēng</label>
				<label onclick='ecoLabelClick(this)'>territoriais 境 jìng</label>
				<label onclick='ecoLabelClick(this)'>sésseis 立 lì</label>
				<label onclick='ecoLabelClick(this)'>invasores 侵 qīn</label>
				<label onclick='ecoLabelClick(this)'>hibernam/estivação 伏 fú</label>
				<label onclick='ecoLabelClick(this)'>distribuição 方 fāng</label>
			</div>
			<div id='ecoFeed'>
				<legend style='color:<?= $ecoFeed ?>'>Dieta</legend>
				<label onclick='ecoLabelClick(this)'>herbívoros 植 zhí</label>
				<label onclick='ecoLabelClick(this)'>carnívoros 肉 ròu</label>
				<label onclick='ecoLabelClick(this)'>insetívoros 虫 chóng</label>
				<label onclick='ecoLabelClick(this)'>frugívoros 果 guǒ</label>
				<label onclick='ecoLabelClick(this)'>granívoros 米 mǐ</label>
				<label onclick='ecoLabelClick(this)'>onívoros 杂 zá</label>
				<label onclick='ecoLabelClick(this)'>hematófagos 血 xiě</label>
				<label onclick='ecoLabelClick(this)'>canibalismo 杀 shā</label>
				<label onclick='ecoLabelClick(this)'>fungívoros 菌 jūn</label>
				<label onclick='ecoLabelClick(this)'>predadores 捕 bǔ</label>
				<label onclick='ecoLabelClick(this)'>detritívoros/saprófagos/carniceiros 死 sǐ</label>
				<label onclick='ecoLabelClick(this)'>comensais 余 yú</label>
				<label onclick='ecoLabelClick(this)'>mutualistas 互 hù</label>
				<label onclick='ecoLabelClick(this)'>inquilinismo 居 jū</label>
				<label onclick='ecoLabelClick(this)'>bacteriófagos 宇 yǔ</label>
				<label onclick='ecoLabelClick(this)'>parasitas 寄 jì</label>
				<label onclick='ecoLabelClick(this)'>nectarívoros 甘 gān</label>
				<label onclick='ecoLabelClick(this)'>pólen 粉 fěn</label>
				<label onclick='ecoLabelClick(this)'>galhadores 疣 yóu</label>
				<label onclick='ecoLabelClick(this)'>filtradores 过 guò</label>
				<label onclick='ecoLabelClick(this)'>piscívoros 鱼 yú</label>
				<label onclick='ecoLabelClick(this)'>alimenta/come 吃 chī</label>
				<label onclick='ecoLabelClick(this)'>comida p/ humanos 食 shí</label>
			</div>
			<div id='ecoSex'>
				<legend style='color:<?= $ecoSex ?>'>Reprodução</legend>
				<label onclick='ecoLabelClick(this)'>machos 男 nán</label>
				<label onclick='ecoLabelClick(this)'>fêmeas 女 nǚ</label>
				<label onclick='ecoLabelClick(this)'>ovíparos 卵 luǎn</label>
				<label onclick='ecoLabelClick(this)'>ovovivíparos 胎 tāi</label>
				<label onclick='ecoLabelClick(this)'>vivíparos 孕 yùn</label>
				<label onclick='ecoLabelClick(this)'>partenogênese 孤 gū</label>
				<label onclick='ecoLabelClick(this)'>metamorfose 化 huà</label>
				<label onclick='ecoLabelClick(this)'>fecundação/fertilização 沃 wò</label>
				<label onclick='ecoLabelClick(this)'>monogamia 双 shuāng</label>
				<label onclick='ecoLabelClick(this)'>poligamia 多 duō</label>
				<label onclick='ecoLabelClick(this)' title='muitos filhotes por ninhada, pouco cuidado parental'>r-estrategista 产 chǎn</label>
				<label onclick='ecoLabelClick(this)' title='poucos filhotes por ninhada, muito cuidado parental'>K-estrategista 学 xué</label>
				<label onclick='ecoLabelClick(this)'>cuidado parental 育 yù</label>
				<label onclick='ecoLabelClick(this)'>incubam ovos 抱 bào</label>
				<label onclick='ecoLabelClick(this)'>carregam filhotes nas costas 背 bēi</label>
				<label onclick='ecoLabelClick(this)' title='grupo de machos se exibindo para seleção feminina'>"leks" 跳 tiào</label>
				<label onclick='ecoLabelClick(this)'>monóicos 单 dān</label>
				<label onclick='ecoLabelClick(this)'>dióicos 两 liǎng</label>
				<label onclick='ecoLabelClick(this)'>dimorfismo sexual 厷 gōng</label>
				<label onclick='ecoLabelClick(this)'>hermafroditas 和 hé</label>
				<label onclick='ecoLabelClick(this)'>neotênicos 青 qīng</label>
				<label onclick='ecoLabelClick(this)'>altriciais/desenvolvem tarde 迟 chí</label>
				<label onclick='ecoLabelClick(this)'>precoces/desenvolvem cedo 早 zǎo</label>
				<label onclick='ecoLabelClick(this)' title='sobe rio para reproduzir'>anádromo 溯 sù</label>
				<label onclick='ecoLabelClick(this)' title='desce rio para reproduzir'>catádromo 向 xiàng</label>
			</div>
			<div id='ecoBehav'>
				<legend style='color:<?= $ecoBehav ?>'>Comportamento</legend>
				<label onclick='ecoLabelClick(this)'>solitários 仅 jǐn</label>
				<label onclick='ecoLabelClick(this)'>sociais 社 shè</label>
				<label onclick='ecoLabelClick(this)'>coloniais 交 jiāo</label>
				<label onclick='ecoLabelClick(this)'>atacam em bando 兵 bīng</label>
				<label onclick='ecoLabelClick(this)'>muda de cor 采 cǎi</label>
				<label onclick='ecoLabelClick(this)'>veneno 毒 dú</label>
				<label onclick='ecoLabelClick(this)'>brilho metálico 金 jīn</label>
				<label onclick='ecoLabelClick(this)'>elétricos/dão choque 电 diàn</label>
				<label onclick='ecoLabelClick(this)'>música/vocalização complexa 乐 yuè</label>
				<label onclick='ecoLabelClick(this)'>ecolocação 回 huí</label>
				<label onclick='ecoLabelClick(this)'>brilho/bioluminescência 光 guāng</label>
				<label onclick='ecoLabelClick(this)'>respira ar 气 qì</label>
				<label onclick='ecoLabelClick(this)'>peste/praga 害 hài</label>
				<label onclick='ecoLabelClick(this)'>seda 丝 sī</label>
				<label onclick='ecoLabelClick(this)'>miméticos 象 xiàng</label>
				<label onclick='ecoLabelClick(this)'>camuflagem 伪 wěi</label>
				<label onclick='ecoLabelClick(this)'>aposemáticos 示 shì</label>
				<label onclick='ecoLabelClick(this)'>ameaçados de extinção 灭 miè</label>
				<label onclick='ecoLabelClick(this)'>sinantrópicos 人 rén</label>
				<label onclick='ecoLabelClick(this)' title='de doença'>vetor 介 jiè</label>
				<label onclick='ecoLabelClick(this)'>especialistas 专 zhuān</label>
				<label onclick='ecoLabelClick(this)'>generalistas/oportunistas 共 gòng</label>
				<label onclick='ecoLabelClick(this)'>endêmicos a pequena área 地 dì</label>
				<label onclick='ecoLabelClick(this)'>raros/tímidos/difíceis de ver 罕 hǎn</label>
				<label onclick='ecoLabelClick(this)'>comuns 常 cháng</label>
				<label onclick='ecoLabelClick(this)'>primitivamente 古 gǔ</label>
			</div>
			<div id='ecoBody'>
				<legend style='color:<?= $ecoBod ?>'>Corpo</legend>
				<label onclick='ecoLabelClick(this)'>corpo 身 shēn</label>
				<label onclick='ecoLabelClick(this)'>membros 支 zhī</label>
				<label onclick='ecoLabelClick(this)'>cabeça 头 tóu</label>
				<label onclick='ecoLabelClick(this)'>focinho/nariz 自 zì</label>
				<label onclick='ecoLabelClick(this)'>olhos 目 mù</label>
				<label onclick='ecoLabelClick(this)'>orelhas 耳 ěr</label>
				<label onclick='ecoLabelClick(this)'>mandíbulas/bico 咢 è</label>
				<label onclick='ecoLabelClick(this)'>dentes/quelíceras 牙 yá</label>
				<label onclick='ecoLabelClick(this)'>língua 舌 shé</label>
				<label onclick='ecoLabelClick(this)'>pele 皮 pí</label>
				<label onclick='ecoLabelClick(this)'>cauda 尾 wěi</label>
				<label onclick='ecoLabelClick(this)'>asas 羽 yǔ</label>
				<label onclick='ecoLabelClick(this)'>pêlos/peludo 毛 máo</label>
				<label onclick='ecoLabelClick(this)'>concha 壳 ké</label>
				<label onclick='ecoLabelClick(this)'>brânquias 腮 sāi</label>
				<label onclick='ecoLabelClick(this)'>esqueleto/ossos 骨 gǔ</label>
				<label onclick='ecoLabelClick(this)'>coração 心 xīn</label>
				<label onclick='ecoLabelClick(this)'>pulmões 肺 fèi</label>
				<label onclick='ecoLabelClick(this)'>intestino 肠 cháng</label>
				<label onclick='ecoLabelClick(this)'>fígado 肝 gān</label>
				<label onclick='ecoLabelClick(this)'>rins 肾 shèn</label>
				<label onclick='ecoLabelClick(this)'>espinho/ferrão 朿 cì</label>
				<label onclick='ecoLabelClick(this)'>ninho 西 xī</label>
				<label onclick='ecoLabelClick(this)'>respiração 息 xī</label>
				<label onclick='ecoLabelClick(this)'>excreção 泄 xiè</label>
				<label onclick='ecoLabelClick(this)'>juvenis 子 zǐ</label>
				<label onclick='ecoLabelClick(this)'>adultos 成 chéng</label>
				<label onclick='ecoLabelClick(this)'>idade máxima 久 jiǔ</label>
			</div>
			<div id='ecoMorf'>
				<legend style='color:<?= $ecoMorf ?>'>Forma</legend>
				<label onclick='ecoLabelClick(this)'>não 不 bù</label>
				<label onclick='ecoLabelClick(this)'>sem 无 wú</label>
				<label onclick='ecoLabelClick(this)'>pequenos 小 xiǎo</label>
				<label onclick='ecoLabelClick(this)'>médios 中 zhōng</label>
				<label onclick='ecoLabelClick(this)'>grandes 大 dà</label>
				<label onclick='ecoLabelClick(this)'>côncavo 凹 āo</label>
				<label onclick='ecoLabelClick(this)'>convexo 凸 tū</label>
				<label onclick='ecoLabelClick(this)'>forte/intenso 力 lì</label>
				<label onclick='ecoLabelClick(this)'>fraco/suave 弱 ruò</label>
				<label onclick='ecoLabelClick(this)'>vertical 丨 gǔn</label>
				<label onclick='ecoLabelClick(this)'>horizontal 一 yī</label>
				<label onclick='ecoLabelClick(this)'>duro/esclerotizado 坚 jiān</label>
				<label onclick='ecoLabelClick(this)'>macio/mole/flexível 软 ruǎn</label>
				<label onclick='ecoLabelClick(this)'>achatado 平 píng</label>
				<label onclick='ecoLabelClick(this)'>plesiomórfico/primitivo 原 yuán</label>
				<label onclick='ecoLabelClick(this)'>apomórfico/derivado 改 gǎi</label>
				<label onclick='ecoLabelClick(this)'>unido/próximo 关 guān</label>
				<label onclick='ecoLabelClick(this)'>separado/dividido/distante 分 fēn</label>
				<label onclick='ecoLabelClick(this)'>amplo/largo 广 guǎng</label>
				<label onclick='ecoLabelClick(this)'>estreito/fino 细 xì</label>
				<label onclick='ecoLabelClick(this)'>curto 短 duǎn</label>
				<label onclick='ecoLabelClick(this)'>longo/comprido 长 cháng</label>
				<label onclick='ecoLabelClick(this)'>vestigial 迹 jī</label>
				<label onclick='ecoLabelClick(this)'>superiores 上 shàng</label>
				<label onclick='ecoLabelClick(this)'>inferiores 下 xià</label>
				<label onclick='ecoLabelClick(this)'>anteriores 前 qián</label>
				<label onclick='ecoLabelClick(this)'>posteriores 后 hòu</label>
				<label onclick='ecoLabelClick(this)'>exterior/externo 外 wài</label>
				<label onclick='ecoLabelClick(this)'>interior/interno 内 nèi</label>
				<label onclick='ecoLabelClick(this)'>parcial/semi- 半 bàn</label>
				<label onclick='ecoLabelClick(this)'>completo 全 quán</label>
				<label onclick='ecoLabelClick(this)'>pouco 点 diǎn</label>
				<label onclick='ecoLabelClick(this)'>alguns 几 jǐ</label>
				<label onclick='ecoLabelClick(this)'>muito 很 hěn</label>
				<label onclick='ecoLabelClick(this)'>muitos 众 zhòng</label>
			</div>
		</div>
		<div id='divGeo'>
			<div id='geoG'>
				<legend style='color:#00F'>Geral</legend>
				<label onclick='geoLabelClick(this)'>aa Antártica</label>
				<label onclick='geoLabelClick(this)'>c central</label>
				<label onclick='geoLabelClick(this)'>e leste</label>
				<label onclick='geoLabelClick(this)'>f frio</label>
				<label onclick='geoLabelClick(this)'>G global/cosmopolita</label>
				<label onclick='geoLabelClick(this)'>H Holártico</label>
				<label onclick='geoLabelClick(this)'>Hn Hemisfério Norte</label>
				<label onclick='geoLabelClick(this)'>Hs Hemisfério Sul</label>
				<label onclick='geoLabelClick(this)'>N Neotropical</label>
				<label onclick='geoLabelClick(this)'>n norte</label>
				<label onclick='geoLabelClick(this)'>O Oriental</label>
				<label onclick='geoLabelClick(this)'>oa Oceano Atlântico</label>
				<label onclick='geoLabelClick(this)'>oi Oceano Índico</label>
				<label onclick='geoLabelClick(this)'>oip Oceano Indo-Pacífico</label>
				<label onclick='geoLabelClick(this)'>op Oceano Pacífico</label>
				<label onclick='geoLabelClick(this)'>P Paleártico</label>
				<label onclick='geoLabelClick(this)'>Q Equatorial</label>
				<label onclick='geoLabelClick(this)'>q quente</label>
				<label onclick='geoLabelClick(this)'>R Neártico</label>
				<label onclick='geoLabelClick(this)'>s sul</label>
				<label onclick='geoLabelClick(this)'>sT subtropical</label>
				<label onclick='geoLabelClick(this)'>T tropical</label>
				<label onclick='geoLabelClick(this)'>t temperado</label>
				<label onclick='geoLabelClick(this)'>u Tundra/Taiga</label>
				<label onclick='geoLabelClick(this)'>V Velho Mundo</label>
				<label onclick='geoLabelClick(this)'>w oeste</label>
				<label onclick='geoLabelClick(this)'>&gt; introduzido em (local/locais seguintes)</label>
				<label onclick='geoLabelClick(this)'>! a maioria (eco/geo anterior)</label>
				<label onclick='geoLabelClick(this)'>† extinto</label>
			</div>
			<div id='geoF'>
				<legend style='color:#840'>África e Europa</legend>
				<label onclick='geoLabelClick(this)'>al Argélia</label>
				<label onclick='geoLabelClick(this)'>bo Botswana</label>
				<label onclick='geoLabelClick(this)'>E Europa</label>
				<label onclick='geoLabelClick(this)'>É Etiópica</label>
				<label onclick='geoLabelClick(this)'>F África</label>
				<label onclick='geoLabelClick(this)'>Fh Chifre da África</label>
				<label onclick='geoLabelClick(this)'>Fnn África ao norte do Saara</label>
				<label onclick='geoLabelClick(this)'>fs África do Sul</label>
				<label onclick='geoLabelClick(this)'>Fss África Sub-Saariana</label>
				<label onclick='geoLabelClick(this)'>m Madagascar</label>
				<label onclick='geoLabelClick(this)'>ma Ilhas Maurício</label>
				<label onclick='geoLabelClick(this)'>me Mediterrâneo</label>
				<label onclick='geoLabelClick(this)'>r.C Rio Congo</label>
				<label onclick='geoLabelClick(this)'>r.N Rio Nilo</label>
				<label onclick='geoLabelClick(this)'>y Seychelles</label>
			</div>
			<div id='geoM'>
				<legend style='color:#080'>América</legend>
				<label onclick='geoLabelClick(this)'>ai Antilhas</label>
				<label onclick='geoLabelClick(this)'>ak Alaska</label>
				<label onclick='geoLabelClick(this)'>am Amazônia</label>
				<label onclick='geoLabelClick(this)'>an Andes</label>
				<label onclick='geoLabelClick(this)'>ar Argentina</label>
				<label onclick='geoLabelClick(this)'>ba Bahamas</label>
				<label onclick='geoLabelClick(this)'>br Brasil</label>
				<label onclick='geoLabelClick(this)'>ca Canadá</label>
				<label onclick='geoLabelClick(this)'>cal Califórnia</label>
				<label onclick='geoLabelClick(this)'>cb Caribe</label>
				<label onclick='geoLabelClick(this)'>cl Chile</label>
				<label onclick='geoLabelClick(this)'>co Colômbia</label>
				<label onclick='geoLabelClick(this)'>cr Costa Rica</label>
				<label onclick='geoLabelClick(this)'>eq Equador</label>
				<label onclick='geoLabelClick(this)'>fl Flórida</label>
				<label onclick='geoLabelClick(this)'>g Galápagos</label>
				<label onclick='geoLabelClick(this)'>gu Guatemala</label>
				<label onclick='geoLabelClick(this)'>h Havaí</label>
				<label onclick='geoLabelClick(this)'>M América</label>
				<label onclick='geoLabelClick(this)'>pa Panamá</label>
				<label onclick='geoLabelClick(this)'>pe Peru</label>
				<label onclick='geoLabelClick(this)'>pr Paraguai</label>
				<label onclick='geoLabelClick(this)'>r.A Rio Amazonas</label>
				<label onclick='geoLabelClick(this)'>r.L Rio La plata</label>
				<label onclick='geoLabelClick(this)'>r.M Rios Mississipi/Missouri</label>
				<label onclick='geoLabelClick(this)'>r.O Rio Orinoco</label>
				<label onclick='geoLabelClick(this)'>r.P Rio Paraná</label>
				<label onclick='geoLabelClick(this)'>tf Terra do Fogo</label>
				<label onclick='geoLabelClick(this)'>tr Trinidad</label>
				<label onclick='geoLabelClick(this)'>us Estados Unidos</label>
				<label onclick='geoLabelClick(this)'>v Venezuela</label>
				<label onclick='geoLabelClick(this)'>x México</label>
			</div>
			<div id='geoS'>
				<legend style='color:#F00'>Ásia e Oceania</legend>
				<label onclick='geoLabelClick(this)'>A Australiana</label>
				<label onclick='geoLabelClick(this)'>a Austrália</label>
				<label onclick='geoLabelClick(this)'>b Borneo</label>
				<label onclick='geoLabelClick(this)'>cau Cáucaso</label>
				<label onclick='geoLabelClick(this)'>ch China</label>
				<label onclick='geoLabelClick(this)'>fj Fiji</label>
				<label onclick='geoLabelClick(this)'>I Indonésia</label>
				<label onclick='geoLabelClick(this)'>i Índia</label>
				<label onclick='geoLabelClick(this)'>im Ilhas Molucas</label>
				<label onclick='geoLabelClick(this)'>is Ilhas Salomão</label>
				<label onclick='geoLabelClick(this)'>j Java</label>
				<label onclick='geoLabelClick(this)'>jp Japão</label>
				<label onclick='geoLabelClick(this)'>k Sri Lanka</label>
				<label onclick='geoLabelClick(this)'>kn Coréia do Norte</label>
				<label onclick='geoLabelClick(this)'>ko Coréia</label>
				<label onclick='geoLabelClick(this)'>ks Coréia do Sul</label>
				<label onclick='geoLabelClick(this)'>mel Melanésia</label>
				<label onclick='geoLabelClick(this)'>mic Micronésia</label>
				<label onclick='geoLabelClick(this)'>ml Malásia</label>
				<label onclick='geoLabelClick(this)'>mn Manchúria</label>
				<label onclick='geoLabelClick(this)'>mp Península Malaia</label>
				<label onclick='geoLabelClick(this)'>my Myanmar</label>
				<label onclick='geoLabelClick(this)'>nc Nova Caledônia</label>
				<label onclick='geoLabelClick(this)'>ng Nova Guiné</label>
				<label onclick='geoLabelClick(this)'>nz Nova Zelândia</label>
				<label onclick='geoLabelClick(this)'>oc Oceania</label>
				<label onclick='geoLabelClick(this)'>om Oriente Médio</label>
				<label onclick='geoLabelClick(this)'>ph Filipinas</label>
				<label onclick='geoLabelClick(this)'>pk Paquistão</label>
				<label onclick='geoLabelClick(this)'>png Papua Nova Guiné</label>
				<label onclick='geoLabelClick(this)'>r.G Rio Ganges</label>
				<label onclick='geoLabelClick(this)'>r.H Rio Amarelo/He/黄河/河</label>
				<label onclick='geoLabelClick(this)'>r.I Rio Indo</label>
				<label onclick='geoLabelClick(this)'>r.ob Rio Ob/Irtysh</label>
				<label onclick='geoLabelClick(this)'>r.V Rio Volga</label>
				<label onclick='geoLabelClick(this)'>r.Y Rio Yangtze/长江/江</label>
				<label onclick='geoLabelClick(this)'>r.yi Rio Yenisei/Angara/Selenga</label>
				<label onclick='geoLabelClick(this)'>S Ásia</label>
				<label onclick='geoLabelClick(this)'>sa Samoa</label>
				<label onclick='geoLabelClick(this)'>su Sumatra</label>
				<label onclick='geoLabelClick(this)'>ta Tasmânia</label>
				<label onclick='geoLabelClick(this)'>tl Tailândia</label>
				<label onclick='geoLabelClick(this)'>to Tonga</label>
				<label onclick='geoLabelClick(this)'>vi Vietnã</label>
			</div>
			<div id='geoT'>
				<legend>Todos</legend>
				<label onclick='geoLabelClick(this)'>F África</label>
				<label onclick='geoLabelClick(this)'>Fnn África ao norte do Saara</label>
				<label onclick='geoLabelClick(this)'>fs África do Sul</label>
				<label onclick='geoLabelClick(this)'>Fss África Sub-Saariana</label>
				<label onclick='geoLabelClick(this)'>ak Alaska</label>
				<label onclick='geoLabelClick(this)'>am Amazônia</label>
				<label onclick='geoLabelClick(this)'>M América</label>
				<label onclick='geoLabelClick(this)'>an Andes</label>
				<label onclick='geoLabelClick(this)'>aa Antártica</label>
				<label onclick='geoLabelClick(this)'>ai Antilhas</label>
				<label onclick='geoLabelClick(this)'>al Argélia</label>
				<label onclick='geoLabelClick(this)'>ar Argentina</label>
				<label onclick='geoLabelClick(this)'>S Ásia</label>
				<label onclick='geoLabelClick(this)'>a Austrália</label>
				<label onclick='geoLabelClick(this)'>A Australiana</label>
				<label onclick='geoLabelClick(this)'>ba Bahamas</label>
				<label onclick='geoLabelClick(this)'>b Borneo</label>
				<label onclick='geoLabelClick(this)'>bo Botswana</label>
				<label onclick='geoLabelClick(this)'>br Brasil</label>
				<label onclick='geoLabelClick(this)'>cal Califórnia</label>
				<label onclick='geoLabelClick(this)'>ca Canadá</label>
				<label onclick='geoLabelClick(this)'>cb Caribe</label>
				<label onclick='geoLabelClick(this)'>cau Cáucaso</label>
				<label onclick='geoLabelClick(this)'>c central</label>
				<label onclick='geoLabelClick(this)'>Fh Chifre da África</label>
				<label onclick='geoLabelClick(this)'>cl Chile</label>
				<label onclick='geoLabelClick(this)'>ch China</label>
				<label onclick='geoLabelClick(this)'>co Colômbia</label>
				<label onclick='geoLabelClick(this)'>ko Coréia</label>
				<label onclick='geoLabelClick(this)'>kn Coréia do Norte</label>
				<label onclick='geoLabelClick(this)'>ks Coréia do Sul</label>
				<label onclick='geoLabelClick(this)'>cr Costa Rica</label>
				<label onclick='geoLabelClick(this)'>eq Equador</label>
				<label onclick='geoLabelClick(this)'>Q Equatorial</label>
				<label onclick='geoLabelClick(this)'>us Estados Unidos</label>
				<label onclick='geoLabelClick(this)'>É Etiópica</label>
				<label onclick='geoLabelClick(this)'>E Europa</label>
				<label onclick='geoLabelClick(this)'>fj Fiji</label>
				<label onclick='geoLabelClick(this)'>ph Filipinas</label>
				<label onclick='geoLabelClick(this)'>fl Flórida</label>
				<label onclick='geoLabelClick(this)'>f frio</label>
				<label onclick='geoLabelClick(this)'>g Galápagos</label>
				<label onclick='geoLabelClick(this)'>G global/cosmopolita</label>
				<label onclick='geoLabelClick(this)'>gu Guatemala</label>
				<label onclick='geoLabelClick(this)'>h Havaí</label>
				<label onclick='geoLabelClick(this)'>Hn Hemisfério Norte</label>
				<label onclick='geoLabelClick(this)'>Hs Hemisfério Sul</label>
				<label onclick='geoLabelClick(this)'>H Holártico</label>
				<label onclick='geoLabelClick(this)'>ma Ilhas Maurício</label>
				<label onclick='geoLabelClick(this)'>im Ilhas Molucas</label>
				<label onclick='geoLabelClick(this)'>is Ilhas Salomão</label>
				<label onclick='geoLabelClick(this)'>i Índia</label>
				<label onclick='geoLabelClick(this)'>I Indonésia</label>
				<label onclick='geoLabelClick(this)'>jp Japão</label>
				<label onclick='geoLabelClick(this)'>j Java</label>
				<label onclick='geoLabelClick(this)'>e leste</label>
				<label onclick='geoLabelClick(this)'>m Madagascar</label>
				<label onclick='geoLabelClick(this)'>ml Malásia</label>
				<label onclick='geoLabelClick(this)'>mn Manchúria</label>
				<label onclick='geoLabelClick(this)'>me Mediterrâneo</label>
				<label onclick='geoLabelClick(this)'>mel Melanésia</label>
				<label onclick='geoLabelClick(this)'>x México</label>
				<label onclick='geoLabelClick(this)'>mic Micronésia</label>
				<label onclick='geoLabelClick(this)'>my Myanmar</label>
				<label onclick='geoLabelClick(this)'>R Neártica</label>
				<label onclick='geoLabelClick(this)'>N Neotropical</label>
				<label onclick='geoLabelClick(this)'>n norte</label>
				<label onclick='geoLabelClick(this)'>nc Nova Caledônia</label>
				<label onclick='geoLabelClick(this)'>ng Nova Guiné</label>
				<label onclick='geoLabelClick(this)'>nz Nova Zelândia</label>
				<label onclick='geoLabelClick(this)'>oc Oceania</label>
				<label onclick='geoLabelClick(this)'>oa Oceano Atlântico</label>
				<label onclick='geoLabelClick(this)'>oi Oceano Índico</label>
				<label onclick='geoLabelClick(this)'>oip Oceano Indo-Pacífico</label>
				<label onclick='geoLabelClick(this)'>op Oceano Pacífico</label>
				<label onclick='geoLabelClick(this)'>w oeste</label>
				<label onclick='geoLabelClick(this)'>O Oriental</label>
				<label onclick='geoLabelClick(this)'>om Oriente Médio</label>
				<label onclick='geoLabelClick(this)'>P Paleártica</label>
				<label onclick='geoLabelClick(this)'>pa Panamá</label>
				<label onclick='geoLabelClick(this)'>png Papua Nova Guiné</label>
				<label onclick='geoLabelClick(this)'>pk Paquistão</label>
				<label onclick='geoLabelClick(this)'>pr Paraguai</label>
				<label onclick='geoLabelClick(this)'>mp Península Malaia</label>
				<label onclick='geoLabelClick(this)'>pe Peru</label>
				<label onclick='geoLabelClick(this)'>q quente</label>
				<label onclick='geoLabelClick(this)'>r.H Rio Amarelo/He/黄河/河</label>
				<label onclick='geoLabelClick(this)'>r.A Rio Amazonas</label>
				<label onclick='geoLabelClick(this)'>r.C Rio Congo</label>
				<label onclick='geoLabelClick(this)'>r.G Rio Ganges</label>
				<label onclick='geoLabelClick(this)'>r.I Rio Indo</label>
				<label onclick='geoLabelClick(this)'>r.L Rio La plata</label>
				<label onclick='geoLabelClick(this)'>r.N Rio Nilo</label>
				<label onclick='geoLabelClick(this)'>r.ob Rio Ob/Irtysh</label>
				<label onclick='geoLabelClick(this)'>r.O Rio Orinoco</label>
				<label onclick='geoLabelClick(this)'>r.P Rio Paraná</label>
				<label onclick='geoLabelClick(this)'>r.V Rio Volga</label>
				<label onclick='geoLabelClick(this)'>r.Y Rio Yangtze/长江/江</label>
				<label onclick='geoLabelClick(this)'>r.yi Rio Yenisei/Angara/Selenga</label>
				<label onclick='geoLabelClick(this)'>r.M Rios Mississipi/Missouri</label>
				<label onclick='geoLabelClick(this)'>sa Samoa</label>
				<label onclick='geoLabelClick(this)'>y Seychelles</label>
				<label onclick='geoLabelClick(this)'>k Sri Lanka</label>
				<label onclick='geoLabelClick(this)'>sT subtropical</label>
				<label onclick='geoLabelClick(this)'>s sul</label>
				<label onclick='geoLabelClick(this)'>su Sumatra</label>
				<label onclick='geoLabelClick(this)'>tl Tailândia</label>
				<label onclick='geoLabelClick(this)'>ta Tasmânia</label>
				<label onclick='geoLabelClick(this)'>t temperado</label>
				<label onclick='geoLabelClick(this)'>tf Terra do Fogo</label>
				<label onclick='geoLabelClick(this)'>to Tonga</label>
				<label onclick='geoLabelClick(this)'>tr Trinidad</label>
				<label onclick='geoLabelClick(this)'>T tropical</label>
				<label onclick='geoLabelClick(this)'>u Tundra/Taiga</label>
				<label onclick='geoLabelClick(this)'>V Velho Mundo</label>
				<label onclick='geoLabelClick(this)'>v Venezuela</label>
				<label onclick='geoLabelClick(this)'>vi Vietnã</label>
			</div>
		</div>
	</div>
</div>
<div id='menu' oncontextmenu='return false'>
	<span id='mnuClado'>Clado</span><br>
	<button type='button' onclick='mnuNavegar()'>Navegar (Click)</button><br>
	<button type='button' onclick='mnuEditar()'>Editar (Shift+Click)</button><br>
	<button type='button' onclick='mnuInserir()'>Inserir (Ctrl+Click)</button><br>
	<button type='button' id='btnFixar' onclick='mnuFixar(2)'>Fixar (Enter)</button><br>
	<button type='button' onclick='mnuVoltar()'>Voltar (Backspace)</button><br>
	<button type='button' onclick='mnuImagens()'>Imagens (i)</button>
	<button type='button' onclick='mnuAPI()'>Projetos (p)</button>
	<a href='' target='_blank' id='linkImg'></a>
</div>
</html>
