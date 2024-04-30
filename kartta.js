var map = L.map('kartta').setView([65.84811, 24.14662], 13);//koordinaatit kartan näkymälle, muoto longitude, latitude

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

L.marker([65, 24]).addTo(map)//missä kohtaa osoitin sijaitsee kartalla, sama toimintaperiaate kuin ylemmällä
    .bindPopup('Kiinteistöhuolto R.Autio')
    .openPopup();