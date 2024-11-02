$(document).ready(function(){

	// selected students
	$.ajax({
		type:'Get',
		url:'tabledatapage.cfm',
		success:function(response){
			if(response){
				$('#tabledata').append(response)
			}
		}
	})

})


// logout function

function logout(){

	$.ajax({
		type:'Get',
		url:'logout.cfm',
		success:function(response){
			if(response){
				window.location.href = "../view/signinpage.cfm"
			}
		}
	})
}