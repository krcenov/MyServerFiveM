OBEY9FCoupeBuybtnClickable();
function OBEY9FCoupeBuybtnClickable() {
	OBEY9FCoupeBuybtn = document.getElementById('OBEY9FCoupeBuybtn');
	OBEY9FCoupeBuybtn.onclick = function() 
	{
		$.post('http://cardealership/obey9fcoupebuy', JSON.stringify({}));
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
				$('#ShopFrame').css('display','block');
			}
			else if (item.hide == true) 
			{
				$('#ShopFrame').css('display','none');
			}
		}
	});
});
document.onkeyup = function (data) 
{
    if (data.which == 27) {
        $.post('http://cardealership/NUIFocusOff', JSON.stringify({}));
    }
};
