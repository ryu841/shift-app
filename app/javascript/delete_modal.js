document.addEventListener("DOMContentLoaded", () => {
  const openButtonDelete = document.getElementById("delete-button");

  //indexに対応するモーダルを取得
  const modalDelete = document.getElementById("delete-modal");
  const closeButtonDelete = document.getElementById("modal-cancel");

  // モーダルを開く
  openButtonDelete.addEventListener("pointerdown", () => {
    modalDelete.classList.remove("hidden");
  });

  // モーダルを閉じる
  closeButtonDelete.addEventListener("pointerdown", () => {
    modalDelete.classList.add("hidden");
  });

  // モーダルの外側をクリックした場合も閉じる
  modalDelete.addEventListener("pointerdown", (event) => {
    if (event.target === modalDelete) {
      modalDelete.classList.add("hidden");
    }
  });
});