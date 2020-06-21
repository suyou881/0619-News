<%@page import="com.study.model.news.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	NewsDAO newsDAO = new NewsDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	String news_id=request.getParameter("news_id");
	
	int result = newsDAO.delete(Integer.parseInt(news_id));
	
	if(result!=0){
		out.print("<script>");
		out.print("alert('sucess to delete');");
		out.print("location.href='/comments/list.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('fail to delete');");
		out.print("history.back();");
		out.print("</script>");
	}
%>