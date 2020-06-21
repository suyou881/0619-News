<%@page import="com.study.model.news.NewsDAO"%>
<%@page import="com.study.model.news.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	NewsDAO newsDAO = new NewsDAO();
%>
<%
	List<News> newsList=newsDAO.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>News</title>
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
	positon:relative;
	left:-1500px;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
input{
	float:left;
	
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("table").animate({
		left:'0px'
	});
	
	$("input").click(function(){
		location.href="/comments/registForm.jsp";
	});
	
})
</script>


</head>
<body>
<h1 align="center">News</h1>
	<table width="100%" berder="1px">
	
		<tr>
			<td>NO</td>
			<td>title</td>
			<td>writer</td>
			<td>regdate</td>
			<td>hit</td>
		</tr>
		<%int total=newsList.size(); %>
		<%for(int i=0; i<newsList.size();i++){ %>
		<%News news=newsList.get(i); %>
		<tr>
			<td><%=total-- %></td>
			<td><a href="/comments/content.jsp?news_id=<%=news.getNews_id()%>"><%=news.getTitle()%>
			[<%=news.getCnt() %>]</a></td>
			<td><%=news.getWriter() %></td>
			<td><%=news.getRegdate().substring(0, 10) %></td>
			<td><%=news.getHit() %></td>
		</tr>
		<%} %>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<input type="button" value="regist"/>
			</td>
		</tr>
	</table>

</body>
</html>
