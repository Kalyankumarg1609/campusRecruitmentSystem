
<!--- checking the url.id is defined or not --->
<cfif isDefined('url.id')>
	<cfset id = #url.id#>
<cfelse>
	<cfset id = "">
</cfif>

<!--- retriving the interview schedule data of a particular id from database--->
<cfset output = application.gain.schedule(id)>
<cfoutput query="output">

	<cfloop>
		<h2>Interview Form</h2>

		<form class="interviewform" data-id="url.id">
		  <div>
		    <label for="interviews_date">Interview Date:</label>
		    <input type="date" id="interviews_date" name="interview_date" value = "#output.interview_date#">
		  </div>
		  <div>
		    <label for="interviews_time">Interview Time:</label>
		    <input type="time" id="interviews_time" name="interview_time" value="#output.interview_time#">
		  </div>
		  <cfquery name="selectstatus" datasource="recruitment">
		  	select 
		  		status_id,
		  		status_prop
		  	from 
		  		campus.status
		  </cfquery>
		  <div>
		    <label for="interviews_status">Interview Status:</label>
		    <select id="interviews_status" name="interview_status" required>
		      <option value="#output.status_id#">#output.status_prop#</option>
		      <cfloop query="selectstatus">
		      	<option value="#selectstatus.status_id#">#selectstatus.status_prop#</option>
		      </cfloop>
		    </select>
		  </div>
		  <button type="button" class="btn btn-primary" onclick="modifiedSchedule(#url.id#)">Submit</button>
		</form>
	
	</cfloop>

</cfoutput>