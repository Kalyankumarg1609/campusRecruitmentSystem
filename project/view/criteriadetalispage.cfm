
<!--- inserting company criteria into database  --->
<cfset output = application.gain.slot(id=url.id,companyname=url.companyname,branch=url.branch,skills=url.skills,percentage=url.percentage,salary = url.salary,industry=url.industry,location=url.location,role=url.role,employment=url.employment)>

<cfoutput>#output#</cfoutput>