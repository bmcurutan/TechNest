$(document).ready(function() {
    
    $.getJSON("./characters.json", function(data) {
        data.results.forEach(function(character) {

            var $cardLink = $("<a></a>", {
                href: character.link
            });

            var $cardDiv = $("<div></div>", {
                class: "child card"
            });

            var $cardImage = $("<img>", {
                src: character.image,
                alt: character.name
            });

            var $cardHeader = $("<h3></h3>", {
                text: character.name
            });

            $cardDiv.append($cardImage).append($cardHeader);
            $cardLink.append($cardDiv);
            $("#cards_container").append($cardLink);
        });

    }).fail(function() {
        console.error("Error loading JSON");
    });
});
