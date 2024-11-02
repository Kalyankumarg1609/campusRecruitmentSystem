
<!--- common page for student actions --->
<div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
    <!-- Vertical Navbar -->
    <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
        <div class="container-fluid">
            <!-- Toggler -->
            <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- User menu (mobile) -->
            <div class="navbar-user d-lg-none">
                <!-- Dropdown -->
                <div class="dropdown">
                    <!-- Toggle -->
                    <a id="sidebarAvatar" role="button" data-bs-toggle="dropdown" 
                    aria-haspopup="true" aria-expanded="false">
                        <div class="avatar-parent-child">
                            <cfquery name="getimg" datasource="recruitment">
                                select 
                                    image_name 
                                from 
                                    campus.img 
                                where 
                                    student_id=#session.stLoggedInUser.roleid#
                            </cfquery>
                            <cfif getimg.image_name eq "">
                                <cfset imagepath = "../media/user.png">
                            <cfelse>
                                <cfset imagepath = "../media/images/#getimg.image_name#">
                            </cfif>
                            <img alt="<cfoutput>#getimg.image_name#</cfoutput>" src="<cfoutput>#imagePath#</cfoutput>" class="avatar avatar- rounded-circle">
                            <span class="avatar-child avatar-badge bg-success"></span>
                        </div>
                    </a>
                </div>
            </div>
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidebarCollapse">
                <!-- Navigation -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Dashboardpage.cfm">
                            <i class="fa-solid fa-house"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item" >
                        <a href="../view/studentProfilepage.cfm" class="nav-link" id="profile">
                            <i class="fa-solid fa-user"></i> My Profile
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../view/detalisSearch.cfm" class="nav-link" id="searchdet">
                            <i class="fa-solid fa-magnifying-glass"></i> Search                                            
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../view/checkingCriteria.cfm" class="nav-link" id="searchdet">
                            <i class="fa-regular fa-clipboard"></i> Criteria Check                                            
                        </a>
                    </li>
                                    
                </ul>
                <!-- Divider -->
                <hr class="navbar-divider my-5 opacity-20">
                <!-- Navigation -->
                <ul class="navbar-nav mb-md-4">
                    <li>
                        <a class="nav-link d-flex align-items-center">
                            <div class="me-4">
                                <div class="position-relative d-inline-block text-white">
                                    <img alt="Image Placeholder" src="<cfoutput>#imagePath#</cfoutput>" class="avatar rounded-circle">
                                </div>
                            </div>
                            <div>
                                <span class="d-block text-sm font-semibold">
                                                <cfoutput>#session.stLoggedInUser.username#</cfoutput>   
                                </span>
                            </div>
                        </a>
                    </li>
                                    
                </ul>
                <!-- Push content down -->
                <div class="mt-auto"></div>
                <!-- User (md) -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" onclick="logout()">
                            <i class="fa-solid fa-right-from-bracket"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main content -->
    <div class="h-screen flex-grow-1 overflow-y-lg-auto">
        <!-- Header -->
        <header class="bg-surface-primary border-bottom pt-6">
            <div class="container-fluid">
                <div class="mb-npx">
                    <div class="row align-items-center">
                        <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                            <!-- Title -->
                            <h1 class="h2 mb-0 ls-tight"><cfoutput>#session.stLoggedInUser.username#</cfoutput></h1>
                            <h6 class="h2 mb-0 ls-tight" style='font-size: 15px;'><cfoutput>#session.stLoggedInUser.role#</cfoutput></h6>
                        </div>     
                    </div>
                </div>
            </div>
        </header>