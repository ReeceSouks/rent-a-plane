import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('search-airport');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
