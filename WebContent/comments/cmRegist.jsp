<%@page import="com.study.model.news.News"%>
<%@page import="com.study.model.news.CommentsDAO"%>
<%@page import="com.study.model.news.Comments"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	CommentsDAO commentsDAO = new CommentsDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	
	String news_id=request.getParameter("news_id");
	String msg=request.getParameter("msg");
	String cwriter=request.getParameter("cwriter");
	
	News news= new News();
	news.setNews_id(Integer.parseInt(news_id));

	
	Comments comments = new Comments();
	comments.setMsg(msg);
	comments.setCwriter(cwriter);
	
	comments.setNews(news);
	
	int result = commentsDAO.insert(comments);
	if(result!=0){
		out.print("<script>");
		out.print("alert('sucess to cm');");
		out.print("location.href='/comments/content.jsp?news_id="+news_id+"';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('fail to cm');");
		out.print("hitory.back();");
		out.print("</script>");
	}
%>
