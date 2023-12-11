<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
   <!-- Определение, как обрабатывать корневой элемент -->
  <xsl:template match="/numbers">
    
  <html>
  <head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'></meta>
    <title>Lr10_2</title>
    <meta name="viewport" content="width=device-width,initial-scale=1"></meta>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"></link>
    <style>
      .btn-primary {
      margin-top: 10px;
      }

      .my_form {
          border: 1px solid #dee2e6;
          border-radius: 0.375rem;
          padding: 10px;
      }

      div.view {
          border: 1px solid #dee2e6;
          border-radius: 0.375rem;
          padding: 0.375rem 0.75rem;
      }
    </style>
  </head>

    <body class="container-fluid">
      <h1>LuckyNumbersRequests#view</h1>

  <div class="col-4">
      <div class="my_form">
              <div class="view" id="view_numbers_count">Диапазон поиска счастливых чисел: <xsl:value-of select="/numbers/@numbers_count"/></div>
              <div class="view" id="view_response_type">Тип ответа: <xsl:value-of select="/numbers/@response_type"/></div>
              <form class="button_to" method="get" action="http://localhost:3001/lucky_numbers_requests/input"><button class="btn btn-primary" type="submit">Назад</button></form>
  </div>

  <table id="result_table" class="table">
    <tr>
      <th>Index</th>
      <th>Number</th>
    </tr>
    <!-- Применение шаблона для каждого элемента number -->
    <xsl:apply-templates select="number"/>
  </table>
  </div>
  </body>
  </html>
  </xsl:template>

  <!-- Шаблон для обработки каждого элемента number -->
  <xsl:template match="number">
    <tr>
      <!-- Получение значения атрибута id -->
      <td><xsl:value-of select="@id"/></td>
      <!-- Получение текстового содержимого элемента number -->
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
