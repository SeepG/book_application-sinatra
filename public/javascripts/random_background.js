

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function setProperty() {
  let cards = document.querySelectorAll('.card');
  cards.forEach((card) => {
    const randomInt = getRandomInt(100);
    card.style.backgroundImage = `linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('https://source.unsplash.com/collection/312299/?sig=${randomInt}')`;
  });   
}

setProperty();
