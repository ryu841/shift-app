document.addEventListener("DOMContentLoaded", () => {
  const openButtonDelete = document.querySelectorAll(`[id^="delete-button-"]`);

  openButtonDelete.forEach(button => {
    const index = button.id.split('-').pop();

    //indexに対応するモーダルを取得
    const modalDelete = document.getElementById(`delete-modal-${index}`);
    const closeButtonDelete = document.getElementById(`modal-cancel-${index}`);

    // モーダルを開く
    button.addEventListener("click", () => {
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
});