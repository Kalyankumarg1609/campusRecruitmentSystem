
<!--- inserting registeration details into database --->
<cfset output = application.details.register(fname=form.Firstname, lname=form.Lastname, contact=form.phone,Email=form.Email, password=form.password, gender=form.gender, role= form.role)>

<cfoutput>#output#</cfoutput>