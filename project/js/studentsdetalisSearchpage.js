$(document).ready(function(){

	$.ajax({
		type:'Get',
		url:'companyCriteriaFilterpage.cfm',
		success:function(response){
			if(response){
				$('#usertable tbody').html(response)
			}
			$('#usertable').DataTable()
		}
	})

	$('.interviewcard').on('click',function(){
		var id = $(this).data('id') 
		$.ajax({
			type:'Get',
			url:'recruitersearch.cfm',
			data:{id:id},
			success:function(response){

				$("#recruitersearch").html(response)
				$.ajax({
					type:'Get',
					url:'companyCriteriaFilterpage.cfm',
					data:{id:id},
					success:function(response){
						if(response){
							$('#usertable tbody').html(response)
						}
						$('#usertable').DataTable()
					}
				})
			}
		})
	})

})

// filter the students list according to criteria

function filters(){

	$.ajax({
		type:'Get',
		url:'companyCriteriaFilterpage.cfm',
		data:{uname: $('#uname').val(), Branch:$("#Branch").val(),industryname:$('#industryname').val(),category:$('#category').val()},
		success:function(response){
			if(response){
				$("#usertable tbody").html(response)
			}
		}
	})

}


// list of students selected in interview 

function selectedsts(studentid,recruiterid){

	if(confirm("Are you sure to select the candidate")){

		$.ajax({
			type:'Get',
			url:'selectstudents.cfm',
			data:{candidate:studentid,recruit:recruiterid,criteria_id:$("#usertable").data('criteria_id')},
			success:function(response){
				if(response=='true'){
					alert('successfully selected')
					filters()
				}else{
					alert('student you selected is already selected for the role')
				}
			}		
		})

	}
	else{

		alert('your rejected the candidate')
	}

}


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