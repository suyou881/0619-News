<%@page import="com.study.model.news.News"%>
<%@page import="com.study.model.news.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	NewsDAO newsDAO = new NewsDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	String news_id = request.getParameter("news_id");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	News news = new News();
	news.setNews_id(Integer.parseInt(news_id));
	news.setTitle(title);
	news.setWriter(writer);
	news.setContent(content);
	
	int result = newsDAO.edit(news);
	
	if(result!=0){
		out.print("<script>");
		out.print("alert('sucess to edit');");
		//out.print("location.href='/comments/content.jsp?news_id=';");
		out.print("location.href='/comments/content.jsp?news_id="+news_id+"';");
		out.print("</script>");

	}else{
		out.print("<script>");
		out.print("alert('fail to edit');");
		out.print("location.href='/comments/list.jsp';");
		out.print("</script>");
	}
	
%>