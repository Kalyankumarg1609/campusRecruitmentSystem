

<!--- checking the email is registered or not --->
<!--- updating the password --->
<cfset output = application.gain.checkEmail(email = form.email)>

<cfif serializeJSON(output) lt 1>
	<cfoutput>#output#</cfoutput>
<cfelseif output.recordCount gt 0>

	<input type="email" placeholder= "enter your Email" id='email' class="input" value="<cfoutput>#output.email#</cfoutput>"
	autocomplete="off" style="border-color: green;">

	<input type="password" placeholder="enter new password" class="input" id='password' 
	autocomplete="new-password">
	<span class="error" id = 'new_pass'></span>
	<input type="password" placeholder="enter confirm password" class="input" id="cpassword" autocomplete="new-password">
	<span class="error" id = 'c_pass'></span>

	<button type="button" class="btn btn-primary" onclick="passwordset()">submit</button>
</cfif>