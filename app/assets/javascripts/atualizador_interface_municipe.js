$(document).ready(
    function() {
        setInterval(function() {
            $('#principal').load(location.href + " #principal");
        }, 10000);
});