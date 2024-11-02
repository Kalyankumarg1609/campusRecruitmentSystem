
<!--- clearing the session variable detalis of students, Recruiters and Admin when Clicking on logout  --->

<cfset output = structClear(session)>
<cfoutput>#output#</cfoutput>