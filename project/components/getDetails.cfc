<!---getting all details from database  --->

<cfcomponent>

	<!--- retriving the selected students details  --->
	<cffunction name="studentdetails" access="public" returntype="any">

		<cfquery name="come_up" datasource="recruitment">
			select 
				im.image_name,
				cs.firstname,
				cc.industryname,
				cc.salary,
				cc.category,
				ce.branch,
				ce.year_of_passing
			from 
				campus.selectedstudents as usr
			left join campus.img as im on 
				im.student_id = usr.candidate_id
			left join campus.users as cs on 
				cs.id = usr.candidate_id 
			left join campus.criteria as cc on
				cc.criteria_id = usr.criteria
			left join campus.educationdetalis as ce on
				ce.student_id = usr.candidate_id 
			where 1=1

			<cfif session.stLoggedInUser.role eq 'RECRUITER'>
				And usr.recruit_id = #session.stLoggedInUser.roleid# limit 10
			</cfif>
		</cfquery>
		<cfreturn come_up>
	</cffunction>

	<!--- inserting student details into educationdetalis table by students  --->
	<cffunction name="better" access="public" returntype="boolean">

		<cfargument name="id" required="true">
		<cfargument name="branch" required="true">
		<cfargument name="percentage" required="true">
		<cfargument name="skills" required="true">
		<cfargument name="address" required="true">
		<cfargument name="passedout" required="true">

		<cfquery name="detailsupdate" datasource="recruitment">

			insert into campus.educationdetalis(
				student_id,
				branch,
				cgpa,
				skills,
				address,
			year_of_passing
			) 
			values(
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">,
				<cfqueryparam value="#arguments.branch#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.percentage#">,
				<cfqueryparam value="#arguments.skills#">,
				<cfqueryparam value="#arguments.address#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.passedout#">
				)
		</cfquery>
		<cfreturn true>
	</cffunction>

	<!--- inserting company requirement data into criteria table by recruiter --->
	<cffunction name="slot" access="public" returntype="boolean">
		<cfargument name="id" required="true">
		<cfargument name="companyname" required="true">
		<cfargument name="branch" required="true">
		<cfargument name="skills" required="true">
		<cfargument name="percentage" required="true">
		<cfargument name="salary" required="true">
		<cfargument name="industry" required="true">
		<cfargument name="location" required="true">
		<cfargument name="role" required="true">
		<cfargument name="employment" required="true">

		<cfquery name="detalisinsert" datasource="recruitment">
		insert into campus.criteria(
			company_id,
			branch,
			minimum_cgpa,
			required_skills,
			salary,
			industry_type,
			category,
			location,
			job_type,
			industryname
			) 
		values(
			<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">,
			<cfqueryparam value="#arguments.branch#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.percentage#">,
			<cfqueryparam value="#arguments.skills#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.salary#">,
			<cfqueryparam value="#arguments.industry#">,
			<cfqueryparam value="#arguments.role#">,
			<cfqueryparam value="#arguments.location#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.employment#">,
			<cfqueryparam value="#arguments.companyname#">
			)
		
		</cfquery>

		<cfreturn true>
	</cffunction>

	<!--- getting the student details and company details --->
	<cffunction name="filters" access="public" returntype="any">

		<cfargument name="uname" required="true">
		<cfargument name="Branch" required="true">
		<cfargument name="industry" required="true">
		<cfargument name="category" required="true">

		<cfif session.stLoggedInUser.role neq 'STUDENT'>
			<cfquery name="studentdet" datasource="recruitment">

				select 
					cu.firstname,
					cu.email,
					cu.phone,
					ce.branch,
					ce.cgpa,
					im.image_name,
					cf.file_name,
					cu.id 
				from 
					campus.users as cu
				left join campus.educationdetalis as ce on
				 	ce.student_id = cu.id
				left join campus.img as im on 
					im.student_id = cu.id
				left join campus.file as cf on 
					cf.student_id = cu.id 
				where 1=1
				<cfif '#session.stLoggedInUser.role#' neq 'ADMIN' or '#session.stLoggedInUser.role#' neq 'RECRUITER'>
					and cu.roleid = 2
				</cfif>
				<cfif arguments.uname neq ''>
					and cu.firstname ilike <cfqueryparam value="%#arguments.uname#%">
				</cfif>
				<cfif arguments.Branch neq ''>
					and ce.branch ilike <cfqueryparam value="%#arguments.Branch#%">
				</cfif>

			</cfquery>
			<cfreturn studentdet>
		<cfelse>

			<cfquery name="companydet" datasource="recruitment">
			    SELECT  
			    	cc.industryname,
			    	cc.branch,
			    	cc.category,
			    	im.image_name,
			    	ci.interview_date,
			    	ci.interview_time 
			    FROM 
			    	campus.criteria AS cc 
			    LEFT JOIN campus.img AS im ON 
			    	im.student_id = cc.company_id
			    LEFT JOIN campus.interviews AS ci ON 
			    	ci.vacancy_id = cc.criteria_id
			    WHERE 1=1
			    <cfif session.stLoggedInUser.role neq 'ADMIN' AND session.stLoggedInUser.role neq 'STUDENT'>
			        AND cc.roleid = 1
			    </cfif>
			    <cfif arguments.industry neq ''>
			        AND cc.industryname ILIKE <cfqueryparam value="%#arguments.industry#%">
			    </cfif>
			    <cfif arguments.Branch neq ''>
			        AND cc.branch ILIKE <cfqueryparam value="%#arguments.Branch#%">
			    </cfif>
			    <cfif arguments.category neq ''>
			        AND cc.category ILIKE <cfqueryparam value="%#arguments.category#%">
			    </cfif> 
			</cfquery>
			<cfreturn companydet>
		</cfif>
	</cffunction>

	<!--- getting the interview schedule details --->
	<cffunction name="schedule" access="public" returntype="any">
		<cfargument name="id" required="true">
		<cfquery name="getschedule" datasource="recruitment">
			select 
				ci.interview_date,
				ci.interview_time,
				cs.status_prop,
				cs.status_id 
			from 
				campus.interviews as ci
			left join campus.status as cs on 
				cs.status_id = ci.interview_status 
			where 
				vacancy_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">
		</cfquery>

		<cfreturn getschedule>
	</cffunction>

	<!--- to insert/update the interview schedule by Admin --->
	<cffunction name="modified" access="public" returntype="boolean">

		<cfargument name="id" required="true">
		<cfargument name="interviewdate" required="true">
		<cfargument name="interviewtime" required="true">
		<cfargument name="status" required="true">

		<cfquery name="schedulecheck" datasource="recruitment">
			select 
				vacancy_id
			from
				campus.interviews 
			where 
				vacancy_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">
		</cfquery>

		<cfif schedulecheck.recordCount gt 0>
			<cfquery name="scheduleupdated" datasource="recruitment">

				update 
					campus.interviews 
				set 
					interview_date = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.interviewdate#">,
					interview_time = <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.interviewtime#">,
					interview_status = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.status#">
				where 
					vacancy_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">	
			</cfquery>
			<cfreturn true>
		</cfif>
	</cffunction>

	<!--- check the email --->
	<cffunction name="checkEmail" access="public" returntype="any">
		<cfargument name="email" required="true">

		<cfquery name="getEmail" datasource="recruitment">

			select 
				email 
			from 
				campus.users
			where
				email = <cfqueryparam value="#arguments.email#">
		</cfquery>

		<cfif getEmail.recordCount gt 0>
			<cfreturn getEmail>
		<cfelse>
			<cfreturn 0>
		</cfif>
	</cffunction>

	<!--- change the password --->
	<cffunction name="changepass" access="public" returntype="boolean">
		<cfargument name="email" required="true">
		<cfargument name="password" required="true">

		<cfset pass = #hash(arguments.password,'md5')#>

		<cfquery name="updatepass" datasource="recruitment">
			update 
				campus.users 
			set 
				password = <cfqueryparam value="#pass#">
			where 
				email = <cfqueryparam value="#arguments.email#">
		</cfquery>

		<cfreturn true>
	</cffunction>

	<!--- inserting the selected students detalis into database --->
	<cffunction name="studentsselected" access="public" returntype="boolean">
		<cfargument name="candidate" required="true">
		<cfargument name="recruit" required="true">
		<cfargument name="criteria_id" required="true">

		<cfquery name="selectstudents" datasource="recruitment">

			select 
				candidate_id,
				recruit_id
			from 
				campus.selectedstudents
			where 
				candidate_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.candidate#"> and 
				recruit_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.recruit#">

		</cfquery>

		<cfif selectstudents.recordCount eq 0>
			<cfquery name="selectedS" datasource="recruitment">
				insert into campus.selectedstudents(
					candidate_id,
					recruit_id,
					criteria
					) 
				values(
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.candidate#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.recruit#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.criteria_id#">
					)
			</cfquery>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>

	<!--- getting the analysis report from reports table --->
	<cffunction name="analysisreports" access="public" returntype="any">
		<cfargument name="id" required="true">

		<cfquery name="statistics" datasource="recruitment">

			select 
				attended,
				selected,
				rejected
			from 
				campus.reports
			where
				criteria_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">
		</cfquery>
		<cfreturn statistics>
	</cffunction>

	<!--- inserting the interview detalis into reports database table --->
	<cffunction name="announce" access="public" returntype="boolean">

		<cfargument name="id" required="true">
		<cfargument name="attended" required="true">
		<cfargument name="selected" required="true">
		<cfargument name="rejected" required="true">

		<cfquery name="information" datasource="recruitment">

			insert into campus.reports(
				criteria_id,
				attended,
				selected,
				rejected
				) 
			values(
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.attended#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.selected#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.rejected#">
				)
		</cfquery>
		<cfreturn true>
	</cffunction>

	<!--- getting the company requirements from database --->
	<cffunction name="getcriteria" access="public" returntype="any">
		<cfargument name="id">

		<cfquery name="criteriaget" datasource="recruitment">

			select 
				cc.industryname,
				cc.branch,
				cc.minimum_cgpa,
				cc.required_skills,
				cc.salary,
				cc.industry_type,
				cc.location,
				cc.category,
				cc.job_type,
				ce.employment_type
			from 
				campus.criteria as cc
			left join campus.employment as ce on
				ce.employment_id = cc.job_type
			where
				criteria_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">
		</cfquery>
		<cfreturn criteriaget>
	</cffunction>

</cfcomponent>