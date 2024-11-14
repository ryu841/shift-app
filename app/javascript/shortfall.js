document.addEventListener('DOMContentLoaded', function () {
  const addButton = document.getElementById('add-menu-button');
  const shortfallsContainer = document.getElementById('shortfalls');
  
  // 既存のフォームフィールドをテンプレートとして取得
  const shortfallTemplate = document.getElementById('shortfalltemplate').outerHTML;

  // IDが同じにならないようにするための初期インデックス
  let shortfallIndex = 1 ;

   // 「募集時間を追加」を押すと、1行追加される
  addButton.addEventListener('click', function () {
    // 新しいフォームを追加
    const newShortfall = document.createElement('div');
    newShortfall.innerHTML = shortfallTemplate;

    // インデックス番号を追加してname属性をユニークにする
    // name="shift[shortfalls_attributes][0][start_time]"の[0]を取り出し、[1]に書き換える
    Array.from(newShortfall.querySelectorAll('input, select')).forEach((input) => {
      input.name = input.name.replace(/\[\d+\]/, `[${shortfallIndex}]`);
      input.id = input.id.replace(/\_\d+\_/, `_${shortfallIndex}_`);
      // hiddenフィールドのvalueを動的に変更
      if (input.type === 'hidden') {
      input.value = '';  // 新規追加なので、IDを空にして新しい値を設定
       }
    });
  
    shortfallsContainer.appendChild(newShortfall);
    shortfallIndex++;
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


