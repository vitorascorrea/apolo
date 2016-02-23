$(document).ready(
    function() {
        if(gon.status == 'Finalizado'){
        	
        }else{
	        setInterval(function() {
	            $('#principal').load(location.href + " #principal");
	        }, 10000);
        }
});