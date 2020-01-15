import places from 'places.js';

const initAutocomplete3 = () => {
  const addressInput = document.getElementById('seller_index_search');
  if (addressInput) {
    places({
      container: addressInput
    });
  }
};

export {
  initAutocomplete2
};
