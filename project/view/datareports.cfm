
<!--- sending id to database to fetch the data of a particular id --->
<cfset output = application.gain.analysisreports(id=url.id)>
<cfset datareport = arrayNew(1)>
<cfloop query="output">
	<cfset arrayAppend(datareport, #output.attended#)>
	<cfset arrayAppend(datareport, #output.selected#)>
	<cfset arrayAppend(datareport, #output.rejected#)>
</cfloop>
<cfoutput>#serializeJson(datareport)#</cfoutput>