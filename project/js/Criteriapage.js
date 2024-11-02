$(document).ready(function(){

	// submiting the criteria details
	$('#submit').on('click',function(){
		var id = $(this).data('id')
		var companyname = $("#company-name").val()
		var branch = $("#branch").val()
		var percentage =$("#cgpa").val()
		var skills = $("#skills-required").val()
		var salary = $("#salary").val()
		var industry = $("#industry-type").val()
		var location =$("#location").val()
		var role = $("#role-category").val()
		var employment =$("#employment-type").val()

		$('.error').text('')

		if(companyname===''){
			$('#companyNameError').text('enter company name').css('color','red');
			return false;
		}
		if(branch===''){
			$('#branchError').text('enter required branch').css('color','red');
			return false;
		}
		if(percentage===''){
			$('#percentageError').text('enter required percentage').css('color','red')
			return false;
		}
		if(skills===''){
			$('#skillsError').text('enter required skills').css('color','red')
			return false;
		}
		if(salary===''){
			$('#salaryError').text('enter salary').css('color','red')
			return false;
		}
		if(industry===''){
			$('#industryError').text('enter type of industry').css('color','red')
			return false;
		}
		if(location===''){
			$('#locationError').text('enter the location').css('color','red')
			return false;
		}
		if(role===''){
			$('#roleError').text('enter the role category').css('color','red')
			return false;
		}
		if(employment===''){
			$('#employment_typeError').text('select type of employment').css('color','red')
			return false;
		}

		$.ajax({
			type:'Get',
			url:'criteriadetalispage.cfm',
			data:{id:id,companyname:companyname,branch:branch,skills:skills,percentage:percentage,salary:salary,industry:industry,
			location:location,role:role,employment:employment},
			success:function(response){
				if(response){
					alert('successfully uploaded vacancy requirement details')
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