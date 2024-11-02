
<!--- updating the password into database --->
<cfset output = application.gain.changepass(email=url.email,password=url.password)>
<cfoutput>#output#</cfoutput>