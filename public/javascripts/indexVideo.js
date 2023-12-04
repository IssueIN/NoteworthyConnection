// document.addEventListener('DOMContentLoaded', (event) => {
//   const video = document.getElementById('indexVideo');

//   video.addEventListener('mouseenter', function (e) {
//       if (video.paused) {
//           video.play();
//       }
//   });
// });

document.addEventListener("DOMContentLoaded", function() {
  var video = document.getElementById("indexVideo");

  // Check if video can play, and play it
  video.oncanplaythrough = function() {
      video.muted = true; // Mute the video (required by some browsers for autoplay)
      video.play();
  };

  video.loop = true; // Ensure the video loops
});
