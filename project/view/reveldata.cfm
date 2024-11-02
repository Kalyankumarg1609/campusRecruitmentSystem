
<!--- sending data to database to insert into database table --->
<cfset output = application.gain.announce(id=url.id,attended=url.attended,selected=url.selected,rejected=url.rejected)>
<cfoutput>#output#</cfoutput>