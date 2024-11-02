
<cfset output = application.gain.getcriteria(id=url.id)>
<cfoutput query="output">
    <cfloop>
        <h1>Job Application Form</h1>
        <form>
            <div class="mb-3">
                <label for="company-name" class="form-label">Company Name</label>
                <input type="text" class="form-control" id="company-name" value="#output.industryname#" disabled>
            </div>
            <div class="mb-3">
                <label for="branch" class="form-label">Branch
                </label>
                <input type="text" class="form-control" id="branch" value="#output.branch#" disabled>
            </div>
            <div class="mb-3">
                <label for="cgpa" class="form-label">CGPA</label>
                <input type="number" step="0.01" class="form-control" id="cgpa" value="#output.minimum_cgpa#" disabled>
            </div>
            <div class="mb-3">
                <label for="skills-required" class="form-label">Skills Required</label>
                <input type="text" class="form-control" id="skills-required" value="#output.required_skills#" disabled>
            </div>
            <div class="mb-3">
                <label for="salary" class="form-label">Salary
                </label>
                <input type="number" class="form-control" id="salary" value="#output.salary#" disabled>
            </div>
            <div class="mb-3">
                <label for="industry-type" class="form-label">Industry Type</label>
                <input type="text" class="form-control" id="industry-type" value="#output.industry_type#" disabled>
            </div>
            <div class="mb-3">
                <label for="location" class="form-label">Location
                </label>
                <input type="text" class="form-control" id="location" value="#output.location#" disabled>
            </div>
            <div class="mb-3">
                <label for="role-category" class="form-label">Role Category</label>
                <input type="text" class="form-control" id="role-category" value="#output.category#" disabled>
            </div>
            <div class="mb-3">
                <label for="employment-type" class="form-label">Employment Type</label>
                 <input type="text" class="form-control" id="employment-type" value="#output.employment_type#" disabled>
            </div>
        </form>
    </cfloop>
</cfoutput>  