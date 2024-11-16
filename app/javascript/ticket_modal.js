document.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("ticket-modal");
  const openButton = document.getElementById("ticket-button");
  const closeButton = document.getElementById("modal-cancel");

  // モーダルを開く
  openButton.addEventListener("click", () => {
    modal.classList.remove("hidden");
  });

  // モーダルを閉じる
  closeButton.addEventListener("click", () => {
    modal.classList.add("hidden");
  });

  // モーダルの外側をクリックした場合も閉じる
  modal.addEventListener("click", (event) => {
    if (event.target === modal) {
      modal.classList.add("hidden");
    }
  });
});
