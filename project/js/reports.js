$(document).ready(function(){

	// opening the form in modal box
	$('.static').on('click',function(){
		var id = $(this).data('id')
		console.log(id)
		$.ajax({
			type:'Get',
			url:'reportformpage.cfm',
			data:{id:id},
			success:function(response){

				$("#modalbox").html(response)
            	$("#modalbox").modal('show');
			}
		})
	})
})


// submiting the reports
function analytics(id){

	$.ajax({
		type:'Get',
		url:'reveldata.cfm',
		data:{id:id,attended:$('#attended').val(),selected:$('#qualified').val(),rejected:$('#disqualified').val()},
		success:function(response){
			if(response=='true'){
				alert('successfully submitted the report')
			}
			else{
				alert('Failed to submit')
			}
		}
	})
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