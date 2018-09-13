<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%

    String path = request.getContextPath();

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>


<center>

    <form name="fm" id="fm" method="post">
        id：<input type="text" name="id" class="{required:true}">
        <input type="button" name="btn1"onclick="document.fm.action='id_search.jsp';document.fm.submit();" value="id查找"/>

        <br>

        param_name：<input type="text" name="param_name" class="{required:true}">
        <input type="button" name="btn2"onclick="document.fm.action='param_name_search.jsp';document.fm.submit();" value="param_name查找"/>

        <br>

        param_name：<input type="text" name="param_value" class="{required:true}">
        <input type="button" name="btn3"onclick="document.fm.action='param_value_search.jsp';document.fm.submit();" value="param_value查找"/>

        <br>

        param_name：<input type="text" name="remark" class="{required:true}">
        <input type="button" name="btn4"onclick="document.fm.action='remark_search.jsp';document.fm.submit();" value="remark查找"/>



    </form>

    <a href="index.jsp">返回主界面</a>

</center>


</html>