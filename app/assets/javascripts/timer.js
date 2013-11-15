jQuery(document).ready(function(){

  endTime = new Date(2013, 10, 30);
  var days  = 24*60*60,
    hours = 60*60,
    minutes = 60;
    
    function reload_timer(){
      leftTime = Math.floor((endTime - (new Date())) / 1000);
      timerD = Math.floor(leftTime / days);
      leftTime -= timerD*days;
      timerH = Math.floor(leftTime / hours);
      leftTime -= timerH*hours;
      timerM = Math.floor(leftTime / minutes);
      leftTime -= timerM*minutes;
      timerS = leftTime;
      $('.t_d').text(timerD);
      $('.t_h').text(timerH);
      $('.t_m').text(timerM);
      $('.t_s').text(timerS);
    }

  $(function(){
    setInterval(function(){
        reload_timer();
      },1000);
  });

});