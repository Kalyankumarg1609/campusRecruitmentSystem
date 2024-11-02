
<!--- inserting student profile details into database --->
<cfset output = application.gain.better(id = url.id,branch = url.Branch,percentage = url.percentage,skills = url.skills,address = url.address,passedout=url.passedout)>

<cfoutput>#output#</cfoutput>
