$(document).ready(function() {
    initialTime = Math.floor((moment(gon.horario) - moment())/1000);
    seconds = initialTime;
});
function timer() {
    var days        = Math.floor(seconds/24/60/60);
    var hoursLeft   = Math.floor((seconds) - (days*86400));
    var hours       = Math.floor(hoursLeft/3600);
    var minutesLeft = Math.floor((hoursLeft) - (hours*3600));
    var minutes     = Math.floor(minutesLeft/60);
    var remainingSeconds = seconds % 60;
    if (remainingSeconds < 10) {
        remainingSeconds = "0" + remainingSeconds; 
    }
    document.getElementById('countdown').innerHTML = days + " dias " + hours + " horas " + minutes + " minutos " + remainingSeconds+ " segundos";
    if (seconds <= 0) {
        clearInterval(countdownTimer);
        document.getElementById('countdown').innerHTML = "Tempo estimado esgotado. Entre em contato com o SFMSP.";
    } else {
        seconds--;
    }
}
var countdownTimer = setInterval('timer()', 1000);