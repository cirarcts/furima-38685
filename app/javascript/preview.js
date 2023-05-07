document.addEventListener("DOMContentLoaded", function () {
  // 新規投稿・編集ページのフォームを取得
  const itemForm = document.getElementById("new_item");
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById("previews");
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!itemForm) return null;
  console.log("preview.jsが読み込まれました");
});