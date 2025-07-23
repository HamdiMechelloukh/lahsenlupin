document.addEventListener("DOMContentLoaded", function () {
    const lazyBackgrounds = document.querySelectorAll('.lazy-bg');

    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const bg = entry.target.getAttribute('data-bg');
          entry.target.style.backgroundImage = `url(${bg})`;
          observer.unobserve(entry.target);
        }
      });
    });

    lazyBackgrounds.forEach(bg => observer.observe(bg));
  });


  Array.from(document.querySelectorAll('*')).forEach(el => {
  if (el.offsetWidth > document.documentElement.clientWidth) {
    el.style.border = '2px solid yellow';
    console.log('⬆️ Element too wide:', el);
  }
});
