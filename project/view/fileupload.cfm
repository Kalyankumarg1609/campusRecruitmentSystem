

<!--- upload the students resume files names into database and storing the files in resumes folder --->

<cfset uploadDirectory = "C:\ColdFusion2023\cfusion\wwwroot\log\project\media\resumes">

<cffile action="upload" filefield="uploadfile" destination="#uploadDirectory#" nameconflict="makeunique">

<cfif cffile.fileWasSaved>
    <cfset fileName = cffile.serverfile>

    <cfquery datasource="recruitment" result="insertResult">
            INSERT INTO campus.file(
                student_id,
                file_name) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">,
                <cfqueryparam value='#fileName#'>
                )
        </cfquery>
        <cfoutput>File uploaded successfully!</cfoutput>
</cfif>