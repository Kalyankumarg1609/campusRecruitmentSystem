
<!--- interview schedule form --->

<cfoutput>

	<h2>Interview Form</h2>

	<form class="interviewform" data-id="url.id">
		<div>
	    	<label for="interview_date">Interview Date:</label>
	    	<input type="date" id="interview_date" name="interview_date" required>
	    </div>

		<div>
		    <label for="interview_time">Interview Time:</label>
		    <input type="time" id="interview_time" name="interview_time" required>
		</div>

		<cfquery name="selectstatus" datasource="recruitment">
		  	select 
		  		status_id,
		  		status_prop
		  	from 
		  		campus.status
		</cfquery>
		<div>
		    <label for="interview_status">Interview Status:</label>
		    <select id="interview_status" name="interview_status" required>
		      	<option value="">Select Status</option>
		      	<cfloop query="selectstatus">
		      		<option value="#selectstatus.status_id#">#selectstatus.status_prop#</option>
		      	</cfloop>
		    </select>
		</div>

		<button type="button" class="btn btn-primary" onclick="interviewschedule(#url.id#)">Submit
		</button>
	</form>

</cfoutput>