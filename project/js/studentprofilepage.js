$(document).ready(function(){

	$('#myprofile').on('click',function(){

		var id = $(this).data('id');
		var branch = $('#branch').val()
		var cgpa = $('#cgpa').val()
		var skills = $('#skills').val()
		var address = $('#address').val()
		var passedout = $('#year').val()

		$(".error").text('');

		if(passedout === ''){
			$('#yearError').text('enter your passedout year').css('color','red')
			return false;
		}
		if(branch===''){
			$("#branchError").text("select your branch").css("color",'red');
			return false;
		}
		if(cgpa===''){
			$("#skillsError").text("enter your cgpa").css("color",'red');
			return false;
		}
		if(skills===''){
			$("#skillsError").text("enter your skills").css("color",'red');
			return false;
		}
		if(address===''){
			$("#addresssError").text("enter your address").css("color",'red');
			return false;
		}


		$.ajax({
			type:'Get',
			url:'updatedetails.cfm',
			data:{id:id,Branch:branch,percentage:cgpa,skills:skills,address:address,passedout:passedout},
			success:function(response){
				if(response){
					alert("successfully updated");
				}
			}
		})
	})
})


// image or profile upload function

function imageUpload(id){

	var id = id;

	var formdata = new FormData()

    formdata.append('uploadfile',$("#picture")[0].files[0])
    formdata.append('id',id)
    $.ajax({
        type:'POST',
        url:'imageupload.cfm',
        data:formdata,
        processData: false,
        contentType: false,
        success:function(response){

            if(response){
                alert('successfully inserted');
            }
        }

    })

}


// upload resumes function

function fileupload(id){

	var id=id;

	var formdata = new FormData()

        formdata.append('uploadfile',$("#resume")[0].files[0])
        formdata.append('id',id)

    $.ajax({
        type:'POST',
        url:'fileupload.cfm',
        data:formdata,
        processData: false,
        contentType: false,
        success:function(response){

            if(response){
                alert('successfully inserted');
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