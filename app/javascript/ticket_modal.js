document.addEventListener("DOMContentLoaded", () => {
  const modalTicket = document.getElementById("ticket-modal");
  const openButtonTicket = document.getElementById("ticket-button");
  const closeButtonTicket = document.getElementById("modal-cancel");
  const errorDiv = document.getElementById("comment-error");
  const submitButton = document.getElementById("submit-button");
  const commentField = document.getElementById("comment-field");

  // モーダルを開く
  openButtonTicket.addEventListener("click", () => {
    modalTicket.classList.remove("hidden");
  });

  // モーダルを閉じる
  closeButtonTicket.addEventListener("click", () => {
    modalTicket.classList.add("hidden");
  });

  // モーダルの外側をクリックした場合も閉じる
  modalTicket.addEventListener("click", (event) => {
    if (event.target === modalTicket) {
      modalTicket.classList.add("hidden");
    }
  });

  // 送信ボタンを押したら、コメントが50文字以内かをチェックする
  submitButton.addEventListener("click", (event) => {
    const commentLength = commentField.value.length;

    if (commentLength > 50) {
      event.preventDefault();
      errorDiv.classList.remove('hidden');
    } else {
      errorDiv.classList.add('hidden');
    }
  });
});
