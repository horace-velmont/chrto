<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*, ch10.*"%>
<html>
<head>
<title>ȸ�����</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align = "Center">
<br/>
<br/>
<h1>ȸ������</h1>
<a href = "member.jsp">ȸ���߰�</a>
<br/><br/>

<table bordercolor="#0000ff" border="1">

<%--�÷� �̸�--%>
<tr>
  <td><strong>ID</strong></td>
   
  <td><strong>NAME</strong></td>
  <td><strong>NUM1</strong></td>
  <td><strong>NUM2</strong></td>
  <td><strong>EMAIL</strong></td>
  <td><strong>PHONE</strong></td>
  <td><strong>ZIPCODE/ADDRESS</strong></td>
  <td><strong>JOB</strong></td>	
  <td><strong>����</strong></td>
  <td><strong>����</strong></td>
</tr>

<jsp:useBean id="regMgr" class="ch10.RegisterMgrPool" scope="page" />

<%--sql�� �ִ� ���� ���ͷ� ���� �޾ƿ� --%>
<%
	Vector vlist = regMgr.getMemberList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
  		RegisterBean regBean = (RegisterBean)vlist.get(i);
%>


<%--�� �÷��� �ش��ϴ� �� �ֱ� --%>
<tr>
<td><%=regBean.getId()%></td>
<td><%=regBean.getName()%></td>
<td><%=regBean.getNum1()%></td>
<td><%=regBean.getNum2()%></td>
<td><%=regBean.getEmail()%></td>
<td><%=regBean.getPhone()%></td>
<td><%=regBean.getZipcode()%>/<%=regBean.getAddress()%></td>
<td><%=regBean.getJob()%></td>
<td><a href = "modifyMember.jsp?id=<%=regBean.getId() %>">����</a></td>
<td><a href = "deleteMember.jsp?id=<%=regBean.getId() %>"
	   onclick = "return confirm('���� �����Ͻðڽ��ϱ�?');">����</a></td>
<%
   	}
%>
</tr>
</table>
<br/>
<br/>
total records : <%=counter%> 
<br/><br/>
<form name="searchMemberFrm"  method="post" action="searchMember.jsp">
�̸� �˻�  : <input type = "text" name = "searchName"> <input type = "submit" value = "�˻�"> 
</form>
</div>
</body>
</html>