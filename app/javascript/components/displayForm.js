const displayForm = () => {
  const newForm = document.getElementById('new-form');
  if(newForm) {
    const link = document.getElementById('new-form-link');
    const text = document.querySelector('#new-form-link p small');
    const form = document.getElementById('new-form-input');

    link.addEventListener('click', (event) => {
      form.classList.toggle('d-none')
      if (text.innerText === "ajouter une catégorie" || text.innerText === "ajoute ta première catégorie") {
        text.innerText = "annuler"
      } else {
        text.innerText = "ajouter une catégorie";
      }
    });
  }
};

export { displayForm };
