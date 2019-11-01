import places from 'places.js';

const initAutocomplete = () => {
  const addressInput2 = document.getElementById('search-airport2');
  const addressInput = document.getElementById('search-airport');
  if (addressInput2) {
    places({
      appId: "pl0EV0VR85VD",
      apiKey: "bf28a31df3fd8abfda4464f0b4f80f94",
      container: addressInput2
    });
  }
  if (addressInput) {
    places({
      appId: "pl0EV0VR85VD",
      apiKey: "bf28a31df3fd8abfda4464f0b4f80f94",
      container: addressInput
    });
  }
};

export { initAutocomplete };
