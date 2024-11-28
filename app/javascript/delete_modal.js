document.addEventListener("DOMContentLoaded", () => {
  const modalDelete = document.querySelectorAll("#delete-modal");
  const openButtonDelete = document.querySelectorAll("#delete-button");
  const closeButtonDelete = document.querySelectorAll("#modal-cancel");

  // モーダルを開く
  openButtonDelete.addEventListener("click", () => {
    modalDelete.classList.remove("hidden");
  });

  // モーダルを閉じる
  closeButtonDelete.addEventListener("click", () => {
    modalDelete.classList.add("hidden");
  });

  // モーダルの外側をクリックした場合も閉じる
  modalDelete.addEventListener("click", (event) => {
    if (event.target === modalDelete) {
      modalDelete.classList.add("hidden");
    }
  });
});