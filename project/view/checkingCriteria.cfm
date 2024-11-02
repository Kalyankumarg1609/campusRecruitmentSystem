
<!--- check the requirements of company --->

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
        <script src="../js/checkCriteria.js"></script>		  
	</head>

	<body>
		<cfheader name="expires" value="#Now()#">
        <cfheader name="pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

        <cfinclude template="Studentpages.cfm">                     
                <!-- Main -->
                <cfquery name="getcriteria" datasource="recruitment">
                    select 
                    	cc.criteria_id,
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
                                <div class="col-xl-3 col-sm-6 col-12 criteriacheck" type="button" data-id="<cfoutput>#getcriteria.criteria_id#</cfoutput>">
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
                    </div>
                    <div class="container d-none"></div>
                </main>
                <!---  these 2 divs are endpoints of the Studentpages.cfm page divs  --->
            </div>
        </div>
	</body>