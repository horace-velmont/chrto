<%@ page contentType="text/html; charset=euc-kr" %>
<jsp:useBean id = "memMgr" class = "ch10.RegisterMgrPool"/>
<%
	String memberId = "";
	String memberPw = "";
	if(request.getParameter("memberId") != null)
		memberId = request.getParameter("memberId");
	
	
	if(request.getParameter("memberPw") != null)
		memberPw = request.getParameter("memberPw");
	
	if(memMgr.passCheck(memberId, memberPw)){
		session.setAttribute("memID", memberId); //session�̸� memID�� �� memberId�� �ִ� ���� �־���
	
%>
	<script> 
	  alert("�α��� �Ǿ����ϴ�.");
      location.href="sessionLogInConfirm.jsp";
	</script>
<%	}else{ %>
	<script>
	  alert("�α��� ���� �ʾҽ��ϴ�.");
      location.href="sessionMemberLogIn.jsp";
	</script>
<%	}	%>