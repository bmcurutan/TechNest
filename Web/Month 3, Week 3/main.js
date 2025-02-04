let characters = [];

function fetchCharacters(characterId, pageNum = "") {
  fetch(`https://rickandmortyapi.com/api/character/${characterId}?page=${pageNum}`)
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
        characters = data.results;
        renderPages(pageNum, data.info.pages)
        renderCharactersCollection(data.results);
      }
    })

    .catch((error) => {
      console.error(error);
    });
}

function renderPages(currentPage, totalPages) {
  let curr = Number(currentPage) // Convert string to number

  if (curr > 1) {
    const $backLink = $("<a>")
        .html("&lt; Back") 
        .attr("href", "index.html?page=" + (curr - 1)); 
    $("#pages").append($backLink);
  }

  // for (let page = 1; page <= totalPages; page++) {
  //   const $pageLink = $("<a>")
  //       .html(page) 
  //       .attr("href", "index.html?page=" + page); 
  //   $("#pages").append($pageLink);
  // }

  if (curr < totalPages) {
    const $nextLink = $("<a>")
        .html("Next &gt;") 
        .attr("href", "index.html?page=" + (curr + 1)); 
    $("#pages").append($nextLink);
  } 
}

function renderCharactersCollection(results) {
  $("#results_container").empty(); // Reset previous results
  
  results.forEach(function (character) {
    const $cardLink = $("<a></a>", {
      href: "character_card.html?characterId=" + character.id,
    });

    const $cardDiv = $("<div></div>", {
      class: "child card",
    });

    const $cardImage = $("<img>", {
      src: character.image,
      alt: character.name,
    });

    const $cardHeader = $("<h3></h3>", {
      text: character.name,
    });

    $cardDiv.append($cardImage).append($cardHeader);
    $cardLink.append($cardDiv);
    $("#results_container").append($cardLink);
  });
}

function renderCharacterDetails(data) {
  const $characterHeader = $("<h2></h2", {
    text: data.name,
  });

  const $characterImage = $("<img>", {
    src: data.image,
    alt: data.name,
  });

  const $characterList = $("<ul></ul>");
  const $statusItem = $("<li><strong>Status:</strong> " + data.status + "</li>");
  const $speciesItem = $(
    "<li><strong>Species:</strong> " + data.species + "</li>"
  );
  const $originItem = $(
    "<li><strong>Status:</strong> " + data.origin.name + "</li>"
  );
  $characterList.append($statusItem);
  $characterList.append($speciesItem);
  $characterList.append($originItem);

  $("#character_container").append($characterHeader, $characterImage, $characterList);
}

if (typeof window !== "undefined") {
  $(document).ready(function () {
    const page = window.location.pathname.split("/").pop();
    const urlParams = new URLSearchParams(window.location.search);
    const characterId = urlParams.get("characterId");
    const pageNum = urlParams.get("page");

    if (page === "character_card.html" && characterId) {
      fetchCharacters(characterId, 1);
    } else {
      fetchCharacters("", pageNum);
    }

    $("#search_bar").on("input", () => {
      // Search query is not case sensitive and allows partial name matching
      // Clear the search bar to reset the results
      const query = $("#search_bar").val().toLowerCase();
      const filteredCharacters = characters.filter((character) =>
        character.name.toLowerCase().includes(query)
      );
      renderCharactersCollection(filteredCharacters); // Update the displayed results
    });
  });
}

module.exports = { renderPages, renderCharacterDetails };