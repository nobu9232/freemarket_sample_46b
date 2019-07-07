$(document).on('turbolinks:load', function() {

  $('#new_user').on('submit',function(){
      var password = $('#user_password').val();
      var email = $('#user_email').val();
      var nullMessage = `<li class="error-text">入力してください</p>`;
      var passwordLength = password.length< 6 || password.length > 128;
      $('li').remove();
      if(password == "" || passwordLength || email == ""){
        if(password == "" ){
          $('.error__password').append(nullMessage);
        } 
        if(passwordLength){
          $('.error__password').append(`<li class="error-text">パスワードは6文字以上128文字以下で入力してください</p>`);
        }
        if(email == ""){
          $('.error__email').append(nullMessage);
        }
        return false;

      } else{
        this.submit();
      }
  });  
});  