$(document).ready(function(){

	$('.inschedule').on('click',function(){
		var id = $(this).data('id')
		$.ajax({
			type:'Get',
			url:'interviewscheduleformpage.cfm',
			data:{id:id},
			success:function(response){
				if(response){
					$('#intsch').html(response)
				}
			}
		})
	})

	// view the scheduled interview details
	$('.inschedule').on('click',function(){
		var id = $(this).data('id')
		$('.container').removeClass('d-none')
		$.ajax({
			type:'Get',
			url:'updatescheduledetalis.cfm',
			data:{id:id},
			success:function(response){
				if(response){
					$('#intsch').html(response)
				}
			}
		}) 
	})

})

function interviewschedule(id){
	
	$.ajax({
		type:'Get',
		url:'interviewscheduledetalis.cfm',
		data:{id:id,interviewdate:$('#interview_date').val(),interviewtime:$('#interview_time').val(),status:$('#interview_status').val()},
		success:function(response){
			if(response){
				alert('Interview for the company has Scheduled')
				window.location.reload();
			}
		}
	})
}

// schedule or update the interview 
function modifiedSchedule(id){

	$.ajax({
		type:'Get',
		url:'modifiedScheduledetalis.cfm',
		data:{id:id,interviewdate:$('#interviews_date').val(),interviewtime:$('#interviews_time').val(),status:$('#interviews_status').val()},
		success:function(response){
			if(response){
				alert('Interview Schedule has updated')
			}
		}

	})

}


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