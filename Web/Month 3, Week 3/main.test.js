const { JSDOM } = require("jsdom");
const jQuery = require("jquery"); 
const { fetchCharacters, renderPages, renderCharacterDetails } = require("./main"); 

global.fetch = jest.fn(() =>
    Promise.resolve({
      ok: true,
      json: () => Promise.resolve({ results: [], info: { pages: 1 } }),
    })
  );
  
  describe('fetchCharacters', () => {
    afterEach(() => {
      jest.clearAllMocks();
    });
  
    it('calls fetch and handles response with characterId', () => {
      const characterId = 1;
      const pageNum = 2;
  
      fetchCharacters(characterId, pageNum);
  
      expect(fetch).toHaveBeenCalledWith(
        `https://rickandmortyapi.com/api/character/${characterId}?page=${pageNum}`
      );
    });
  
    it('calls fetch and handles response without characterId', () => {
      const pageNum = 2;
  
      fetchCharacters(null, pageNum);
  
      expect(fetch).toHaveBeenCalledWith(
        `https://rickandmortyapi.com/api/character/null?page=${pageNum}`
      );
    });
  });

describe("renderPages", () => {
  let $;

  beforeEach(() => {
    // Set up a mock DOM environment using JSDOM
    const dom = new JSDOM(`<!DOCTYPE html><body><div id="pages"></div></body>`);
    global.document = dom.window.document;
    $ = jQuery(dom.window);
    global.$ = $;
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  test("renders only 'Next >' when on first page", () => {
    renderPages(1, 5); 

    const links = global.$("#pages a");
    expect(links.length).toBe(1);
    expect(links.eq(0).html()).toBe("Next &gt;");
  });

  test("renders '< Back' and 'Next >' when on a middle page", () => {
    renderPages(3, 5); 

    const links = $("#pages a");
    expect(links.length).toBe(2);
    expect(links.eq(0).html()).toBe("&lt; Back");
    expect(links.eq(1).html()).toBe("Next &gt;");
  });

  test("renders only '< Back' when on the last page", () => {
    renderPages(5, 5); 

    const links = $("#pages a");
    expect(links.length).toBe(1);
    expect(links.eq(0).html()).toBe("&lt; Back");
  });

  test("renders nothing when there is only one page", () => {
    renderPages(1, 1); 

    const links = $("#pages a");
    expect(links.length).toBe(0);
  });
});

describe('renderCharacterDetails', () => {
  beforeEach(() => {
    document.body.innerHTML = '<div id="character_container"></div>';
  });

  it('should render character details correctly', () => {
    const data = {
      name: 'Character 1',
      image: 'image1.jpg',
      status: 'Alive',
      species: 'Human',
      origin: { name: 'Earth' }
    };

    renderCharacterDetails(data);
    const header = $('#character_container h2');
    expect(header.text()).toBe('Character 1');

    const image = $('#character_container img');
    expect(image.attr('src')).toBe('image1.jpg');
    expect(image.attr('alt')).toBe('Character 1');

    const listItems = $('#character_container ul li');
    expect(listItems.length).toBe(3);
    expect(listItems[0].textContent).toBe('Status: Alive');
    expect(listItems[1].textContent).toBe('Species: Human');
    expect(listItems[2].textContent).toBe('Status: Earth');
  });
});

// Other test cases to add: fetchCharacters "Network response not OK", renderCharactersCollection
