document.addEventListener('DOMContentLoaded', function () {
  const addButton = document.getElementById('add-menu-button');
  const shortfallsContainer = document.getElementById('shortfalls');
  
  // 既存のフォームフィールドをテンプレートとして取得
  const shortfallTemplate = document.getElementById('shortfalltemplate').outerHTML;

   // 「募集時間を追加」を押すと、1行追加される
  addButton.addEventListener('click', function () {
    // 新しいフォームを追加
    const newShortfall = document.createElement('div');
    newShortfall.innerHTML = shortfallTemplate;

    // フォームのinput名をユニークに変更
    shortfallsContainer.appendChild(newShortfall);
  });

  // 「募集時間を削除」を押すと、1行削除される
  const removeButton = document.getElementById('remove-menu-button');

  removeButton.addEventListener('click', function () {
    if(shortfallsContainer.children.length > 1) {
      shortfallsContainer.removeChild(shortfallsContainer.lastElementChild);
    } else {
      alert('削除できる募集時間がありません。')
    }
  });
});


