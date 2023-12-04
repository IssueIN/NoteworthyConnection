document.addEventListener('DOMContentLoaded', (event) => {
  const video = document.getElementById('indexVideo');

  video.addEventListener('mouseenter', function (e) {
      if (video.paused) {
          video.play();
      }
  });
});
