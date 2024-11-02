
<!--- registeration form page  --->

<!--- getting the role id through url from registeration home page cfm --->
<cfparam name="id" default="-1">
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/Registerationpage.css">
    <link rel="shortcut icon" href="#">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/fontAwesome.js"></script>
    <script src="../js/registerationpage.js"></script>
  </head>

  <body>
    <cfoutput>
      <div class="container">
        <h1>Registration Form</h1>
        <form id="registration-form" >
              <div class="form-group">
                <label for="fname">FirstName:</label>
                <input type="text" id="fname" name="name" autocomplete="username">
                <span id="firstnameError" class="error"></span>
              </div>
              <div class="form-group">
                <label for="lname">LastName:</label>
                <input type="text" id="lname" name="name" autocomplete="username">
                <span id="lastnameError" class="error"></span>
              </div>
              <div class="form-group">
                <label for="contact">Phone:</label>
                <input type="text" id="contact" name="contact">
                <span id="contactError" class="error"></span>
              </div>
              <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required autocomplete="email">
                <span id="emailError" class="error"></span>
              </div>
              <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required autocomplete="current-password"><i class="fa-regular fa-eye-slash" id="close-eye" onclick="showRegsiterPWD()"></i>
                <span id="passwordError" class="error"></span>
              </div>
              <div class="form-group">
                <label for="cpassword">Confirm-Password:</label>
                <input type="password" id="cpassword" name="password" required autocomplete="current-password"><i class="fa-regular fa-eye-slash" id="closed-eye" onclick="showpassword()"></i>
                <span id="cpasswordError" class="error"></span>
              </div>

              <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender">
                  <option value="">select gender</option>
                  <option value='Male'>MALE</option>
                  <option value="Female">FEMALE</option>
                </select>
                <span id="genderError" class="error"></span>
              </div>

              <button type="button" id="submit" data-id="#id#">Register</button>
        </form>
      </div>
    </cfoutput>
  </body>

</html>
