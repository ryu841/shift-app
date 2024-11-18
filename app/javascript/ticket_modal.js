document.addEventListener("DOMContentLoaded", () => {
  const modalTicket = document.getElementById("ticket-modal");
  const openButtonTicket = document.getElementById("ticket-button");
  const closeButtonTicket = document.getElementById("modal-cancel");

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
});
