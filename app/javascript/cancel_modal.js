document.addEventListener("DOMContentLoaded", () => {
  const modalCancel = document.getElementById("cancel-modal");
  const openButtonCancel = document.getElementById("cancel-button");
  const closeButtonCancel = document.getElementById("modal-cancel");

  // モーダルを開く
  openButtonCancel.addEventListener("click", () => {
    modalCancel.classList.remove("hidden");
  });

  // モーダルを閉じる
  closeButtonCancel.addEventListener("click", () => {
    modalCancel.classList.add("hidden");
  });

  // モーダルの外側をクリックした場合も閉じる
  modalCancel.addEventListener("click", (event) => {
    if (event.target === modalCancel) {
      modalCancel.classList.add("hidden");
    }
  });
});