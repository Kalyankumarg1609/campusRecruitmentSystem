
<!--- validating the login details and inserting the new records into database --->
<cfcomponent>

    <!--- validating the login details --->
	<cffunction name="login" access="public" returntype="boolean">

		<cfargument name="email" required="true" default="">
		<cfargument name="password" required="true" default="">

        <cfset pass = #hash(arguments.password,'md5')#>

		<cfset var isUserLoggedIn = false />
        <cfquery name="userQuery" datasource="recruitment">
            select 
                usr.firstname,
                usr.id,rol.role_name,
                usr.password 
            from 
                campus.users as usr
            left join campus.role as rol on 
                rol.role_id = usr.roleid 
            where 
                email = <cfqueryparam  value='#arguments.email#'> and 
                password = <cfqueryparam value="#pass#">
        </cfquery>

        <cfif userQuery.recordCount eq 1>
            <cflogin>
                <cfloginuser name="#userQuery.firstname#" password="#userQuery.password#" 
                roles="#userQuery.role_name#">
            </cflogin>
            <cfset session.stLoggedInUser={'username'=userQuery.firstname, 'role' = userQuery.role_name,
             "roleid"=userQuery.id } />

            <cfset var isUserLoggedIn = true />

        </cfif>
 
        <cfreturn isUserLoggedIn />
	</cffunction>

    <!--- inserting the new records into database --->
    <cffunction name="register" access="public" returntype="boolean">

        <cfargument name="fname" required="true">
        <cfargument name="lname" required="true">
        <cfargument name="contact" required="true">
        <cfargument name="Email" required="true">
        <cfargument name="password" required="true">
        <cfargument name="gender" required="true">
        <cfargument name="role" required="true">

        <cfset pass = #hash(arguments.password,'md5')#>

        <cfquery name="checkDuplicates" datasource="recruitment">
            select 
                email, 
                phone 
            from 
                campus.users
            where 
                email = <cfqueryparam value="#arguments.Email#"> or 
                phone = <cfqueryparam cfsqltype="bigint" value="#arguments.contact#">
        </cfquery>

        <cfif checkDuplicates.recordCount gt 0>
            <cfreturn false>
        <cfelse>
            <cfquery name="user_register" datasource="recruitment">
                insert into  campus.users(firstname,lastname,phone,email,password,gender,roleid) values ( <cfqueryparam cfsqltype="varchar" value= '#arguments.fname#'>,<cfqueryparam cfsqltype="varchar" value='#arguments.lname#'>,<cfqueryparam cfsqltype="bigint" value='#arguments.contact#'>,<cfqueryparam cfsqltype="varchar" value='#arguments.Email#'>,<cfqueryparam cfsqltype="varchar" value='#pass#'>,<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.gender#">,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.role#">)
            </cfquery>
                
            <cfreturn true>
        </cfif>      
    </cffunction> 

</cfcomponent>