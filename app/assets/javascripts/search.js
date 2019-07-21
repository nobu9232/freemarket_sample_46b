
// 価格検索のプルダウン機能
function priceSearch() {
  var value = document.getElementById("input-price").value;
  var result = value.split('-');
  document.getElementById( "min" ).value = result[0] ;
  document.getElementById( "max" ).value = result[1] ;
}

// チェックボックスの全選択機能
$(function() {
  $('#all-condition').on('click', function() {
    $("input[name='q[condition_in][]']").prop('checked', this.checked);
  });
});