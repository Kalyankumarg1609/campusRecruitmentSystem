
<!--- posting the company requirements in form by recruiter--->

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
        <script src="../js/Criteriapage.js"></script>		  
	</head>

	<body>
    
        <cfheader name="expires" value="#Now()#">
        <cfheader name="pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
        
        <cfif not isDefined('session.stLoggedInUser')>
            <cflocation url="http://localhost:8500/log/project/view/signinpage.cfm?noaccess" addtoken="no">
        </cfif> 
        
        <cfinclude template = "Recruiterpages.cfm">
            <main class="py-6 bg-surface-secondary" id="getcardsch">
                <div class="container-fluid" id="requirements">
                    <cfoutput>
                        <div class="container">
                            <h1>Job Application Form</h1>
                            <form>
                                <div class="mb-3">
                                    <label for="company-name" class="form-label">Company Name</label>
                                    <input type="text" class="form-control" id="company-name">
                                    <span id="companyNameError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="branch" class="form-label">Branch
                                    </label>
                                    <input type="text" class="form-control" id="branch">
                                    <span id="branchError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="cgpa" class="form-label">CGPA</label>
                                    <input type="number" step="0.01" class="form-control" id="cgpa">
                                    <span id="percentageError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="skills-required" class="form-label">Skills Required</label>
                                    <input type="text" class="form-control" id="skills-required" >
                                    <span id="skillsError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="salary" class="form-label">Salary
                                    </label>
                                    <input type="number" class="form-control" 
                                    id="salary" >
                                    <span id="salaryError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="industry-type" class="form-label">Industry Type</label>
                                    <input type="text" class="form-control" id="industry-type">
                                    <span id="industryError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="location" class="form-label">Location
                                    </label>
                                    <input type="text" class="form-control" 
                                    id="location">
                                    <span id="locationError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="role-category" class="form-label">Role Category</label>
                                    <input type="text" class="form-control" id="role-category">
                                    <span id="roleError" class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="employment-type" class="form-label">Employment Type</label>
                                    <cfquery datasource="recruitment" name="getemptype">
                                        select 
                                            employment_id,
                                            employment_type 
                                        from 
                                            campus.employment
                                    </cfquery>
                                    <select class="form-select" id="employment-type">
                                        <option value="">select employment type</option>
                                          <cfloop query="getemptype">
                                            <option value="<cfoutput>#getemptype.employment_id#</cfoutput>"><cfoutput>#getemptype.employment_type#</cfoutput></option>
                                          </cfloop>
                                    </select>
                                    <span id="employment_typeError" class="error"></span>
                                </div>
                                <button type="button" class="btn btn-primary" id="submit" data-id = #session.stLoggedInUser.roleid# >Submit</button>

                                <div class="col-md-6">
                                    <label for="picture" class="form-label">Upload Profile</label>
                                    <input type="file" class="form-control" id="picture" accept="image/*" > 
                                </div>
                                <button type="button" class="btn btn-primary"  
                                onclick='imageUpload(#session.stLoggedInUser.roleid#)'>Image-Upload
                                </button>
                            </form>
                        </div>
                    </cfoutput>          
                </div>
            </main>
            <!--- these 2 divs are endpoints of the Recruiterpages.cfm page divs --->
          </div>
        </div>
    </body>
</html>