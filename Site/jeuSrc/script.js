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

var burger = new Image();
burger.src = "redsquare.jpg";

var rectImage = {
	x:160,
	y:20,
	width: 400,
	height: 400

};

var isInGame = false;

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

		this.canvas.addEventListener('click', function(evt) {
		var mousePos = getMousePos(myGameArea.canvas, evt);
    
			if (isInside(mousePos,rect)) {
				testMain();
		    }

		}, false);

		
		},
	clear : function() {
		this.context.clearRect(0,0,this.canvas.width, this.canvas.height);
	}

}

//Variables du Snake
px=py=10;
gs=tc=20;
ax=ay=15;
xv=yv=0;
trail=[];
tail = 5;



//Main du canvas
function startGame() {
	//joueur =  new Joueur("bonjour");
	myGameArea.start();
}





//Main du jeu

function testMain() {
	myGameArea.clear();

	testMainSnake();
	/*
	myGameArea.context.font = "30px Montserrat";
	myGameArea.context.fillStyle = "#ffdf23";
	myGameArea.context.fillText("Nom : " + joueur.nom, myGameArea.canvas.width/4, myGameArea.canvas.height/5);
	myGameArea.context.fillText("Score : " + joueur.score, myGameArea.canvas.width/4, myGameArea.canvas.height/4);
	myGameArea.context.fillText("Argent : " + joueur.argent, myGameArea.canvas.width/4, myGameArea.canvas.height/3);
	myGameArea.context.fillText("Niveau : " + joueur.niveau, myGameArea.canvas.width/4, myGameArea.canvas.height/2);
	*/

	/*

	//début du jeu
	var context = myGameArea.canvas.getContext("2d");
	//context.drawImage(burger, 160, 20);
	context.beginPath();
	context.rect(160,20,400,400);
	context.fillStyle = '#ffdf23';
	context.fill();
	context.closePath();

	*/

	/*myGameArea.canvas.addEventListener('click', function(evt) {
		var mousePos2 = getMousePos(myGameArea.canvas, evt);
			
		if (isInside(mousePos2,rectImage)) {
			alert('lolol');
			testMain2();
		}

	}, false);
*/
	
}

function testMain2() {
	alert('Lol');
}


/* Test de GameLoop avec un exemple: Snake*/
function testMainSnake() {
    document.addEventListener("keydown",keyPush);
    setInterval(game,1000/15);
}

function game() {
	canv=myGameArea.canvas;
	ctx=myGameArea.context;
    px+=xv;
    py+=yv;
    if(px<0) {
        px= tc-1;
    }
    if(px>tc-1) {
        px= 0;
    }
    if(py<0) {
        py= tc-1;
    }
    if(py>tc-1) {
        py= 0;
    }
    ctx.fillStyle="black";
    ctx.fillRect(0,0,canv.width,canv.height);
 
    ctx.fillStyle="lime";
    for(var i=0;i<trail.length;i++) {
        ctx.fillRect(trail[i].x*gs,trail[i].y*gs,gs-2,gs-2);
        if(trail[i].x==px && trail[i].y==py) {
            tail = 5;
        }
    }
    trail.push({x:px,y:py});
    while(trail.length>tail) {
    trail.shift();
    }
 
    if(ax==px && ay==py) {
        tail++;
        ax=Math.floor(Math.random()*tc);
        ay=Math.floor(Math.random()*tc);
    }
    ctx.fillStyle="red";
    ctx.fillRect(ax*gs,ay*gs,gs-2,gs-2);
}
function keyPush(evt) {
    switch(evt.keyCode) {
        case 37:
            xv=-1;yv=0;
            break;
        case 38:
            xv=0;yv=-1;
            break;
        case 39:
            xv=1;yv=0;
            break;
        case 40:
            xv=0;yv=1;
            break;
    }
}


//Détection de sours à l'intérieur d'un rectangle
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