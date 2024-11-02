
<!--- storing the interview schedule detalis in database --->

<cfset vacancy_id = url.id>
<cfset indate =url.interviewdate>
<cfset intime = url.interviewtime>
<cfset status = url.status>

<cfquery name="interviewscheduled" datasource="recruitment">
	insert into campus.interviews(
	 	vacancy_id,
	 	interview_date,
	 	interview_time,
	 	interview_status) 
	values(
	 	<cfqueryparam cfsqltype="cf_sql_integer" value="#vacancy_id#">,
	 	<cfqueryparam cfsqltype="cf_sql_date" value="#indate#">,
	 	<cfqueryparam cfsqltype="cf_sql_time" value="#intime#">,
	 	<cfqueryparam cfsqltype="cf_sql_integer" value="#status#">
	 	)
</cfquery>

<cfset output = true>
<cfoutput>#output#</cfoutput>