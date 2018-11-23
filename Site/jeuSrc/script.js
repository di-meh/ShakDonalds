function startGame() {
	myGameArea.start();
}
var myGameArea = {
	canvas: document.getElementById("canvasJeu"),
	start : function() {
		this.canvas.width = 720;
		this.canvas.height = 480;
		this.context = this.canvas.getContext("2d");
		/*
		this.context.font = "50px Montserrat";
		this.context.fillStyle = "#ffdf23";
		this.context.fillText("ShakDonalds Le Jeu", this.canvas.width/6, this.canvas.height/2);
		this.context.font = "20px Montserrat";
		this.context.fillStyle = "#ffdf23";
		this.context.fillText("Coming soon, blyat", this.canvas.width/2.75, this.canvas.height/1.5);
		document.body.insertBefore(this.canvas, document.body.childNodes[0]);
		*/
		}
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