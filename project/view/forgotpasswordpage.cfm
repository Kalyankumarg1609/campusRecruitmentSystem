
<!--- forgot password page  --->
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
    <link rel="stylesheet" href="../css/forgotpassword.css">
    <link rel="shortcut icon" href="#">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/forgotpasswordpage.js"></script>
  </head>
  <body>
      <div class="container">
        <div class="content-contenaire">
          <div class="top-container">
            <h2> Forgot Password </h2> 
          </div>
          <form>
            <div class="input">      
              <input type="email" placeholder= "enter your Email" id='email' autocomplete="off">
              <span class="error" id="emailError"></span>
              <button type="button" class="btn btn-primary" id="forgot">submit</button>
            </div>
          </form> 
        </div>
      </div>   
  </body>
</html>