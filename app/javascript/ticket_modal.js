document.addEventListener("DOMContentLoaded", () => {
  const openButtonTicket = document.querySelectorAll('[id^="ticket-button-"]');

  openButtonTicket.forEach(button => {
    const index = button.id.split('-').pop();

    //indexに対応するモーダルを取得
    const modalTicket = document.getElementById(`ticket-modal-${index}`);
    const closeButtonTicket = document.getElementById(`modal-cancel-${index}`);

    // モーダルを開く
    button.addEventListener("click", () => {
      modalTicket.classList.remove("hidden");
    });
    button.addEventListener("touchstart", () => {
      modalTicket.classList.remove("hidden");
    });

    // モーダルを閉じる
    closeButtonTicket.addEventListener("click", () => {
      modalTicket.classList.add("hidden");
    });
    closeButtonTicket.addEventListener("touchstart", () => {
      modalTicket.classList.add("hidden");
    });

    // モーダルの外側をクリックした場合も閉じる
    modalTicket.addEventListener("click", (event) => {
      if (event.target === modalTicket) {
        modalTicket.classList.add("hidden");
      }
    });
    modalTicket.addEventListener("touchstart", (event) => {
      if (event.target === modalTicket) {
        modalTicket.classList.add("hidden");
      }
    });

    const commentField = document.getElementById(`comment-field-${index}`);
    //入力中に50文字を超えたらエラーを表示させる
    commentField.addEventListener("input", () => {
      const commentLength = commentField.value.length;
      const errorDiv = document.getElementById(`comment-error-${index}`);

      if (commentLength > 50) {
        errorDiv.classList.remove('hidden');
      } else {
        errorDiv.classList.add('hidden');
      }
    });
  });
});
