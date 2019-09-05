<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/index_work.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.8.2.min.js">
</script>
<script type="text/javascript">
  $(function(){
      var tid='${plant.tid}'
	  
	  $.post('getTypeList.do',function(obj){
         var select=$("[name='tid']");
         select.append('<option value="0">--请选择--</option>');
         for(var i in obj){
        	 select.append('     <option value="'+obj[i].tid+'">'+obj[i].tname+'</option>');
             }
         select.val(tid);
		  },'json')

 $("#xg").click(function(){
		 $.post('update.do',$("form").serialize(),function(obj){
               if(obj>0){
                   alert("修改成功")
                     location="list.do";
                       }else{
                    	   alert("修改失败")
                           }
               
			 },'json')
		 })

			  })
	  
	
</script>
<body>
    <form action="" method="post">
    <input type="hidden" name="pid" value="${plant.pid}">
    植物名称：<input type="text" name="pname" value="${plant.pname}"><br>
    描述：<input type="text" name="content" value="${plant.content}"><br>
    类别：<select name="tid">
    </select>
<br>
    <input type="button" value="修改" id="xg"> 
    </form>
</body>
</html>