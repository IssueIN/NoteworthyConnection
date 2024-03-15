function nextSlide(rootSelector) {
  const root = document.querySelector(rootSelector);
  const track = root.querySelector('.carousel-track');
  const slides = Array.from(track.children);

  const slideWidth = slides[0].getBoundingClientRect().width;

  const setSlidePosition = (slide, index) => {
    slide.style.left = slideWidth * index + 'px';
  };

  slides.forEach(setSlidePosition);

  const moveToSlide = (track, currentSlide, nextSlide) => {
    track.style.transform = `translateX(-${nextSlide.style.left})`;
    currentSlide.classList.remove('current-slide');
    nextSlide.classList.add('current-slide')
  }

  const autoSliding = () => {
    const currentSlide = track.querySelector('.current-slide');
    const currentIndex = slides.findIndex(slide => slide === currentSlide);
    let nextSlide;
    if (currentIndex === slides.length - 1) {
      nextSlide = slides[0];
    } else {
      nextSlide = currentSlide.nextElementSibling;
    }
    moveToSlide(track, currentSlide, nextSlide)
  }
  setInterval(autoSliding, 5000);
}

nextSlide('.carousel');