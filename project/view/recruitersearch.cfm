

<!--- filter the student detalis --->
<cfparam name="url.id" default="-1">
<cfoutput>
 	<input type="text" id="uname" placeholder="enter student name..">
    <input type="text" id="Branch" placeholder="enter Branch..">
    <button type="button" onclick="filters()" id="button">Apply</button>
    <table class="table table-striped" id="usertable" data-criteria_id="#url.id#" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Department</th>
                <th>Phone</th>
                <th>Email</th>
                <th>CGPA</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
                            
        </tbody>
    </table>
</cfoutput>