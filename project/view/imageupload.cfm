
<!--- upload the students profile image names into database and storing the images in image folder --->

<cfset uploadDirectory = "C:\ColdFusion2023\cfusion\wwwroot\log\project\media\images">

<cffile action="upload" filefield="uploadfile" destination="#uploadDirectory#" nameconflict="makeunique">

<cfif cffile.fileWasSaved>
    <cfset imageName = cffile.serverfile>
    <cfquery name="gotimg" datasource="recruitment">
        select 
            student_id,
            image_name 
        from 
            campus.img 
        where 
            student_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
    </cfquery>
    <cfif gotimg.recordCount gt 0>

        <cfif fileExists("C:\ColdFusion2023\cfusion\wwwroot\log\project\media\images\#gotimg.image_name#")>
            <cffile action="delete" file="C:\ColdFusion2023\cfusion\wwwroot\log\project\media\images\#gotimg.image_name#">
        </cfif>
        <cfquery name="updateimg" datasource="recruitment">
            update 
                campus.img 
            set 
                image_name = <cfqueryparam value='#imageName#'> 
            where 
                student_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>
    <cfelse>
        <cfquery datasource="recruitment" result="insertResult">
            INSERT INTO campus.img (
                student_id,
                image_name) 
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">,
                <cfqueryparam value='#imageName#'>
                )
        </cfquery>
    </cfif>
    <cfoutput>File uploaded successfully!</cfoutput>
</cfif>