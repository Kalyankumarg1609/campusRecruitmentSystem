
<!--- inserting the selected students data into database --->

<cfset output = application.gain.studentsselected(candidate=url.candidate,recruit = url.recruit,criteria_id = url.criteria_id)>

<cfoutput>#output#</cfoutput>