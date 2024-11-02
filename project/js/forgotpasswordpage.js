$(document).ready(function(){
	
	// checking the email is existed or not
	$('#forgot').on('click',function(){
		$('.error').text()
		$.ajax({
			type:'POST',
			url:'checkEmailpage.cfm',
			data:{email:$('#email').val()},
			success:function(response){
				if(response == 0){
					$('#emailError').text('email does not exist').css('color','red');
				}
				else{
					$('.input').html(response)
				}
			}
		})
	})
})

// submiting the new password
function passwordset(){

	var email = $('#email').val()
	var new_password = $('#password').val()
	var confirm_password = $('#cpassword').val()

	$('.error').text('')

	if(new_password===''){
		$('#new_pass').text('Please enter your password').css("color","red");
	    return false;
	}

	var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (!passwordRegex.test(new_password)) {
        $('#new_pass').text('Password must contain at least 8 characters including 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character').css("color","red");
        return false;
    }

	if(confirm_password===''){
		$('#c_pass').text('Please enter your confirm password').css("color","red");
        return false;
	}

	if (new_password !== confirm_password) {
        $('#c_pass').text('Password and Confirm Password must match').css("color","red");
        return false;
    }

	$.ajax({
		type:'Get',
		url:'changepasswordpage.cfm',
		data:{email:email, password:new_password},
		success:function(response){
			if(response=='true'){
				alert('successfully changed password')
				window.location.href = '../view/signinpage.cfm'
			}
			else{
				alert('failed to change the password')
			}
		}
	})
}