<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifpr.teste.Teste" %>
<%@ page import="java.sql.*" %>
<%
  List<String> lista = new Teste().listarContatos();

  Connection connection = null;
  ResultSet resultSet = null;

  try {

    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    connection = DriverManager.getConnection("jdbc:mysql://localhost/agenda", "root", "root");
    PreparedStatement statement = connection.prepareStatement("SELECT * FROM contatos");
    resultSet = statement.executeQuery();
    System.out.println("Log: Conectado");

    while (resultSet.next()){

      System.out.println(resultSet.getString("nome"));

    }

    connection.close();


  } catch (SQLException e) {
    e.printStackTrace();
  }

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Agenda de Contatos</title>
  </head>
  <body>

    <%
      System.out.println("system print teste");
      out.println("println teste");
    %>

    <h1>lista scriptlet</h1>
    <%
      out.println(lista.get(0));
      out.println(lista.get(1));
      out.println(lista.get(2));
      out.println(lista.get(3));
    %>

    <h1>lista scriptlet 2</h1>

    <table>
    <%
      for (String nome: lista) {
        out.println("<tr>");
        out.println("<td>");
        out.println(nome);
        out.println("</td>");
        out.println("</tr>");
      }
    %>
    </table>

    <h1>lista scriptlet 3</h1>
    <table>
    <% for (String nome: lista) { %>
      <tr>
        <td><%= nome %></td>
      </tr>
    <%}%>
    </table>

  </body>
</html>
