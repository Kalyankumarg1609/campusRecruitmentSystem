$(document).ready(function(){
	
	// checking the reports of an interview
	$('.reportcard').on('click', function() {
    var id = $(this).data("id");

	    $(".piechart").removeClass('d-none');

	    $.ajax({
	        type: 'GET',
	        url: 'datareports.cfm',
	        data: { id: id },
	        success: function(response) {
	            var data = JSON.parse(response);

	            // Ensure data is correctly structured for Chart.js
	            var pieChartData = {
	                labels: ['Attended students', 'Selected students', 'Rejected students'],
	                datasets: [{
	                    data: data,
	                    backgroundColor: ['#3333FF', '#009900', '#FF0000'],
	                    hoverBackgroundColor: ['#3333FF', '#009900', '#FF0000']
	                }]
	            };

	            // Destroy existing chart if it exists
	            if (window.pieChart3 instanceof Chart) {
	                window.pieChart3.destroy();
	            }

	            // Get context of the canvas element where chart will be rendered
	            var ctx3 = $('#pieChart3');

	            // Initialize new Chart.js instance
	            window.pieChart3 = new Chart(ctx3, {
	                type: 'pie',
	                data: pieChartData,
	                options: {
	                    legend: {
	                        position: 'bottom',
	                        labels: {
	                            boxWidth: 10,
	                            fontStyle: 'italic',
	                            fontColor: '#aaa',
	                            usePointStyle: true
	                        }
	                    }
	                }
	            });
	        },
	    });
	});


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