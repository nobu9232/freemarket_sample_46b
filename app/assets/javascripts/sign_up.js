$(document).on('turbolinks:load', function() {

  //ステップフォームをdisplay:noneで再現
  function transitionContainer($hideNum,$showNum, $h2){
    $(`.signup-container--${$hideNum}`).hide();
    $(`.signup-container--${$showNum}`).show();
    $('h2').text($h2);
  }
  
  //status-bar遷移機能
  function transitionStatusBar(){
    $("li.li--active").find('.status-bar').attr('id', 'status--through');
    $("li.li--active").next().find('.progress-status').attr('id', 'status--through');
    $("li.li--active").next().addClass('li--active');
    $("li.li--active:first").removeClass('li--active');
    $("html,body").scrollTop(0);
  }

  $('.button__third').on('click', function () {
    transitionContainer("third", "fourth","会員登録完了");
    transitionStatusBar();
  });  


// 　formのバリデーション機能

  $('.button__first').on('click',function(){
    var nickname = $('#user_nickname').val();
    var email = $('#user_email').val();
    var password = $('#user_password').val();
    var password_confirmation = $('#user_password_confirmation').val();
    var family_name = $('#user_user_detail_attributes_family_name').val();
    var first_name = $('#user_user_detail_attributes_first_name').val();
    var family_name_kana = $('#user_user_detail_attributes_family_name_kana').val();
    var first_name_kana = $('#user_user_detail_attributes_first_name_kana').val();
    var date_of_birth = $('.date-select__tab').val();
    var nullMessage = `<li class="error-text">入力してください</li>`;
    if ($('#sns')) {
      password = "123456";
      password_confirmation = "123456";
    }
    var passwordLength = password.length< 6 || password.length > 128;
    $('.error-text').remove();
    if(nickname == "" || password == "" || passwordLength || email == "" || password_confirmation == "" || password != password_confirmation){
      if(nickname == "" ){
        $('.error__nickname').append(nullMessage);   
      }   
      if(password == "" ){
        $('.error__password').append(nullMessage);
      } 
      if(passwordLength){
        $('.error__password').append(`<li class="error-text">パスワードは6文字以上128文字以下で入力してください</li>`);
      }
      if(password_confirmation == "" ){
        $('.error__password_confirmation').append(nullMessage);
      } 
      if(password != password_confirmation){
        $('.error__password_confirmation').append(`<li class="error-text">パスワードとパスワード (確認) が一致しません</li>`);
      }
      if(email == ""){
        $('.error__email').append(nullMessage);
      }
      if(family_name == ""){
        $('.error__family_name').append(nullMessage);
      }

      if(first_name == "" ){
        $('.error__first_name').append(nullMessage);
      }
      if(family_name_kana == "" ){
        $('.error__family_name_kana').append(nullMessage);
      }
      if(first_name_kana == "" ){
        $('.error__first_name_kana').append(nullMessage);
      }
      if(date_of_birth == "" ){
        $('.error__date_of_birth').append(nullMessage);
      }
      $("html,body").scrollTop(0);


    } else{
      transitionContainer("first", "second","お届け先住所入力");
      transitionStatusBar();
    }
  });

    $('.button__second').on('click',function(){
      var postal_code = $('#user_user_detail_attributes_postal_code').val();
      var prefecture  = $('#user_user_detail_attributes_prefecture').val();
      var city = $('#user_user_detail_attributes_city').val();
      var address = $('#user_user_detail_attributes_address').val();
      var nullMessage = `<li class="error-text">入力してください</li>`;

      $('.error-text').remove();
      if(postal_code == "" || prefecture == "" || city == "" || address == ""){
        if(postal_code == ""){
          $('.error__postal_code').append(nullMessage);   
        }   
        if(prefecture == "" ){
          $('.error__prefecture').append(nullMessage);
        } 
        if(city == "" ){
          $('.error__city').append(nullMessage);
        } 
        if(address == ""){
          $('.error__address').append(nullMessage);
        }
        $("html,body").scrollTop(0);
  
      } else{
          transitionContainer("second", "third","支払い方法入力");
          transitionStatusBar();
      }
    });

});
