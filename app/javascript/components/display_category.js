const display_category = () => {
  const new_article = document.getElementById('new-article');
  if(new_article) {
    const new_category_link = document.getElementById('new-category-link');
    const new_category_form = document.getElementById('new-category-form');

    new_category_link.addEventListener('click', (event) => {
      new_category_form.classList.toggle('d-none')
    });
  }
};

export { display_category };
