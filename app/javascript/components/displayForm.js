const displayForm = () => {
  const newForm = document.getElementById('new-form');
  if(newForm) {
    const link = document.getElementById('new-form-link');
    const form = document.getElementById('new-form-input');

    link.addEventListener('click', (event) => {
      form.classList.toggle('d-none')
    });
  }
};

export { displayForm };
