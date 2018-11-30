//Initialisation des variables
var joueur;
var score;

//NOTE A SOI MEME: mettre les objects dans la meme classe.

//joueur =  new Joueur("bonjour");

//Main du canvas
function startGame() {
	joueur =  new Joueur("bonjour");
	//Le reste
	myGameArea.start();
}


var myGameArea = {
	canvas: document.getElementById("canvasJeu"),
	start : function() {
		this.canvas.width = 720;
		this.canvas.height = 480;
		this.context = this.canvas.getContext("2d");
		
		this.context.font = "50px Montserrat";
		this.context.fillStyle = "#ffdf23";
		this.context.fillText("ShakDonalds Le Jeu", this.canvas.width/6, this.canvas.height/2);
		/*
		this.context.font = "20px Montserrat";
		this.context.fillStyle = "#ffdf23";
		this.context.fillText("Coming soon, blyat", this.canvas.width/2.75, this.canvas.height/1.5);
		document.body.insertBefore(this.canvas, document.body.childNodes[0]);
		*/
		},
	clear : function() {
		this.context.clearRect(0,0,this.canvas.width, this.canvas.height);
	}
}

function Joueur(nom) {
	this.nom = nom;
	this.score = 0;
	this.argent = 100;
	this.niveau = 1;
	this.xp = 0;

}


//Main du jeu

function testMain() {
	myGameArea.clear();
	myGameArea.context.font = "30px Montserrat";
	myGameArea.context.fillStyle = "#ffdf23";
	myGameArea.context.fillText("Nom : " + joueur.nom, myGameArea.canvas.width/4, myGameArea.canvas.height/5);
	
}


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