document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.getElementById("menu-toggle");
  const menu = document.getElementById("menu");

  menuToggle.addEventListener("click", () => {
    menu.classList.toggle("max-sm:hidden");
  });
  menuToggle.addEventListener("touchstart", () => {
    menu.classList.toggle("max-sm:hidden");
  });
});