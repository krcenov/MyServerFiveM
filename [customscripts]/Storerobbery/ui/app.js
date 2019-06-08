$(function()
{
	$( document ).ready(function() {
	$("#handler").hide();
		window.addEventListener('message', (event) => 
		{
			var item = event.data;
			if (item !== undefined && item.type === "robui") 
			{	
				if (item.display === true) 
				{
					$("div#handler").fadeIn();
    				console.log("It should be seednable");
					$("#handler").delay(9000);
					console.log("Closing the robstore");
					$("div#handler").fadeOut();
				}
				else if (item.display === false) 
				{
					$("div#handler").fadeOut();
					$("div#handler").hide();
				}
			}
		});
		});
});