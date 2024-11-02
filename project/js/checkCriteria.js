$(document).ready(function(){

	// checking the criteria 
	$('.criteriacheck').on('click',function(){

		var id = $(this).data('id')
		$('.container').removeClass('d-none')

		$.ajax({
			type:'Get',
			url:'getcriteriacheck.cfm',
			data:{id:id},
			success:function(response){

				$('.container').html(response)
			}
		})
	})
})

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