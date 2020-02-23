var countVal = 0;
 var myInterval;
 // Active
 window.addEventListener('focus', startTimer);

 // Inactive
 window.addEventListener('blur', stopTimer);

 function timerHandler() {
  countVal++;
     return countVal;
  //document.getElementById("seconds").innerHTML = count;
 }

 // Start timer
 function startTimer() {
  console.log('focus');
  myInterval = window.setInterval(timerHandler, 1000);
 }

 // Stop timer
 function stopTimer() {
  window.clearInterval(myInterval);
 }

window._map = (function() {
    return {
        getCount: function() {
            return timerHandler();
        }
    };
}());