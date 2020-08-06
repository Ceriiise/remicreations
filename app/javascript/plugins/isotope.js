import Isotope from 'isotope-layout';

const isotopeGrid = () => {
  const elem = document.querySelector('.grid');
  if (elem) {
    const iso = new Isotope( elem, {
      itemSelector: '.grid-item',
      percentPosition: true,
      masonry: {
          columnWidth: '.grid-sizer'
      }
    });
    // bind filter button click
    const filtersElem = document.querySelector('.filters-button-group');

    filtersElem.addEventListener( 'click', (event) => {
      const filterValue = event.target.getAttribute('data-filter');
      // use matching filter function
      iso.arrange({ filter: filterValue });
    });

    // change is-checked class on buttons
    const buttonGroups = document.querySelectorAll('.button-group');

    buttonGroups.forEach(( buttonGroup ) => {
      buttonGroup.addEventListener( 'click', ( event ) => {
        buttonGroup.querySelector('.is-checked').classList.remove('is-checked');
        event.target.classList.add('is-checked');
      });
    });
  };
};

export { isotopeGrid };
