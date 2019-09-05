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
   function page(cpage) {
	$("[name='cpage']").val(cpage);
	$("#page").submit();
}

   function qx() {
	$("[name='pids']").each(function(){
         $(this).attr("checked",!$(this).attr("checked"))
		})
}

   function deleteAll() {
	$.post('deleteAll.do',$("#delete").serialize(),function(obj){ 
		if(obj>0){
           alert("删除成功");
           location="list.do";
			}else{
				alert("删除成功");
				
				}
		},'json')
}
   
</script>

<body>
<form action="list.do" method="post" id="page">
<input type="hidden" name="cpage" value="${page.pageNum }">
植物名称：<input type="text" name="pname" value="${map.pname}">
<input type="button" value="添加" onclick="location='toAdd.do'">
<button>查询</button>
</form>
<form action="deleteAll.do" method="post" id="delete">
<input type="button" value="批量删除" onclick="deleteAll()">

<table>
   <tr>
      <td><input type="checkbox" onclick="qx()">全选</td>
      <td>编号</td>
      <td>植物名称</td>
      <td>介绍</td>
      <td>种类</td>
      <td>操作</td>
   </tr>
   
   <c:forEach items="${findPlantList}" var="p">
    <tr>
      <td><input type="checkbox" name="pids" value="${p.pid}"></td>
      <td>${p.pid}</td>
      <td>${p.pname}</td>
      <td>${p.content}</td>
      <td>${p.tname}</td>
      <td>
         <input type="button" value="修改 "  onclick="location='toUpdate.do?pid=${p.pid}'">
         <input type="button" value="修改 "  onclick="location='toLook.do'">
      </td>
    </tr>      
   </c:forEach>
   <tr>
     <td colspan="6">
       <input type="button" value="首页" onclick="page('1')">
       <input type="button" value="上一页" onclick="page('${page.pageNum-1}')">
       <input type="button" value="下一页" onclick="page('${page.pageNum+1}')">
       <input type="button" value="尾页" onclick="page('${page.pages}')">
     </td>
   </tr>
</table>
</form>
</body>
</html>