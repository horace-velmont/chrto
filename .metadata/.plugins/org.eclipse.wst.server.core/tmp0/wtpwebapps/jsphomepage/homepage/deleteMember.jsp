<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id = "regMgr" class = "ch10.RegisterMgrPool" scope = "page"/>

<%
	String id = request.getParameter("id");
	boolean result = regMgr.deleteMember(id);
	
	if(result){
%>
	<script>
			alert(" �����Ǿ����ϴ�.");
			location.href = "memberList.jsp";
	</script>
	
<%
	}else{
%>
		<script>
				alert(" ���� ����");
				history.back();
		</script>
<%
	}
%>

</body>
</html>