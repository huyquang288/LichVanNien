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

            tt3Text= "Thời tiết\n\tNhiệt độ:"
            tt3Text+= (Math.round((response.query.results.channel.item.forecast[0].low-32)/1.8) +"~" +Math.round((response.query.results.channel.item.forecast[0].high-32)/1.8) +"°C\n\t")
            tt3Text+= ("Độ ẩm: " +response.query.results.channel.atmosphere.humidity +"%\n\t")
            tt3Text+= ("Tầm nhìn xa: ~" +Math.round(response.query.results.channel.atmosphere.visibility/0.6214) +"km\n\t")
            tt3Text+= ("Mặt trời mọc: " +response.query.results.channel.astronomy.sunrise +"\n\t")
            tt3Text+= ("Mặt trời lặn: " +response.query.results.channel.astronomy.sunset)
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
