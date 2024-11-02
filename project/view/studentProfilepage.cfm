
<!--- student profile form page --->
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
        <script src="../js/studentprofilepage.js"></script>		  
	</head>
	<body>
        <cfheader name="expires" value="#Now()#">
        <cfheader name="pragma" value="no-cache">
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
        <cfif not isDefined('session.stLoggedInUser')>
            <cflocation url="http://localhost:8500/log/project/view/signinpage.cfm?noaccess" addtoken="no">
        </cfif> 
        <cfinclude template = "Studentpages.cfm">
        <cfquery name = 'obtain' datasource="recruitment">

            select 
              firstname,
              lastname,
              phone,
              email,
              gender,
              id
            from 
              campus.users 
            where 
              id = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.stLoggedInUser.roleid#">
        
        </cfquery>
                <main class="py-6 bg-surface-secondary" id="getcardsch">
                    <div class="container-fluid" id="requirements">
                        <cfoutput query='obtain'>
                          <div class="container">
                            <h1>Student Detalis Form</h1>
                            <form>
                              <div class="row">
                                <div class="col-md-6">
                                  <label for="firstname" class="form-label">First Name</label>
                                  <input type="text" class="form-control" id="firstname" value="#obtain.firstname#" disabled>
                                </div>
                                <div class="col-md-6">
                                  <label for="lastname" class="form-label">Last Name</label>
                                  <input type="text" class="form-control" id="lastname" value="#obtain.lastname#" disabled>
                                </div>
                              </div>
                              <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" value="#obtain.phone#" disabled>
                              </div>
                              <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" value="#obtain.email#" disabled >
                              </div>
                              <div class="row">
                                <div class="col-md-6">
                                  <label for="gender" class="form-label">Gender</label>
                                  <input type="text" class="form-control" id="gender" value="#obtain.gender#" disabled>
                                </div>
                                <div class="col-md-6">
                                  <label for="year" class="form-label">year of passing</label>
                                  <input type="number" class="form-control" id="year" >
                                  <span id="yearError" class="error"></span>
                                </div>
                                <div class="col-md-6">
                                  <label for="branch" class="form-label">Branch</label>
                                  <select class="form-control" id="branch" >
                                    <option value="">select Branch</option>
                                    <option value="CSE">CSE</option>
                                    <option value="ECE">ECE</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MECH">MECH</option>
                                  </select>
                                  <span id="branchError" class="error"></span>
                                </div>
                                <div class="col-md-6">
                                  <label for="cgpa" class="form-label">CGPA</label>
                                  <input type="text" class="form-control" id="cgpa">
                                  <span id="percentageError" class="error"></span>
                                </div>
                              </div>
                              <div class="mb-3">
                                <label for="skills" class="form-label">Skills</label>
                                <textarea class="form-control" id="skills" rows="3"></textarea>
                                <span id="skillsError" class="error"></span>
                              </div>
                              <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <textarea class="form-control" id="address" rows="3"></textarea>
                                <span id="addresssError" class="error"></span>
                              </div>
                              <button type="button" class="btn btn-primary" id="myprofile" data-id=#obtain.id#>Submit</button>

                              <div class="col-md-6">
                                <label for="picture" class="form-label">Upload Picture</label>
                                <input type="file" class="form-control" id="picture" accept="image/*" >
                                
                              </div>
                                <button type="button" class="btn btn-primary" onclick='imageUpload(#obtain.id#)'>Image Upload</button>

                              <div class="col-md-6">
                                <label for="resume" class="form-label">Upload Resume</label>
                                <input type="file" class="form-control" id="resume" accept=".pdf,.doc,.docx"> 
                              </div>
                                <button type="button" class="btn btn-primary" onclick='fileupload(#obtain.id#)'>File Upload</button>

                            </form>
                          </div>
                        </cfoutput>           
                    </div>
                </main>
            </div>
        </div>
        
    </body>
</html>