import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('search-airport');
  if (addressInput) {
    places({
      appId: "pl0EV0VR85VD",
      apiKey: "bf28a31df3fd8abfda4464f0b4f80f94",
      container: addressInput
    });
  }
};

export { initAutocomplete };
