function fetchCharacters(characterId) {
  fetch(`https://rickandmortyapi.com/api/character/${characterId}`)
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response not OK");
      }
      return response.json();
    })

    .then((data) => {
      if (characterId) {
        renderCharacterDetails(data);
      } else {
        renderCharactersCollection(data);
      }
    })

    .catch((error) => {
      console.error(error);
    });
}

function renderCharactersCollection(data) {
  data.results.forEach(function (character) {
    var $cardLink = $("<a></a>", {
      href: "character_card.html?characterId=" + character.id,
    });

    var $cardDiv = $("<div></div>", {
      class: "child card",
    });

    var $cardImage = $("<img>", {
      src: character.image,
      alt: character.name,
    });

    var $cardHeader = $("<h3></h3>", {
      text: character.name,
    });

    $cardDiv.append($cardImage).append($cardHeader);
    $cardLink.append($cardDiv);
    $("#cards_container").append($cardLink);
  });
}

function renderCharacterDetails(data) {
  var $characterHeader = $("<h2></h2", {
    text: data.name,
  });

  var $characterImage = $("<img>", {
    src: data.image,
    alt: data.name,
  });

  var $characterList = $("<ul></ul>");
  var $statusItem = $("<li><strong>Status:</strong> " + data.status + "</li>");
  var $speciesItem = $(
    "<li><strong>Species:</strong> " + data.species + "</li>"
  );
  var $originItem = $(
    "<li><strong>Status:</strong> " + data.origin.name + "</li>"
  );
  $characterList.append($statusItem);
  $characterList.append($speciesItem);
  $characterList.append($originItem);

  $("#character_container").append($characterHeader);
  $("#character_container").append($characterImage);
  $("#character_container").append($characterList);
}

$(document).ready(function () {
  const page = window.location.pathname.split("/").pop();
  const urlParams = new URLSearchParams(window.location.search);
  const characterId = urlParams.get("characterId");

  if (page == "character_card.html" && characterId) {
    fetchCharacters(characterId);
  } else {
    fetchCharacters("");
  }
});
