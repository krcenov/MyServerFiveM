var radiohits = document.getElementById("hits-radiobtn");
var radiofolk = document.getElementById("folk-radiobtn");
var hits = new Audio('http://kida6a.eu:8/radio');
var audio = new Audio();
var chalga = new Audio('http://kida6a.eu:8/chalga');
var Playbtn = document.getElementById("play-btn");
var btnstate = new Boolean();
var radiostate = new Boolean(true);
Playbtn.onclick = function() {RefreshButton();};
radiohits.onclick = function() {radiofolk.checked=false; refreshradiobtn();};
radiofolk.onclick = function() {radiohits.checked=false; refreshradiobtn();};
Playbtn.style.cursor = 'pointer';
radiohits.checked = true;
refreshradiobtn();

function refreshradiobtn()
{
	if(radiohits.checked)
	{
		radiostate = true;
		btnstate = true;
		audio = chalga;
		audio.pause();
		audio = hits;
		audio.play();
		RefreshButton();
		var val = document.getElementById("vol-control").value;
		SetVolume(val);
	}
	else
	{
		radiostate = false;
		btnstate = true;
		audio = hits;
		audio.pause();
		audio = chalga;
		audio.play();
		RefreshButton();
		var val = document.getElementById("vol-control").value;
		SetVolume(val);
	}
};

function RefreshButton() 
{
	if (btnstate) 
	{
		audio.play();
		btnstate = false;
		Playbtn.style.backgroundImage = 'url(pause.png)';
	}
	else
	{
		audio.pause();
		btnstate = true;
		Playbtn.style.backgroundImage = 'url(play.png)';
	}
};

function SetVolume(val)
{
    var player = audio;
    player.volume = val / 100;
};

function titlesupdate(radio)
{
	if(radio === true)
	{
		$.SHOUTcast({
		host : '95.87.206.126',
		port : 8
		}).stats(function(){
		$('#nextsongtitle').text("Next song: "+this.get('nexttitle'));
		$('#songtitle').text("Current song: "+this.get('songtitle'));
		});
	}
	else if(radio === false)
	{
		$.SHOUTcast({
		host : '95.87.206.126',
		port : 8,
		stream : 2
		}).stats(function(){
		$('#nextsongtitle').text("Next song: "+this.get('nexttitle'));
		$('#songtitle').text("Current song: "+this.get('songtitle'));
		});
	}
};

window.setInterval(function(){titlesupdate(radiostate)}, 1000);