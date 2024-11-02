$(document).ready(function(){

	// submiting the form for registeration
	$("#submit").on('click',function(){

		var firstname=$("#fname").val()
		var lastname = $("#lname").val()
		var phone=$("#contact").val()
		var email=$("#email").val()
		var password=$("#password").val()
		var confirm_password=$("#cpassword").val()
		var gender=$("#gender").val()
		var role=$(this).data('id')

		$(".error").text('');

		if(firstname ===""){
			$('#firstnameError').text('Please enter your first name').css("color","red");
	        return false;
		}

		if(lastname===""){
			$('#lastnameError').text('Please enter your last name').css("color","red");
	        return false;
		}
		if(phone===''){
			$('#contactError').text('Please enter your phone number').css("color","red");
	        return false;
		}

		if (!$.isNumeric(phone)) {
	        $('#contactError').text('Phone number must contain only numbers').css("color","red");
	        return false;
	    }
		
		if (!phoneNumberChecker(phone)){
			 $('#contactError').text('Phone number must contain 10 digits').css("color","red");
	        return false;
	    }


		if(email===""){
			$('#emailError').text('Please enter your email').css("color","red");
	        return false;
		}
		
		if(password===''){
			$('#passwordError').text('Please enter your password').css("color","red");
	        return false;
		}

		var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	    if (!passwordRegex.test(password)) {
	        $('#passwordError').text('Password must contain at least 8 characters including 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character').css("color","red");
	        return false;
	    }

		if(confirm_password===''){
			$('#cpasswordError').text('Please enter your confirm password').css("color","red");
	        return false;
		}

		if (password !== confirm_password) {
	        $('#cpasswordError').text('Password and Confirm Password must match').css("color","red");
	        return false;
	    }


		if(gender===''){
			$('#genderError').text('Please select your gender').css("color","red");
	        return false;
		}

		if(role===''){
			$('#roleError').text('Please select your role').css("color","red");
	        return false;
		}

		var obj = {Firstname:$("#fname").val(),Lastname:$("#lname").val(),phone:$("#contact").val(),Email:$("#email").val(),password:$("#password").val(),gender:$("#gender").val(),role:role}

		$.ajax({
		    type: 'POST',
		    url: 'registerationDetalispage.cfm',
		    data: obj,
		    success: function(response) {
		    	if(response == 'true'){
		    		alert('successfully registered')
		    		window.location.href = '../view/signinpage.cfm';
		    	}
		    	else if(response == 'false'){
		    		alert('email and phone number is already used');
		    	}
		        
		    }
		})

	})
})


function phoneNumberChecker(phone){
	var rot = /^(?=.*\d).{10}$/;
	return rot.test(phone);
}


// Function for Toggle Passowrd
function showRegsiterPWD(){
    var passwordField = $('#password');
    var eyeImagePWD = $('#close-eye');

    if(passwordField.attr('type') === 'password'){
        passwordField.attr('type', 'text');
        eyeImagePWD.removeClass('fa-eye-slash').addClass('fa-eye');

    }
    else{
        passwordField.attr('type', 'password');
        eyeImagePWD.removeClass('fa-eye').addClass('fa-eye-slash')
    }
}

function showpassword(){
    var passwordField = $('#cpassword');
    var eyeImagePWD = $('#closed-eye');

    if(passwordField.attr('type') === 'password'){
        passwordField.attr('type', 'text');
        eyeImagePWD.removeClass('fa-eye-slash').addClass('fa-eye');

    }
    else{
        passwordField.attr('type', 'password');
        eyeImagePWD.removeClass('fa-eye').addClass('fa-eye-slash')
    }
}