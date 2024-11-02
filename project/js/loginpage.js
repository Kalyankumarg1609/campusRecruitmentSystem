$(document).ready(function(){

	// sign in  validations
	$('#signin').on('click', function(){

		var email = $('#email').val()
		var password = $("#password").val()

		$('.error').text('')

		if(email===""){
			$('#emailError').text('enter your email').css('color','red')
			return false;
		}
		if(password===""){
			$('#passwordError').text('enter your password').css('color','red')
			return false;
		}

		$.ajax({
			type:'Get',
			url:'loginDetalis.cfm',
			data:{email:$('#email').val(),password:$('#password').val()},
			success:function(response){
				console.log(response, typeof(response), response === 'true', response = 'true')
				if(response == 'true' || response == true){
					console.log('hit!!!')
					window.location.href='../view/Dashboardpage.cfm';
				}
				else if(response == 'false'){
					alert('please check the login details');
				}
			}
		})
	})
})
