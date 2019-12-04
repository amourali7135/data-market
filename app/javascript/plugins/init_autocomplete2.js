import places from 'places.js';

const initAutocomplete2 = () => {
  const addressInput = document.getElementById('sellers_city');
  if (addressInput) {
    places({
      container: addressInput
    });
  }
};

export {
  initAutocomplete2
};
