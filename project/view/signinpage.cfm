
<!--- signin page  --->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>kiet-recruitment</title>
    <link rel="icon" href="..\media\hiring.png">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/signinpage.css">
    <link rel="shortcut icon" href="#">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/loginpage.js"></script>
  </head>
  <body>
      <cfheader name="expires" value="#Now()#">
      <cfheader name="pragma" value="no-cache, no-store">
      <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
      <div class="container">
        <div class="content-contenaire">
          <div class="top-container">
            <cfif structKeyExists(url,'noaccess')>
              <p class='errorMessage' style='color: red;'>please log in to access the page</p>
            </cfif>
            <h2> Sign In </h2>
            <p> Need an account? <a href="../view/registerhomepage.cfm">Get started!</a></p> 
          </div>
          <form>
            <div class="input">      
              <input type="email" placeholder= "Email" id='email' autocomplete="off">
              <span class="error" id="emailError"></span>
            </div>
            <div class="input">
              <input type="password" placeholder="Password" id="password" autocomplete="new-password">
              <span class="error" id="passwordError"></span>
            </div>
              <button type="button" class="btn btn-primary" id="signin">sign in</button>
          </form> 
          
          <p><a href="forgotpasswordpage.cfm">Forgot password?</a></p>
        </div>
      </div>   
  </body>
</html>