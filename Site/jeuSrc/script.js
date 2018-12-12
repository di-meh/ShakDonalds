//Initialisation des variables
var joueur;

var rect = {
	x:150,
	y:350,
	width:400,
	heigth:100
};

function Joueur(nom) {
	this.nom = nom;
	this.score = 0;
	this.argent = 100;
	this.niveau = 1;
	this.xp = 0;

}

var isInGame = false;


//NOTE A SOI MEME: mettre les objects dans la meme classe.


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

		this.context.beginPath();
		this.context.rect(150,350,400,100);
		this.context.fillStyle = '#ffdf23';
		this.context.fill();
		this.context.lineWidth = 2;
		this.context.strokeStyle = '#000000'; 
		this.context.stroke();
		this.context.closePath();

		this.context.font = "20px Montserrat";
		this.context.fillStyle = "#000000";
		this.context.fillText("Cliquer pour commencer", 225, 400);
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

myGameArea.canvas.addEventListener('click', function(evt) {
	var mousePos = getMousePos(myGameArea.canvas, evt);
    
	if (isInside(mousePos,rect)) {
		testMain();
    }
    

}, false);



//Main du jeu

function testMain() {
	myGameArea.clear();
	/*myGameArea.context.font = "30px Montserrat";
	myGameArea.context.fillStyle = "#ffdf23";
	myGameArea.context.fillText("Nom : " + joueur.nom, myGameArea.canvas.width/4, myGameArea.canvas.height/5);
	myGameArea.context.fillText("Score : " + joueur.score, myGameArea.canvas.width/4, myGameArea.canvas.height/4);
	myGameArea.context.fillText("Argent : " + joueur.argent, myGameArea.canvas.width/4, myGameArea.canvas.height/3);
	myGameArea.context.fillText("Niveau : " + joueur.niveau, myGameArea.canvas.width/4, myGameArea.canvas.height/2);
	*/

	//début du jeu

	var burger = new Image(20,20);
	burger.src = "redsquare.jpg";
	var context = myGameArea.canvas.getContext("2d");
	context.drawImage(burger, 160, 20);

}

function testMain2() {
	alert("Lol");
}



function getMousePos(canvas, event) {
	var rect = canvas.getBoundingClientRect();
	return {
		x: event.clientX - rect.left,
		y: event.clientY - rect.top
	};
}

function isInside(pos, rect){
	return pos.x > rect.x && pos.x < rect.x+rect.width && pos.y < rect.y+rect.heigth && pos.y > rect.y
}


//Drag et drop images
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