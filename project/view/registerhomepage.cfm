
<!---  --->
<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Responsive Page</title>
      <link rel="icon" href="../media/hiring.png">
      <link rel="stylesheet" href="../css/bootstrap.css">
      <link rel="stylesheet" href="../css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
      <link rel="stylesheet" href="../css/registerhomepage.css">
      <script src="../js/jquery.min.js"></script>
      <script src="../js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
      <cfquery name="roleDetails" datasource="recruitment">
        select 
          role_id 
        from 
          campus.role
      </cfquery>
      <cfoutput>
        <cfset recruiter_id = #roleDetails.role_id[1]#>
        <cfset student_id = #roleDetails.role_id[2]#>
        <div class="container-fluid">
          <div class="row">
            <!-- Left Side - Recruiter Registration -->
            <div class="col-md-6 bg-light p-5">
              <h2>Recruiter Registration</h2>
              <p>Companies accessing student profiles and posting job opportunities.Companies list openings, manage applications, and schedule interviews.</p>
              <button class="btn btn-primary" onclick='window.location.href = "../view/registerationpage.cfm?id=#recruiter_id#"'>Register</button>
            </div>

            <!-- Right Side - Student Registration -->
            <div class="col-md-6 bg-info p-5">
              <h2>Student Registration</h2>
              <p>Students create detailed profiles showcasing skills and achievements. Access to job listings, applications, and interview scheduling.Updates on application status and interview invitations.</p>
              <button class="btn btn-light" onclick='window.location.href = "../view/registerationpage.cfm?id=#student_id#"'>Register</button>
            </div>
          </div>
        </div>
      </cfoutput>
    </body>

</html>
