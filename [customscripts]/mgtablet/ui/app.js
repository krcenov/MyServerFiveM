var playerlistring = "";
var res;
var contentcodebydefault = "";
var Slot1 = document.getElementById("Slot1");
var Slot2 = document.getElementById("Slot2");
var Slot3 = document.getElementById("Slot3");
var playerlistcode = "<table style='width:100%;height:100%;text-align:center;' border=1 bordercolor=”red”> <tr> <th>Playerlist</th> </tr> <tr> <td id='PlayerSlot0'></td> </tr> <tr> <td id='PlayerSlot1'></td> </tr> <tr> <td id='PlayerSlot2'></td> </tr> <tr> <td id='PlayerSlot3'></td> </tr> <tr> <td id='PlayerSlot4'></td> </tr> <tr> <td id='PlayerSlot5'></td> </tr> <tr> <td id='PlayerSlot6'></td> </tr> <tr> <td id='PlayerSlot7'></td> </tr> <tr> <td id='PlayerSlot8'></td> </tr> <tr> <td id='PlayerSlot9'></td> </tr> <tr> <td id='PlayerSlot10'></td> </tr> <tr> <td id='PlayerSlot11'></td> </tr> <tr> <td id='PlayerSlot12'></td> </tr> <tr> <td id='PlayerSlot13'></td> </tr> <tr> <td id='PlayerSlot14'></td> </tr> <tr> <td id='PlayerSlot15'></td> </tr> <tr> <td id='PlayerSlot16'></td> </tr> <tr> <td id='PlayerSlot17'></td> </tr> <tr> <td id='PlayerSlot18'></td> </tr> <tr> <td id='PlayerSlot19'></td> </tr> <tr> <td id='PlayerSlot20'></td> </tr> <tr> <td id='PlayerSlot21'></td> </tr> <tr> <td id='PlayerSlot22'></td> </tr> <tr> <td id='PlayerSlot23'></td> </tr> <tr> <td id='PlayerSlot24'></td> </tr> <tr> <td id='PlayerSlot25'></td> </tr> <tr> <td id='PlayerSlot26'></td> </tr> <tr> <td id='PlayerSlot27'></td> </tr> <tr> <td id='PlayerSlot28'></td> </tr> <tr> <td id='PlayerSlot29'></td> </tr> <tr> <td id='PlayerSlot30'></td> </tr> <tr> <td id='PlayerSlot31'></td> </tr> </table>";
$( document ).ready(function() 
{
	Slot1 = document.getElementById("Slot1");
	window.addEventListener( 'message', function( event )
	{
		var item = event.data;
		if(item.playerliststring != undefined)
		{
			console.log(item.playerliststring);
			playerlistring = item.playerliststring;
			res = playerlistring.split(",");
		}
		if (item.type == "tabletui") 
		{
			if (item.display == true) 
			{
				$('#TabletBody').css('display','block');
				contentcodebydefault = document.getElementById('Content').innerHTML;
			}
			else if (item.hide == true) 
			{
				$('#TabletBody').css('display','none');
			}
		}
	});
});
document.onkeyup = function (data) 
{
    if (data.which == 27) {
        $.post('http://mgtablet/NUIFocusOff', JSON.stringify({}));
    }
};
function Slot1Clickable() {
	Slot1 = document.getElementById('Slot1');
	Slot1.onclick = function() 
	{
		contentcode = document.getElementById("Content").innerHTML;
		$.post('http://mgtablet/SendPlayerList', JSON.stringify({}));
		document.getElementById("Content").innerHTML = playerlistcode;
		for (var i = 0; i < res.length; i++) 
		{
			document.getElementById("PlayerSlot"+i).innerHTML = res[i];
		}
	};
}
function Slot2Clickable() {
	Slot2 = document.getElementById('Slot2');
	Slot2.onclick = function() 
	{
		contentcode = document.getElementById("Content").innerHTML;
		document.getElementById("Content").innerHTML = "";
		document.getElementById("Content").style.backgroundImage = "url('../ui/rulesbg.png')";
		document.getElementById("Content").style.backgroundSize = "100% 100%";
		
	};
}
function Slot3Clickable() {
	Slot3 = document.getElementById('Slot3');
	Slot3.onclick = function() 
	{
		contentcode = document.getElementById("Content").innerHTML;
		document.getElementById("Content").innerHTML = "";
		document.getElementById("Content").style.backgroundImage = "url('../ui/featuresbg.png')";
		document.getElementById("Content").style.backgroundSize = "100% 100%";
		
	};
}
BackButton.onclick = function() 
{
	document.getElementById("Content").style.backgroundImage = "url('')";
    document.getElementById("Content").innerHTML = contentcode;
	if(contentcode == contentcodebydefault)
	{
		Slot1Clickable();
		Slot2Clickable();
		Slot3Clickable();
	}
};
HomeButton.onclick = function() 
{
    document.getElementById("Content").innerHTML = contentcodebydefault;
	document.getElementById("Content").style.backgroundImage = "url('')";
	Slot1Clickable();
	Slot2Clickable();
	Slot3Clickable();
};
function startTime() 
{
	var today = new Date().toUTCString();
	var time = today.substring(17,22);
	document.getElementById('Clock').innerHTML = time;
	var t = setTimeout(startTime, 500);
}
function checkTime(i) 
{
  if (i < 10) {i = "0" + i};
  return i;
}
Slot1Clickable();
Slot2Clickable();
Slot3Clickable();
