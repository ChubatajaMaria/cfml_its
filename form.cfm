<cfif structKeyExists(form, 'fld_submitForm')>
  <cfquery datasource="db">
    INSERT INTO issues(user_id, title, description, emergency, critical)
    VALUES (1, '#form.fld_title#', '#form.fld_description#', #form.fld_emergency#, #form.fld_critical#);
  </cfquery>
  <cflocation
    url = "issuesList.cfm">
</cfif>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8"/>
    <title>Untitled Document</title>
  </head>

  <body>
    <cfquery name = "emergencyList" datasource="db">
      SELECT *
      FROM emergency
    </cfquery>
    <cfquery name = "criticalList" datasource="db">
      SELECT *
      FROM critical_levels
    </cfquery>

    <cfform id="frm_firstForm" name="frm_firstForm">
      <label for="fld_title">
        Title</label>
      <cfinput type="text" name="fld_title" id="fld_title" required="true"
      message="Please enter the issue title"/>

      <br>

      <label for="fld_description">
        Description</label>
      <cfinput type="text" name="fld_description" id="fld_description" required="true"
      message="Please enter the issue description"/>

      <br>

      <cfselect name="fld_emergency" query="emergencyList" value="id" display="name" />

      <br>

      <cfselect name="fld_critical" query="criticalList" value="id" display="name" />

      <br>

      <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Submit" />
    </cfform>
  </body>

</html>
