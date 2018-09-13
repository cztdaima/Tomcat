<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%

    String path = request.getContextPath();

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>



<%

           response.setCharacterEncoding("UTF-8");

           request.setCharacterEncoding("UTF-8");

           String id = request.getParameter("id");

           Connection conn = null;

           Statement stat = null;

           ResultSet rs = null;

           Class.forName("com.mysql.jdbc.Driver");

           String url = "jdbc:mysql://localhost:3306/weiyidata";

           String user = "root";

           String password = "";

           conn = DriverManager.getConnection(url,user,password);

           stat = conn.createStatement();

           rs = stat.executeQuery("select * from test where id=" + id + "");

%>

        <br>

        <h2>客户信息</h2>  <hr>

        <br>

        <h3>要修改的客户信息如下</h3>

        <table width="450" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt">

        <tr>

        <td>id</td>

        <td>param_name</td>

        <td>param_value</td>

        <td>remark</td>

        </tr>

        <%

        while(rs.next())

        {

        out.print("<tr>");

        out.print("<td>" + rs.getString("id") + "</td>");

        out.print("<td>" + rs.getString("param_name") + "</td>");

        out.print("<td>" + rs.getString("param_value") + "</td>");

        out.print("<td>" + rs.getString("remark") + "</td>");

        out.print("</tr>");


        %>

        </table>



        <br>

        <br>

        <h3>将客户信息更改为：</h3>

    <form action="doupdate.jsp" method="post" onSubmit="return validate()">

        <h4> id：<input type="text" name="id" value="<%=rs.getInt("id") %>" title="id不能改变" readonly="readonly"></input><br></h4>

    <h4>  param_name：<input type="text" name="param_name" title="name不能为空" ></input><br></h4>

    <h4>  param_value：<input type="text" name="param_value" title="value不能为空"></input><br></h4>

        <h4>  remark：<input type="text" name="remark" title="remark不能为空"></input><br></h4>


    <input type="submit" value="修改"/>

        </form>



        <br>

        <h3><a href=add.jsp>返回添加信息页面</a></h3>

    <h3><a href=index.jsp>返回主界面</a></h3>
<%
    }
%>


<%

  if(rs != null)

  {

      rs.close();

      rs = null;

  }

      if(stat != null)

  {

      stat.close();

      stat = null;

  }

      if(conn != null)

  {

      conn.close();

      conn = null;

  }

  %>



    </html>