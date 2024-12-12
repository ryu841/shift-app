document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.getElementById("menu-toggle");
  const menu = document.getElementById("menu");

  menuToggle.addEventListener("pointerdown", () => {
    menu.classList.toggle("max-sm:hidden");
  });
});