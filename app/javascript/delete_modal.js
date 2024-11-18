document.addEventListener("DOMContentLoaded", () => {
  const modalDelete = document.getElementById("delete-modal");
  const openButtonDelete = document.getElementById("delete-button");
  const closeButtonDelete = document.getElementById("modal-cancel");

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