<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%

    String path = request.getContextPath();

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>



    <script type="text/javascript">

    function validate()// 功能验证

    {

    var id = document.forms[0].id.value;

    var param_name = document.forms[0].param_name.value;// 0为id号。

    var param_value = document.forms[0].param_value.value;

    var remark = document.forms[0].remark.value;


    if(id <= 0){

    alert("id不能为空！");

    return false;

    }

    else if(param_name.length <= 0){

    alert("name不能为空，请输入姓名！");

    return false;

    }

    else if(param_value <= 0){

    alert("请输入合法字符！");

    return false;

    }

    else if(remark.length <= 0){

    alert("remark不能为空！");

    return false;

    }

    else{

    return true;

    }



    }

    </script>



        <br>

        <center>

        <h2>添加学生信息</h2><hr>

        <form action="insert.jsp" method="post" id="form" onSubmit="return validate()" >

        <h4>  id：<input type="text" name="id" class="{required:true}"></input><br></h4>

    <h4>  param_name：<input type="text" name="param_name"></input><br></h4>

    <h4>  param_value：<input type="text" name="param_value"></input><br></h4>

    <h4>  remark：<input type="text" name="remark" ></input><br></h4>

    <input type="submit" value="提交"/>

        </form>

        <a href="index.jsp">查询信息</a>

        </center>

        </html>