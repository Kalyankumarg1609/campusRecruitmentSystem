
<!--- login verification --->
<cfset output = application.details.login(email=url.email,password=url.password)>
<cfoutput>#output#</cfoutput>

