<cfif structKeyExists(form, 'fld_submitForm')>
  <cfif #form.fld_submitForm# EQ "Открыть">
    <cfset target_state=2/>
  <cfelseif #form.fld_submitForm# EQ "Решить">
    <cfset target_state=3/>
  <cfelse>
    <cfset target_state=4/>

  </cfif>
  <cfquery datasource="db">
    UPDATE issues SET state = #target_state# WHERE id = #url.id#;
  </cfquery>
</cfif>

<cfquery name = "issue" datasource="db">
  SELECT *
  FROM issues AS t1 INNER JOIN statuses AS t2 (id, status_name) ON t1.state = t2.id
  WHERE t1.id = #url.id#
</cfquery>
<cfoutput query="issue">

  <h1>
    #title#</h1>
  <h2>
    #status_name#</h2>
  <cfform id="frm_chngState" name="frm_chngState">
    <cfif #state# EQ 1>
      <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Открыть"/>
    <cfelseif #state# EQ 2>
      <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Решить"/>
    <cfelseif #state# EQ 3>
      <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Открыть"/>
      <input type="submit" name="fld_submitForm" id="fld_submitForm" value="Закрыть"/>
    </cfif>
  </cfform>

  <p>
    #description#</p>
</cfoutput>
<a href="issuesList.cfm">
  На главную</a>
