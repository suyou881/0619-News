<%@page import="com.study.model.news.News"%>
<%@page import="com.study.model.news.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	NewsDAO newsDAO = new NewsDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	String news_id=request.getParameter("news_id");
	String title=request.getParameter("title");
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	
	News news = new News();
	
	
	news.setTitle(title);
	news.setWriter(writer);
	news.setContent(content);
	
	int result=newsDAO.insert(news);
	
	if(result!=0){
		out.print("<script>");
		out.print("alert('sucess to regist');");
		out.print("location.href='/comments/list.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('fail to regist');");
		out.print("location.href='/comments/registForm.jsp';");
		out.print("</script>");
	}
%>