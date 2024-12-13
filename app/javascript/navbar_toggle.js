document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.getElementById("menu-toggle");
  const menu = document.getElementById("menu");

  menuToggle.addEventListener("click", () => {
    menu.classList.toggle("max-sm:hidden");
  });
  menuToggle.addEventListener("touchstart", function(event) {
    event.preventDefault();
    menu.classList.toggle("max-sm:hidden");
  });
});