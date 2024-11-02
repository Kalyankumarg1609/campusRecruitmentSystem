<!--- checking the url.id is defined or not --->
<cfif isDefined('url.id')>
	<cfset id = #url.id#>
<cfelse>
	<cfset id = "">
</cfif>

<!---checking the url.interviewdate is defined or not  --->
<cfif isDefined('url.interviewdate')>
	<cfset interviewdate = #url.interviewdate#>
<cfelse>
	<cfset interviewdate = "">
</cfif>

<!---checking the url.interviewtime is defined or not  --->
<cfif isDefined('url.interviewtime')>
	<cfset interviewtime = #url.interviewtime#>
<cfelse>
	<cfset interviewtime = "">
</cfif>

<!--- checking the url.status is defined or not --->
<cfif isDefined('url.status')>
	<cfset status = #url.status#>
<cfelse>
	<cfset status = "">
</cfif>

<!--- updating the interview schedule details --->
<cfset output = application.gain.modified(id,interviewdate,interviewtime,status)>
<cfoutput>#output#</cfoutput>