
<!--- Filter the details of students and companies by students and Recruiters --->
<!--- monitor the students detalis by Admin --->

<!DOCTYPE html>
<html>

	<head>
    	<meta charset="UTF-8">
      	<meta http-equiv="X-UA-Compatible" content="IE=edge">
      	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../media/hiring.png">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    	<link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/dataTables.bootstrap5.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    	<link rel="stylesheet" href="../css/Dashboardpage.css">
        <link rel="stylesheet" href="../css/studentDetalis.css"> 
    	<script src="../js/jquery.min.js"></script>
       	<script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/dataTables.js"></script>
        <script src="../js/dataTables.bootstrap5.js"></script> 
        <script src="../js/fontAwesome.js"></script>
         <script src="../js/studentsdetalisSearchpage.js"></script>
	</head>

    <body>
        <cfheader name="expires" value="#Now()#">
        <cfheader name="pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
        <cfif not isDefined('session.stLoggedInUser')>
            <cflocation url="http://localhost:8500/log/project/view/signinpage.cfm?noaccess" addtoken="no">
        </cfif> 
        <cfif session.stLoggedInUser.role eq 'ADMIN'>
            <cfinclude template = "Adminpages.cfm">
        <cfelseif session.stLoggedInUser.role eq 'RECRUITER'>
            <cfinclude template="Recruiterpages.cfm">
        <cfelse>
            <cfinclude template="Studentpages.cfm">
        </cfif> 
                <cfquery name="getcriteria" datasource="recruitment">
                    select 
                        cc.criteria_id,
                        ci.image_name,
                        cin.interview_date,
                        cin.interview_time,
                        cc.industryname,
                        cc.category,
                        cs.status_prop 
                    from 
                        campus.criteria as cc 
                    left join campus.img as ci on 
                        ci.student_id = cc.company_id
                    left join campus.interviews as cin on 
                        cin.vacancy_id = cc.criteria_id
                    left join campus.status as cs on
                        cin.interview_status = cs.status_id
                    where 
                        cc.company_id = #session.stLoggedInUser.roleid#
                </cfquery>
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid" >
                        <!--- recruiter or admin logged in if block of code will be execuited --->
                        <cfif session.stLoggedInUser.role eq 'RECRUITER'>
                           <div class="row g-6 mb-6">
                                <cfloop query="getcriteria">
                                    <div class="col-xl-3 col-sm-6 col-12 interviewcard" type="button" data-id="<cfoutput>#getcriteria.criteria_id#</cfoutput>">
                                        <div class="card shadow border-0"> 
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <cfset image = "../media/images/#getcriteria.image_name#">
                                                        <span class="h3 font-bold mb-0"><cfoutput>#getcriteria.industryname#</cfoutput>
                                                        </span>
                                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2"><cfoutput>#getcriteria.category#</cfoutput>
                                                        </span>
                                                    </div>
                                                    <div class="col-auto">
                                                        <img alt="Image Placeholder" src="<cfoutput>#image#</cfoutput>" class="avatar avatar- rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="mt-2 mb-0 text-sm">
                                                    <span class="h6 font-semibold text-muted text-sm d-block mb-2">Date : <cfoutput>#getcriteria.interview_date#</cfoutput>
                                                    </span>
                                                    <span class="text-nowrap text-xs text-muted">Time: <cfoutput>#getcriteria.interview_time#</cfoutput></span>
                                                    <span class="text-nowrap text-xs text-muted">status: <cfoutput>#getcriteria.status_prop#</cfoutput></span>
                                                </div>    
                                            </div>
                                        </div>
                                    </div> 
                                </cfloop>
                            </div>
                            <div class="container" id="recruitersearch">
                            </div>
                        <cfelseif session.stLoggedInUser.role eq 'ADMIN'>
                            <input type="text" id="uname" placeholder="enter student name..">
                            <input type="text" id="Branch" placeholder="enter Branch..">
                            <button type="button" onclick="filters()" id="button">Apply</button>
                            <table class="table table-striped" id="usertable" style="width:100%">
                                <thead >
                                    <tr>
                                        <th>Name</th>
                                        <th>Department</th>
                                        <th>Phone</th>
                                        <th>Email</th>
                                        <th>CGPA</th>
                                        <cfif session.stLoggedInUser.role eq 'RECRUITER'>
                                            <th></th>
                                        </cfif>
                                    </tr>
                                </thead>
                                <tbody>
                                                    
                                </tbody>
                            </table>

                            <!--- if student logged in then else block of code is executed --->
                        <cfelse>

                            <input type="text" id="industryname" placeholder="enter company name..">
                            <input type="text" id="Branch" placeholder="enter Branch..">
                            <input type="text" id="category" placeholder="enter category..">
                            <button type="button" onclick="filters()" id="button">Apply</button>
                            <table class="table table-striped" id="usertable" style="width:100%">
                                <thead >
                                    <tr>
                                        <th>Industry</th>
                                        <th>Category</th>
                                        <th>Interview Date</th>
                                        <th>Interview Time</th>
                                        <th>Department</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        
                                </tbody>
                            </table>
                        </cfif>        
                    </div>
                </main>
            </div>
        </div>
    </body>

</html>