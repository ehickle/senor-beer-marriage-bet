

function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response.status);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLginStatus().
  if (response.status === 'connected') {
    var token = response.authResponse.accessToken
    FB.api('/me', {fields: 'first_name'} , function(resp) {
      console.log(JSON.stringify(resp));
     $.post('/users', resp)
     .done( function(response) {
      console.log(response)
      })
    })
  } else {
    // The person is not logged into your app or we are unable to tell.
    console.log('no')
  }
}

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }



(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.9&appId=1909757332598209";
        fjs.parentNode.insertBefore(js, fjs);
} (document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function() {
    FB.init({
      appId      : '1909757332598209',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
};

$('nav').on('click','#logout', function() {
  $.get('/logout')
  FB.logout(function(response) {
    console.log('logged out')
  });
});




