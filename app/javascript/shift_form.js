document.addEventListener("DOMContentLoaded", () => {
  const commentField = document.getElementById("shift-comment-field");

  //入力中に100文字を超えたらエラーを表示させる
  commentField.addEventListener("input", () => {
    const commentLength = commentField.value.length;
    const errorDiv = document.getElementById("shift-comment-error");

    if (commentLength > 100) {
      errorDiv.classList.remove('hidden');
    } else {
      errorDiv.classList.add('hidden');
    }
  });
});