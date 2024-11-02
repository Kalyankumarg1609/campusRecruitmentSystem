
<!--- Opening Dashboard page for Admin, Students and Recruiter --->

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
        <link rel="stylesheet" href="../css/Myprofilepage.css">
    	<script src="../js/jquery.min.js"></script>
       	<script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/dataTables.js"></script>
        <script src="../js/dataTables.bootstrap5.js"></script> 
        <script src="../js/fontAwesome.js"></script>
        <script src="../js/Dashboardpage.js"></script>		  
	</head>

	<body>
        <cfheader name="expires" value="#Now()#">
        <cfheader name="pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
        
        <cfif not isDefined('session.stLoggedInUser')>
            <cflocation url="http://localhost:8500/log/project/view/signinpage.cfm?noaccess" 
            addtoken="no">
        </cfif> 

        <!--- Admin dashboard --->
        <cfif session.stLoggedInUser.role eq 'ADMIN'>
            <cfinclude template="Adminpages.cfm">
                <cfquery name="getcriteria" datasource="recruitment">
                    select 
                        cc.branch,
                        count(cc.student_id) 
                    from 
                        campus.educationdetalis as cc 
                    group by
                        cc.branch
                </cfquery>
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <!-- Card stats -->
                        <div class="row g-6 mb-6">
                            <cfloop query="getcriteria">
                                <div class="col-xl-3 col-sm-6 col-12">
                                    <div class="card shadow border-0"> 
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col">
                                                    <cfif '#getcriteria.branch#' eq 'CSE'>
                                                        <cfset img = "../media/cse.jpeg">
                                                    <cfelseif '#getcriteria.branch#' eq 'ECE'>
                                                        <cfset img = "../media/ece.jpg">
                                                    <cfelseif '#getcriteria.branch#' eq 'EEE'>
                                                        <cfset img = "../media/eee.jpeg">
                                                    <cfelseif '#getcriteria.branch#' eq 'MECH'>
                                                        <cfset img = "../media/mech.png">
                                                    </cfif>
                                                    <span class="h1 font-bold mb-0"><cfoutput>#getcriteria.count#</cfoutput></span>
                                                    <span class="h6 font-semibold text-muted text-sm d-block mb-2">Total <cfoutput>#getcriteria.branch#
                                                    </cfoutput> Students</span>
                                                </div>
                                                <div class="col-auto">
                                                    <img alt="Image Placeholder" src="<cfoutput>#img#</cfoutput>" class="avatar avatar- rounded-circle">
                                                </div>
                                            </div>
                                             
                                        </div>
                                    </div>
                                </div> 
                            </cfloop>
                        </div>
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Applications</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Branch</th>
                                            <th scope="col">company</th>
                                            <th scope="col">salary</th>
                                            <th scope="col">year of passed</th>
                                            <th scope="col">category</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabledata">
                                            
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!--- these 2 divs are endpoints of the Adminpages.cfm page divs  --->
              </div>
            </div>
        
        <!--- student dashboard --->
        <cfelseif session.stLoggedInUser.role eq 'STUDENT'>
            <cfinclude template="Studentpages.cfm">                     
                <!-- Main -->
                <cfquery name="getcriteria" datasource="recruitment">
                    select 
                        ci.image_name,
                        cin.interview_date,
                        cin.interview_time,
                        cc.industryname,
                        cc.category 
                    from 
                        campus.criteria as cc 
                    left join campus.img as ci on 
                        ci.student_id = cc.company_id
                    left join campus.interviews as cin on 
                        cin.vacancy_id = cc.criteria_id
                    limit 4
                </cfquery>
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <!-- Card stats -->
                        <div class="row g-6 mb-6">
                            <cfloop query="getcriteria">
                                <div class="col-xl-3 col-sm-6 col-12">
                                    <div class="card shadow border-0"> 
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col">
                                                    <cfset image = "../media/images/#getcriteria.image_name#">
                                                    <span class="h3 font-bold mb-0"><cfoutput>#getcriteria.industryname#</cfoutput></span>
                                                    <span class="h6 font-semibold text-muted text-sm d-block mb-2"><cfoutput>#getcriteria.category#</cfoutput></span>
                                                </div>
                                                <div class="col-auto">
                                                    <img alt="Image Placeholder" src="<cfoutput>#image#</cfoutput>" class="avatar avatar- rounded-circle">
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 text-sm">
                                                <span class="h6 font-semibold text-muted text-sm d-block mb-2">Date : <cfoutput>#getcriteria.interview_date#</cfoutput></span>
                                                <span class="text-nowrap text-xs text-muted">Time: <cfoutput>#getcriteria.interview_time#</cfoutput></span>
                                            </div>    
                                        </div>
                                    </div>
                                </div> 
                            </cfloop>
                        </div>
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">students selected in top companies</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Branch</th>
                                            <th scope="col">company</th>
                                            <th scope="col">salary</th>
                                            <th scope="col">year of passed</th>
                                            <th scope="col">category</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabledata">
                                            
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!--- these 2 divs are endpoints of the Studentpages.cfm page divs  --->
              </div>
            </div>
        
        <!--- recruiter dashboard --->
        <cfelseif session.stLoggedInUser.role eq 'RECRUITER'>
            <cfinclude template="Recruiterpages.cfm">
                <!-- Main -->
                <cfquery name="getcriteria" datasource="recruitment">
                    select 
                        cc.industryname,
                        cc.category,
                        count(cs.candidate_id) as count
                    from 
                        campus.selectedstudents as cs
                    left join campus.criteria as cc on 
                        cc.company_id = cs.recruit_id
                    where 
                        cs.recruit_id = #session.stLoggedInUser.roleid# and 
                        cs.criteria = cc.criteria_id
                       
                    group by
                        cc.industryname,
                        cc.category,
                        cs.criteria
                </cfquery>
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <!-- Card stats -->
                        <div class="row g-6 mb-6">
                            <cfloop query="getcriteria">
                                <div class="col-xl-3 col-sm-6 col-12">
                                    <div class="card shadow border-0"> 
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col">
                                                    <span class="h3 font-bold mb-0"><cfoutput>#getcriteria.count#</cfoutput></span>
                                                    <span class="h6 font-semibold text-muted text-sm d-block mb-2">Total students selected</span>
                                                </div>
                                                <div class="col-auto">
                                                    <img alt="Image Placeholder" src="<cfoutput>#imagePath#</cfoutput>" class="avatar avatar- rounded-circle">
                                                </div>
                                            </div>
                                            <div class="mt-2 mb-0 text-sm">
                                                <span class="h6 font-semibold text-muted text-sm d-block mb-2"><cfoutput>#getcriteria.industryname#</cfoutput></span>
                                                <span class="text-nowrap text-xs text-muted"><cfoutput>#getcriteria.category#</cfoutput></span>
                                            </div>    
                                        </div>
                                    </div>
                                </div> 
                            </cfloop>
                        </div>
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Applications</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Branch</th>
                                            <th scope="col">company</th>
                                            <th scope="col">salary</th>
                                            <th scope="col">year of passed</th>
                                            <th scope="col">category</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tabledata">
                                            
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!--- these 2 divs are endpoints of the Recruiterpages.cfm page divs  --->
              </div>
            </div>
        </cfif>
	</body>
    
</html>
