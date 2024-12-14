document.addEventListener("DOMContentLoaded", () => {
  const openButtonCancel = document.querySelectorAll(`[id^="cancel-button"]`);

  openButtonCancel.forEach(button => {
    const index = button.id.split('-').pop();

    //indexに対応するモーダルを取得
    const modalCancel = document.getElementById(`cancel-modal-${index}`);
    const closeButtonCancel = document.getElementById(`modal-cancel-${index}`);

    // モーダルを開く
    button.addEventListener("click", () => {
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
});