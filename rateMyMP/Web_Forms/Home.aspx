<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Web_Forms_Home" %>

<!DOCTYPE html>

<html lang="en">
  
  <head>
    <meta charset="utf-8" />
        <title>Welcome to Rate My MP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Limelight|Flamenco|Federo|Yesteryear|Josefin Sans|Spinnaker|Sansita One|Handlee|Droid Sans|Oswald:400,300,700" media="screen" rel="stylesheet" type="text/css" />
    <link href="/Web_Forms/CSS/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="/Web_Forms/CSS/bootstrap-responsive.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="/Web_Forms/CSS/common.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="/Web_Forms/CSS/fontawesome.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="/Web_Forms/CSS/project.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="/Web_Forms/CSS/indexStyle.css" media="screen" rel="stylesheet" type="text/css" />
    <!-- Typekit fonts require an account and a kit containing the fonts used. see https://typekit.com/plans for details. <script type="text/javascript" src="//use.typekit.net/YOUR_KIT_ID.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
-->
 

  <script src="https://apis.google.com/js/client.js"></script>
      
      <!-- this is a script for google login -->
<script type="text/javascript">
    (function () {
        var po = document.createElement('script');
        po.type = 'text/javascript';
        po.async = true;
        po.src = 'https://apis.google.com/js/client:plusone.js?onload=render';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(po, s);
    })();

    function render() {
        gapi.signin.render('googlesignup', {
            'callback': 'signinCallback',
            'approvalprompt': 'force',
            'clientid': '1098020128859-hipo9jis3pjfocmlrk9v83vqs1dod7uh.apps.googleusercontent.com',
            'cookiepolicy': 'single_host_origin',
            'height': 'short',
            'requestvisibleactions': 'http://schemas.google.com/AddActivity',
            'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile'
        });
    }

    function signinCallback(authResult) {
        if (authResult) {
            if (authResult['access_token']) {
                // Successfully authorized
                // Hide the sign-in button now that the user is authorized, for example:
                gapi.auth.setToken(authResult);
                // document.getElementById('customBtn').setAttribute('style', 'display: none');
                // document.getElementById('logout').setAttribute('style', 'display: block');
                getemail();

            }
            else if (authResult['error']) {
                // There was an error.

            }
        }
    }
    function getemail() {

        gapi.client.load('oauth2', 'v2', function () {

            var request = gapi.client.oauth2.userinfo.get();

            request.execute(getEmailCallback);
        });

        // this is used for image also. 

        // gapi.client.load('plus', 'v1', function () {
        //    var request = gapi.client.plus.people.get({
        //        'userId': 'me'
        //    });
        //    request.execute(function (resp) {
        //        // console.log('Retrieved profile for:' + resp.displayName);
        //        alert(resp.displayName);
        //        // alert(resp.email);
        //       // alert(Object.keys(resp));
        //    });
        //});

    }

    function getEmailCallback(obj) {
        //alert(Object.keys(obj));
        // Here obj stores data in json format
        var email = '';
        var name = '';
        if (obj['email']) {

            email = obj['email'];
        }

        if (obj['name']) {

            name = obj['name'];
        }
        var socialtype = "GOOGLE";
        var social = "yes";
        document.location.href = "test.aspx?email=" + email + "&name=" + name + "&social=" + social + "&socialType=" + socialtype;
    }
  </script>
      
         
            
  </head>
  <body>
      <form id="form1" runat="server">
              <div id="page-wrapper">
      <div id="absolute-wrapper">
        <div class="rectangle rectangle-1 rectangle-2 rectangle-4">
          <div class="rectangle rectangle-1 rectangle-2 rectangle-3">
            <div class="page-header">
              <h1>Rate My MP</h1>
            </div>
          
              <asp:LinkButton ID="btnSingin" class="btn btn-1" runat="server" OnClick="btnSingin_Click"><i class="icon icon-signin"></i>Login</asp:LinkButton>
              <asp:RegularExpressionValidator ID="signinPasswordValidation" runat="server" ErrorMessage="Password must have 8 character" ControlToValidate="signinPassword" SetFocusOnError="False" ValidationExpression="\w{8,40}" Display="Dynamic" ForeColor="#FF0066"></asp:RegularExpressionValidator> 
              
              <asp:TextBox ID="signinPassword"  class="textinput textinput-1 textinput-3" placeholder="password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="signinEmailValidation" class="textinput textinput-1 textinput-3" runat="server" ErrorMessage="Please enter valid email id" ControlToValidate="signinemail" ForeColor="#FF0066" SetFocusOnError="True" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                <asp:TextBox ID="signinemail" class="textinput textinput-2 textinput-4" placeholder="email" runat="server"></asp:TextBox>
               <h1 class="heading heading-1 heading-2 heading-3">Raise Your Voice</h1> <!-- Engage Your Representatives  -->
            <a class="dom-link" href="#">Forget your password ?</a>
            <label class="checkbox">
             
                <asp:CheckBox ID="chkRememberMe" runat="server" />
              <span>Remember me</span>
            </label>
             
          </div>
          <div class="rectangle rectangle-5"></div>
           <!-- division for facebook signup button -->

                <!-- facebook login script-->
           <div id="fb-root"></div> 
      <script type="text/javascript" src="/Web_Forms/JS/fb.js"></script>
      <script src="http://connect.facebook.net/en_US/all.js" type="text/javascript"></script>

      <script>

          // Init the SDK upon load
          window.fbAsyncInit = function () {
              FB.init({
                  appId: '421695167935164', // App ID  214812398681584
                  channelUrl: '//' + window.location.hostname + '/channel', // Path to your Channel File
                  status: true, // check login status
                  cookie: true, // enable cookies to allow the server to access the session
                  xfbml: true  // parse XFBML

              });
          };

          // Load the SDK Asynchronously

          (function (d) {
              var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
              if (d.getElementById(id)) { return; }
              js = d.createElement('script'); js.id = id; js.async = true;
              js.src = "//connect.facebook.net/en_US/all.js";
              ref.parentNode.insertBefore(js, ref);
          }(document));


          function login() {

              FB.login(function (response) {
                  // if (response.authResponse) {
                  //'/me',
                  FB.api('/me', function (response) {
                      if (response.name) {
                          // alert(Object.keys(response));


                          var name = "";
                          var email = "";
                          var social = "yes";

                          var socialtype = "FACEBOOK";
                          name = response.name;

                          email = response.email;
                         // alert(email);
                          // username = response.username 
                          if (email == undefined) {
                              alert("Please allow access to email.");
                              FB.logout(function () {
                                  window.location.reload();
                                  document.location.href = "Home.aspx";

                              });


                          }
                          else {
                             // alert(email);
                              document.location.href = "test.aspx?email=" + email + "&name=" + name + "&social=" + social + "&socialType=" + socialtype;
                             // document.location.href = "test.aspx?emailsval=" + email + "&nameval=" + name + "&socialornot=" + social + "&socialtype=" + socialtype;
                          }
                      }
                      // }

                  })

              }, { scope: 'email' });
          }

      </script>
            <div id="facebooksingup" class="btn btn-2 btn-3 btn-4" onclick="login()" ><i class="icon icon-facebook-sign"></i> Connect w/ facebook</div>
            <!-- division for google signup button -->
            <div id="googlesignup" class="btn btn-2 btn-3 btn-5" ><i class="icon icon-google-plus-sign"></i> Connect w/ Google</div>
            <h1 class="heading heading-2 heading-4 heading-6">OR create a Rate My MP account below</h1>
            <asp:TextBox ID="lastName" class="textinput textinput-3 textinput-5 textinput-6 textinput-9"  placeholder="Last Name" runat="server"></asp:TextBox>
         <input name="" class="textinput textinput-4 textinput-5 textinput-6 textinput-7" type="text" placeholder="First Name">
         <asp:TextBox ID="firstName" class="textinput textinput-4 textinput-5 textinput-6 textinput-7"  placeholder="First Name" runat="server"></asp:TextBox>
         <asp:TextBox ID="password"  class="textinput textinput-3 textinput-5 textinput-7 textinput-8"  placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="email" class="textinput textinput-4 textinput-5 textinput-7 textinput-8" placeholder="Email" runat="server"></asp:TextBox>

