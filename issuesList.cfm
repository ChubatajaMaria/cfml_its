<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8"/>
    <title>Untitled Document</title>
    <link href="styles.css" rel="stylesheet" type="text/css"/>
  </head>

  <body>

    <h1>Issues List</h1>
    <cfquery name = "issuesList" datasource="db">
      SELECT *
      FROM issues AS t1 INNER JOIN statuses AS t2 (id, status_name) ON t1.state = t2.id
      ORDER BY created_timestamp DESC;
    </cfquery>

    <a href="form.cfm">
      Создать новый тикет
    </a>

    <table>
      <tr>
        <th>
          Title</th>
        <th>
          Status</th>
        <th>
          Link</th>

      </tr>
      <cfoutput query="issuesList">
        <tr>
          <td>
            #title#
          </td>
          <td>
            #status_name#
          </td>
          <td>
            <a href="issue.cfm?id=#id#">
              Подробнее
            </a>
          </td>
        </tr>
      </cfoutput>

    </table>
  </body>
</html>
