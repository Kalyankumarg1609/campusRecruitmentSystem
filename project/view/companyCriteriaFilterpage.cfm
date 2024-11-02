<!--- checking wheather the url.name is defined or not --->
<cfif isDefined('url.uname')>
	<cfset uname = #url.uname#>
<cfelse>
	<cfset uname = "">
</cfif>

<!--- checking wheather the url.Branch is defined or not --->
<cfif isDefined('url.Branch')>
	<cfset Branch = #url.Branch#>
<cfelse>
	<cfset Branch ="">
</cfif>

<!---checking wheather the url.industryname is defined or not  --->
<cfif isDefined('url.industryname')>
	<cfset industry = #url.industryname#>
<cfelse>
	<cfset industry = "">
</cfif>
<!--- checking wheather the url.category is defined or not --->
<cfif isDefined('url.category')>
	<cfset category = #url.category#>
<cfelse>
	<cfset category = "">
</cfif>

<cfif isDefined('url.id')>
    <cfset criteria_id = #url.id#>
<cfelse>
    <cfset criteria_id = "">
</cfif>

<!--- getting students company details based on filters --->
<cfset output = application.gain.filters(uname=uname,Branch=Branch,category=category,industry=industry)>
<cfoutput query="output">
	<cfif session.stLoggedInUser.role neq "STUDENT">
        <cfloop>
            <cfquery name="getselectedstudents" datasource="recruitment">
                select 
                    recruit_id,
                    candidate_id,
                    criteria
                from 
                    campus.selectedstudents
                where 1=1
                <cfif session.stLoggedInUser.role eq 'RECRUITER'>
                   and recruit_id = #session.stLoggedInUser.roleid# and 
                    candidate_id = #output.id# and 
                    criteria = #criteria_id#
                </cfif>
                <cfif session.stLoggedInUser.role eq 'ADMIN'>
                    and recruit_id = #session.stLoggedInUser.roleid# and 
                    candidate_id = #output.id#
                </cfif>
            </cfquery> 
            <cfif output.image_name neq ''>
                <cfset imagePath = "../media/images/#output.image_name#">
            <cfelse>
                <cfset imagepath="../media/user.png">
            </cfif>
            <cfset pdfPath = "../media/resumes/#output.file_name#">
            <tr>
                <td>
                    <img src="#imagePath#" alt="#output.image_name#" class="avatar avatar-sm rounded-circle me-2"> 
                    <a class="text-heading font-semibold"> #output.firstname# </a></td>
                <td>#output.branch#</td>
                <td>#output.phone#</td>
                <td>#output.email#</td>
                <td>#output.cgpa#</td>
                <cfif session.stLoggedInUser.role eq 'RECRUITER'>
                	<td>
	                    <div class="btn-group">
	                        <button type="button" class="btn btn-sm btn-neutral"><a href="#pdfPath#" target="_blank">resume</a></button>

                            <cfif getselectedstudents.recordCount gt 0>
                                <button type="button" class="btn btn-sm btn-neutral" id="selectBtn_#output.id#" onclick="selectedsts(#output.id#,#session.stLoggedInUser.roleid#)" style="display: none;" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>select</button>
                            <cfelse>
                                <button type="button" class="btn btn-sm btn-neutral" id="selectBtn_#output.id#" onclick="selectedsts(#output.id#,#session.stLoggedInUser.roleid#)" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>select</button>
                            </cfif>
	                    </div>
	                </td>
                </cfif>
            </tr>
        </cfloop>
    <cfelse>
        <cfloop>
            <cfset imagePath = "../media/images/#output.image_name#">
            <tr>
                <td><img src="#imagePath#" alt="#output.image_name#" class="avatar avatar-sm rounded-circle me-2"> <a class="text-heading font-semibold"> #output.industryname# </a></td>
                <td>#output.category#</td>
                <td>#output.interview_date#</td>
                <td>#output.interview_time#</td>
                <td>#output.branch#</td>
            </tr>
        </cfloop>
    </cfif>
</cfoutput>