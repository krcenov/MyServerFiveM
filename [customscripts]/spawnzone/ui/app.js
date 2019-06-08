Spawn1();
Spawn2();
Spawn3();
Spawn4();
Spawn5();
Spawn6();
Spawn7();
Spawn8();
Spawn9();
function Spawn1() {
	Spawn1 = document.getElementById('Spawn1');
	Spawn1.onclick = function() 
	{
		$.post('http://spawnzone/Spawn1', JSON.stringify({}));
	};
}
function Spawn2() {
	Spawn2 = document.getElementById('Spawn2');
	Spawn2.onclick = function() 
	{
		$.post('http://spawnzone/Spawn2', JSON.stringify({}));
	};
}
function Spawn3() {
	Spawn3 = document.getElementById('Spawn3');
	Spawn3.onclick = function() 
	{
		$.post('http://spawnzone/Spawn3', JSON.stringify({}));
	};
}
function Spawn4() {
	Spawn4 = document.getElementById('Spawn4');
	Spawn4.onclick = function() 
	{
		$.post('http://spawnzone/Spawn4', JSON.stringify({}));
	};
}
function Spawn5() {
	Spawn5 = document.getElementById('Spawn5');
	Spawn5.onclick = function() 
	{
		$.post('http://spawnzone/Spawn5', JSON.stringify({}));
	};
}
function Spawn6() {
	Spawn6 = document.getElementById('Spawn6');
	Spawn6.onclick = function() 
	{
		$.post('http://spawnzone/Spawn6', JSON.stringify({}));
	};
}
function Spawn7() {
	Spawn7 = document.getElementById('Spawn7');
	Spawn7.onclick = function() 
	{
		$.post('http://spawnzone/Spawn7', JSON.stringify({}));
	};
}
function Spawn8() {
	Spawn8 = document.getElementById('Spawn8');
	Spawn8.onclick = function() 
	{
		$.post('http://spawnzone/Spawn8', JSON.stringify({}));
	};
}
function Spawn9() {
	Spawn9 = document.getElementById('Spawn9');
	Spawn9.onclick = function() 
	{
		$.post('http://spawnzone/Spawn9', JSON.stringify({}));
	};
}


$( document ).ready(function() 
{
	window.addEventListener( 'message', function( event )
	{
		var item = event.data;
		if (item.type == "shop") 
		{
			if (item.display == true) 
			{
				$("#Spawn1Name").html(item.Spawn1Name);
				$("#Spawn2Name").html(item.Spawn2Name);
				$("#Spawn3Name").html(item.Spawn3Name);
				$("#Spawn4Name").html(item.Spawn4Name);
				$("#Spawn5Name").html(item.Spawn5Name);
				$("#Spawn6Name").html(item.Spawn6Name);
				$("#Spawn7Name").html(item.Spawn7Name);
				$("#Spawn8Name").html(item.Spawn8Name);
				$("#Spawn9Name").html(item.Spawn9Name);
				$('#SpawnMenuFrame').css('display','block');
			}
			else if (item.hide == true) 
			{
				$('#SpawnMenuFrame').css('display','none');
			}
		}
	});
});
document.onkeyup = function (data) 
{
    if (data.which == 27) {
        $.post('http://spawnzone/NUIFocusOff', JSON.stringify({}));
		$('#ShopFrame').css('display','none');
    }
};
