<cfcomponent output="false">

	<cfset this.name="loginform" />
	<cfset this.applicationTimeout = createTimespan(0, 1, 0, 0) />
	<!--- configure session management --->
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimespan(0, 0, 30, 0 )/>
	
	

	<cffunction name="onApplicationStart" returntype="boolean">
		<!--- getting login details --->
		<cfset application.details = createObject("component","components.logindetalis") />
		<!--- getting student,company, interview details--->
		<cfset application.gain = createObject("component","components.getDetails") />
		<cfreturn true />
	</cffunction>

</cfcomponent>