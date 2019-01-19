//Initialisation des variables
var score = 0;

var rectStart = {
	x:150,
	y:350,
	width:430,
	heigth:100
};

/*
function Joueur(nom) {
	this.nom = nom;
	this.score = 0;
	this.argent = 100;
	this.niveau = 1;
	this.xp = 0;

}
*/
var burger = new Image();
burger.src = "Images/burger.png";



var myGameArea = {
	canvas: document.getElementById("canvasJeu"),
	param: null,
	start : function() {
		this.canvas.width = 720;
		this.canvas.height = 480;
		this.context = this.canvas.getContext("2d");
		
		this.context.font = "50px Montserrat";
		this.context.fillStyle = "#ffdf23";
		this.context.fillText("Шакдоналдc", this.canvas.width/4, this.canvas.height/2);

		this.context.beginPath();
		this.context.rect(150,350,430,100);
		this.context.fillStyle = '#ffdf23';
		this.context.fill();
		this.context.lineWidth = 2;
		this.context.strokeStyle = '#000000'; 
		this.context.stroke();
		this.context.closePath();

		this.context.font = "20px Montserrat";
		this.context.fillStyle = "#000000";
		this.context.fillText("Cliquer pour commencer", 245, 405);
		this.canvas.addEventListener('click', estInterieurStart);

		
		},
	clear : function() {
		this.context.clearRect(0,0,this.canvas.width, this.canvas.height);
	}

}
function estInterieurStart(evt) {
	var mousePos = getMousePos(myGameArea.canvas, evt);
    
	if (isInside(mousePos,rectStart)) {
		Main();
		myGameArea.canvas.removeEventListener('click', estInterieurStart);
	}
}

//Main du canvas
function startGame() {
	//joueur =  new Joueur("bonjour");
	myGameArea.start();
}

//Main du jeu

function Main() {
	myGameArea.clear();
	Main3();
}



function Main3() {
	var ctx = myGameArea.context;
	var canv = myGameArea.canvas;

	ctx.drawImage(burger, 250, 150,200,200);
	var rectBurger = {
		x:250,
		y:150,
		width:200,
		height:200 
	};

	ctx.font = "20px Montserrat";
	ctx.fillStyle = "#ffdf23";
	ctx.fillText("Cliquez pour faire des délicieux burgers !", 150, 400);
	ctx.fillText("Burgers : ", 250, 100);

	canv.param = rectBurger;
	canv.addEventListener('click',incrément);
	
	setInterval("update()",1000/60);

}

function update() {
	myGameArea.context.clearRect(400,50,100,100);
	myGameArea.context.fillText(score, 400,100);
}

function incrément(evt) {
	var mousePos = getMousePos(myGameArea.canvas, evt);
	var params = evt.currentTarget.param;
	if (mousePos.x >= params.x && mousePos.x <= params.x+params.width && mousePos.y <= params.y+params.height && mousePos.y >= params.y ) { //Problème de fonctionnement de la fonction isInside
		score+=1;
	}
}

//Détection de souris à l'intérieur d'un rectangle
function getMousePos(canvas, event) {
	var rect = canvas.getBoundingClientRect();
	return {
		x: event.clientX - rect.left,
		y: event.clientY - rect.top
	};
}

function isInside(pos, rect){
	return pos.x > rect.x && pos.x < rect.x+rect.width && pos.y < rect.y+rect.heigth && pos.y > rect.y;
}


//Drag et drop images UNUSED
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}