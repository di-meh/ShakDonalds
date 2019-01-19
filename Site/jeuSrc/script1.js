//Initialisation des variables
var rectStart = {
	x:150,
	y:350,
	width:430,
	heigth:100
};
var rectViande = {
	x:100,
	y:350,
	width:100,
	height:100 
};
var rectSalade = {
	x:250,
	y:350,
	width:100,
	height:100
};
var rectPain = {
	x:400,
	y:350,
	width:100,
	height:100
};
var rectTomate = {
	x:550,
	y:350,
	width:100,
	height:100
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

var viande = new Image();
viande.src = "Images/steak.png";
var salade = new Image();
salade.src = "Images/salade.png"
var pain = new Image();
pain.src = "Images/pain.png";
var tomate = new Image();
tomate.src = "Images/tomate.png"
var burger = new Image();
burger.src="Images/burger.png";

var bigBurger;

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
	bigBurger = [];
	Main1();
}

function Main1() {
	
	var ctx = myGameArea.context;
	var canv = myGameArea.canvas;

	ctx.font = "20px Montserrat";
	ctx.fillStyle = "#ffdf23";
	ctx.fillText("Cliquez sur les ingrédients pour faire un délicieux burger !", 80, 100);

	ctx.drawImage(viande, 100, 350,100,100);
	ctx.drawImage(salade, 250, 350,100,100);
	ctx.drawImage(pain, 400, 350,100,100);
	ctx.drawImage(tomate, 550, 350,100,100);


	var listRect = [rectViande, rectSalade, rectPain, rectTomate];
	canv.param = listRect;
	canv.addEventListener('click', estIntérieurIngrédient);
	
	
}

function estIntérieurIngrédient(evt) {
	var mousePos = getMousePos(myGameArea.canvas, evt);
	var params = evt.currentTarget.param;
	var clone = bigBurger;
	//IMPORTANT: malgré des tentatives de simplification, le code suivant, malgré sa longueur et la répétition, ne peut pas fonctionner autrement.
	//J'ai beau avoir essayé de regrouper le tout dans des fonctions séparées, rien n'y fait. 
	if (mousePos.x >= params[0].x && mousePos.x <= params[0].x+params[0].width && mousePos.y <= params[0].y+params[0].height && mousePos.y >= params[0].y) {//ne fonctionne pas autrement
		myGameArea.context.clearRect(params[0].x, params[0].y, params[0].width, params[0].height);
		//myGameArea.canvas.removeEventListener('click', estIntérieurIngrédient);
		clone.push(params[0]);
		params[0]="";
	}
	if (mousePos.x >= params[1].x && mousePos.x <= params[1].x+params[1].width && mousePos.y <= params[1].y+params[1].height && mousePos.y >= params[1].y) {//ne fonctionne pas autrement
		myGameArea.context.clearRect(params[1].x, params[1].y, params[1].width, params[1].height);
		//myGameArea.canvas.removeEventListener('click', estIntérieurIngrédient);
		clone.push(params[1]);
		params[1]="";
	}
	if (mousePos.x >= params[2].x && mousePos.x <= params[2].x+params[2].width && mousePos.y <= params[2].y+params[2].height && mousePos.y >= params[2].y) {//ne fonctionne pas autrement
		myGameArea.context.clearRect(params[2].x, params[2].y, params[2].width, params[2].height);
		//myGameArea.canvas.removeEventListener('click', estIntérieurIngrédient);
		clone.push(params[2]);
		params[2]="";
	}
	if (mousePos.x >= params[3].x && mousePos.x <= params[3].x+params[3].width && mousePos.y <= params[3].y+params[3].height && mousePos.y >= params[3].y) {//ne fonctionne pas autrement
		myGameArea.context.clearRect(params[3].x, params[3].y, params[3].width, params[3].height);
		//myGameArea.canvas.removeEventListener('click', estIntérieurIngrédient);
		clone.push(params[3]);
		params[3]="";
	}
	if (clone.length == 4) {
		myGameArea.clear();
		params=null;
		myGameArea.context.font = "20px Montserrat";
		myGameArea.context.fillStyle = "#ffdf23";
		myGameArea.context.fillText("Bravo, vous avez fait un délicieux burger !", 150, 100);

		myGameArea.context.drawImage(burger, 250,80,200,200);
		myGameArea.context.beginPath();
		myGameArea.context.rect(150,250,420,100);
		myGameArea.context.fillStyle = '#ffdf23';
		myGameArea.context.fill();
		myGameArea.context.closePath();

		rectSuivant = {
			x:150,
			y:250,
			width:420,
			height:100
		};

		myGameArea.context.font = "20px Montserrat";
		myGameArea.context.fillStyle = "#000000";
		myGameArea.context.fillText("Commande suivante !", 250, 305);

		if(mousePos.x >= rectSuivant.x && mousePos.x <= rectSuivant.x+rectSuivant.width && mousePos.y <= rectSuivant.y+rectSuivant.height && mousePos.y >= rectSuivant.y) {

			myGameArea.canvas.removeEventListener('click', estIntérieurIngrédient);
			clone = [];
			Main();
		}
		

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