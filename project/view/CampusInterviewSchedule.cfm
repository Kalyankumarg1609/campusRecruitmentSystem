
<!--- Admin needs to Schedule the interview for the company --->

<!DOCTYPE html>
<html>
	<head>
    	<meta charset="UTF-8">
      	<meta http-equiv="X-UA-Compatible" content="IE=edge">
      	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../media/hiring.png">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    	<link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    	<link rel="stylesheet" href="../css/Dashboardpage.css">
        <link rel="stylesheet" href="../css/Myprofilepage.css"> 
    	<script src="../js/jquery.min.js"></script>
       	<script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/fontAwesome.js"></script>
        <script src="../js/interviewSchedule.js"></script>
	</head>
    <body>
        <cfheader name="expires" value="#Now()#">
        <cfheader name="pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
        <cfif not isDefined('session.stLoggedInUser')>
            <cflocation url="http://localhost:8500/log/project/view/signinpage.cfm?noaccess" addtoken="no">
        </cfif> 
        <cfinclude template="../view/Adminpages.cfm">
                <cfquery name="criteriaQuery" datasource="recruitment">
                    SELECT  
                        im.image_name,
                        cc.industryname,
                        cc.category,
                        cc.location,
                        cc.salary,
                        cc.criteria_id
                    FROM 
                        campus.criteria as cc
                    left join campus.img as im on 
                        im.student_id = cc.company_id     
                </cfquery>        
                <main class="py-6 bg-surface-secondary" id="getcardsch">
                    <div class="container-fluid" id="requirements">
                        <!-- Card stats -->
                        <cfoutput>
                            <div class="row g-6 mb-6">
                                <cfloop query="criteriaQuery">
                                    <cfset imagepath = "../media/images/#criteriaQuery.image_name#">
                                    <div class="col-xl-3 col-sm-6 col-12">
                                        <div class="card shadow border-0"> 
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <span class="h3 font-bold mb-0">#criteriaQuery.industryname#</span>
                                                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">#criteriaQuery.category#</span>
                                                    </div>
                                                    <div class="col-auto">
                                                        <img alt="Image Placeholder" src="#imagePath#" class="avatar avatar- rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="mt-2 mb-0 text-sm">
                                                    <span class="h6 font-semibold text-muted text-sm d-block mb-2">location : #criteriaQuery.location#</span>
                                                    <span class="text-nowrap text-xs text-muted">salary: #criteriaQuery.salary#</span>
                                                    <button type="button" class="btn btn-primary inschedule" data-id="#criteriaQuery.criteria_id#">Schedule</button>
                                                    <!--- <i class="fa-regular fa-pen-to-square update" data-id="#criteriaQuery.criteria_id#"></i> --->
                                                </div>    
                                            </div>
                                        </div>
                                    </div>
                                </cfloop>
                            </div>
                            <div class="container d-none" id="intsch">

                            </div> 
                        </cfoutput>     
                    </div>      
                </main>
        <!--- these 2 divs are endpoints of the Adminpages.cfm page divs --->
            </div>
        </div>  
    </body>
</html>