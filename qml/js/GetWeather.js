function getWeather() {
    var xmlhttp = new XMLHttpRequest();
    var url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20%3D%2091888417&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";

    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var response = JSON.parse(xmlhttp.responseText);            
            temperature= Math.round((response.query.results.channel.item.condition.temp-32)/1.8)
            var weatherSource= response.query.results.channel.item.description
            var begin= weatherSource.indexOf('http://')
            var end= weatherSource.indexOf('.gif')
            weatherImageSource= weatherSource.substring(begin, end+4)

            t1Text= response.query.results.channel.item.forecast[1].day +", "
            t1Text+= response.query.results.channel.item.forecast[1].date +"\n"
            t1Text+= response.query.results.channel.item.forecast[1].text +"  "
            t1Text+= Math.round(response.query.results.channel.item.forecast[1].low-32)/1.8 +"~" +Math.round(response.query.results.channel.item.forecast[1].high-32)/1.8
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
