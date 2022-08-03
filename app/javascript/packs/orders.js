$(document).ready(function() {
    var weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];

    $("#order_delievery_date").change(function(){
        console.log('change detected');
        var selected_date = new Date(this.value);
        day = weekday[selected_date.getDay()];
        $('#delievery_day').text(day);
    });
});