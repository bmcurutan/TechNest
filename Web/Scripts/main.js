const images = [
    "../Assets/rick.jpeg",
    "../Assets/morty.jpeg",
    "../Assets/summer.jpeg",
    "../Assets/beth.jpeg", 
    "../Assets/jerry.jpeg", 
    "../Assets/abadango.jpeg"
]

const headers = [
    "Rick Sanchez",
    "Morty Smith",
    "Summer Smith",
    "Beth Smith",
    "Jerry Smith",
    "Abadango Cluster Princess"
]

$(document).ready(function() {
    $("#image_rick").attr("src", images[0]);
    $("#image_morty").attr("src", images[1]);
    $("#image_summer").attr("src", images[2]);
    $("#image_beth").attr("src", images[3]);
    $("#image_jerry").attr("src", images[4]);
    $("#image_abadango").attr("src", images[5]);

    $("#header_rick").text(headers[0]);
    $("#header_morty").text(headers[1]);
    $("#header_summer").text(headers[2]);
    $("#header_beth").text(headers[3]);
    $("#header_jerry").text(headers[4]);
    $("#header_abadango").text(headers[5]);
});