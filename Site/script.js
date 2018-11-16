function startGame() {
	myGameArea.start();
}
var myGameArea = {
	canvas: document.createElement("canvas"),
	start : function() {
		this.canvas.width = 720;
		this.canvas.height = 480;
		this.context = this.canvas.getContext("2d");
		this.context.font = "50px Montserrat";
		this.context.fillStyle = "#ffdf23";
		this.context.fillText("ShakDonalds", this.canvas.height/2.25, this.canvas.height/2);
		document.body.insertBefore(this.canvas, document.body.childNodes[0]);
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