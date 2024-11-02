
<!--- interview form page --->
<cfparam name="url.id" default="-1">
<cfoutput > 

	<div class="modal-dialog">
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<h5 class="modal-title" id="exampleModalLabel">Interview Report</h5>
	      	</div>
	      	<div class="modal-body">

	      		<div class="col-md-8 col-lg-8 col-10 form-group">
                    <label>number of students attended : </label>
                    <input type="number" class="form-control" id="attended" name="attended" aria-describedby="attended" placeholder="Enter students attended " required  >
                     
                </div>
                <div class="col-md-5 col-lg-8 col-10 form-group">
                    <label>number of students selected : </label>
                    <input type="number" class="form-control" id="qualified" name="qualified" aria-describedby="qualified" placeholder="Enter students selected " required  >
                     
                </div>
                <div class="col-md-5 col-lg-8 col-10 form-group">
                    <label>number of students rejected : </label>
                    <input type="number" class="form-control" id="disqualified" name="disqualified" aria-describedby="disqualified" placeholder="Enter students rejected " required  >
                    
                </div>
	        
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        	<button type="button" class="btn btn-primary" onclick="analytics(#url.id#)">Save changes</button>
	      	</div>
	    </div>
  	</div>


</cfoutput>