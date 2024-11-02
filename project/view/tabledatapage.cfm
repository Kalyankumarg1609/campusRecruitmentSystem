
<!--- retriving the students details from database who are selected in interview --->
<cfset output = application.gain.studentdetails()>

<!--- adding the selected students details to datatable which are retrived from database--->
<cfoutput >

	<cfloop query="output">
		<cfif output.image_name eq ''>
			<cfset imagepath = "../media/user.png">
		<cfelse>
			<cfset imagePath = "../media/images/#output.image_name#">
		</cfif>

		<tr>

			<td>
				<img src="#imagePath#" alt="#output.image_name#" class="avatar avatar-sm rounded-circle me-2">
				<a class="text-heading font-semibold">#output.firstname#</a>
			</td>
			<td>#output.branch#</td>
			<td>#output.industryname#</td>
			<td>#output.salary#</td>
			<td>#output.year_of_passing#</td>
			<td>#output.category#</td>
		</tr>
	
	</cfloop>
</cfoutput>