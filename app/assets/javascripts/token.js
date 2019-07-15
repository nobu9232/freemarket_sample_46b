$(function(){
  $(document).on('click','.payjp', function(e) {
    e.preventDefault();
    Payjp.setPublicKey('pk_test_947d99d606b2fc4591629e0e');
    var card = {
      number: parseInt($(".card-number").val()),
      cvc: parseInt($(".cvc").val()),
      exp_month: parseInt($("#exp_month").val()),
      exp_year: parseInt($("#exp_year").val())
    };
    Payjp.createToken(card, function(status, response) {
        var token = response.id;
        $.ajax({
          url: '/users/card_create',
          type: "POST",
          data: { token: token },
          dataType: 'json',
        })
        .done(function(){
          //非同期通信成功時の処理
          window.location.href="/";
        })
        .fail(function(){
          alert('非同期通信失敗')
        })
    });
  })
})


