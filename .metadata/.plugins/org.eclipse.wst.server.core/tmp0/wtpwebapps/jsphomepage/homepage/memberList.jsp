<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*, ch10.*"%>
<html>
<head>
<title>회원목록</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align = "Center">
<br/>
<br/>
<h1>회원정보</h1>
<a href = "member.jsp">회원추가</a>
<br/><br/>

<table bordercolor="#0000ff" border="1">

<%--컬럼 이름--%>
<tr>
  <td><strong>ID</strong></td>
   
  <td><strong>NAME</strong></td>
  <td><strong>NUM1</strong></td>
  <td><strong>NUM2</strong></td>
  <td><strong>EMAIL</strong></td>
  <td><strong>PHONE</strong></td>
  <td><strong>ZIPCODE/ADDRESS</strong></td>
  <td><strong>JOB</strong></td>	
  <td><strong>수정</strong></td>
  <td><strong>삭제</strong></td>
</tr>

<jsp:useBean id="regMgr" class="ch10.RegisterMgrPool" scope="page" />

<%--sql에 있는 값을 백터로 전부 받아옴 --%>
<%
	Vector vlist = regMgr.getMemberList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
  		RegisterBean regBean = (RegisterBean)vlist.get(i);
%>


<%--각 컬럼에 해당하는 값 넣기 --%>
<tr>
<td><%=regBean.getId()%></td>
<td><%=regBean.getName()%></td>
<td><%=regBean.getNum1()%></td>
<td><%=regBean.getNum2()%></td>
<td><%=regBean.getEmail()%></td>
<td><%=regBean.getPhone()%></td>
<td><%=regBean.getZipcode()%>/<%=regBean.getAddress()%></td>
<td><%=regBean.getJob()%></td>
<td><a href = "modifyMember.jsp?id=<%=regBean.getId() %>">수정</a></td>
<td><a href = "deleteMember.jsp?id=<%=regBean.getId() %>"
	   onclick = "return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
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
이름 검색  : <input type = "text" name = "searchName"> <input type = "submit" value = "검색"> 
</form>
</div>
</body>
</html>