<i class="icon icon-user"></i>
<i class="icon icon-lock"></i>

          <button class="btn btn-1 btn-2">Sign Up <i class="icon icon-share-alt"></i> </button>
             <asp:LinkButton ID="btnSignup" class="btn btn-1 btn-2" runat="server" OnClick="btnSignup_Click">Sign Up <i class="icon icon-share-alt"></i></asp:LinkButton>
          <div class="rectangle rectangle-1 rectangle-3 rectangle-6">
            <h1 class="heading heading-3 heading-4 heading-5 heading-7">© 2013 Rate My MP&nbsp; |&nbsp; <a href="#"> Terms &amp; Privacy</a>
              <br>
            </h1>
            <h1 class="heading heading-1 heading-3 heading-4 heading-5"><a href="#">About Us</a>&nbsp; |&nbsp; <a href="#">Our Mission</a>&nbsp; |&nbsp; <a href="#">Contact Us</a>
              <br>
            </h1>
<a href="https://facebook.com"><i class="icon icon-facebook-sign"></i></a>

<a href="https://gmail.com"><i class="icon icon-google-plus-sign"></i></a>

<a href="https://twitter.com"><i class="icon icon-twitter-sign"></i></a>
          </div>
           
        </div>
      </div>
    </div>
          </form>
  </body>

</html>
