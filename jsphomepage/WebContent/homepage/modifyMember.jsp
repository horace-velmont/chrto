<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, ch10.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����</title>
<script>
    function send(){
        var id  = document.getElementById("id").value;
        var pw = document.getElementById("passwd").value;
        var name = document.getElementById("name").value;
        /*
         -> ID�� ���翩�� Ȯ�� 
         -> ID�� ������ ���â ���(id �Է� �ʵ忡 ��Ŀ�� ����)
        */
        if(id.trim() == '') {
            alert('���̵� �Է����� �ʾҽ��ϴ�.');
            document.getElementById("id").focus();
            return false;
        }
        
        /*
        -> PWD�� ���翩�� Ȯ�� 
        -> PWD�� ������ ���â ���(PWD �Է� �ʵ忡 ��Ŀ�� ����)
        */
        if(pw.trim() == '') {
            alert('�н����带 �Է����� �ʾҽ��ϴ�.');
            document.getElementById("passwd").focus();
            return false;
        }
        
        if(name.trim() == '') {
            alert('�̸��� �Է����� �ʾҽ��ϴ�.');
            document.getElementById("name").focus();
            return false;
        }
        
        return true;
        
    }
 
</script>


</head>
<body>
<jsp:useBean id="regMgr" class="ch10.RegisterMgrPool" scope="page" />
<%
	Vector vlist = regMgr.getMemberList();
	int counter = vlist.size();
	String getid = request.getParameter("id");
	for(int i=0; i<vlist.size(); i++){
  		RegisterBean regBean = (RegisterBean)vlist.get(i);
  		if(getid.equals(regBean.getId())){
%>



<form id="form"  method="post" action="modifyMemberProc.jsp" onsubmit="return send();">
	<table border=1 cellpadding=7 cellspacing=0 >
		<tr>
			<td bgcolor=lightyellow>���̵� </td> 
    		<td align=left><input type="text" name="id"  maxlength=20 value = <%=regBean.getId() %> id = "id"></td>
    	</tr>
		<tr>
			<td bgcolor=lightyellow>�н����� </td> 
   			<td align=left><input type="password" name="passwd"  maxlength=20 value = <%=regBean.getPasswd() %> id = "passwd"></td>
   		</tr>
		<tr>
			<td bgcolor=lightyellow>�̸� </td> 
   			<td align=left><input type="text" name="name"  maxlength=20 value = <%=regBean.getName() %> id = "name"></td>
   		</tr>
		<tr>
			<td bgcolor=lightyellow>num1</td>
    		<td align=left><input type="text" name="num1"  maxlength=7 value = <%=regBean.getNum1() %>></td>
    	</tr>
		<tr>
			<td bgcolor=lightyellow>num2 </td>
   			<td align=left><input type="text" name="num2"  maxlength=7 value = <%=regBean.getNum2()%>></td>
   		</tr>
		<tr>
			<td bgcolor=lightyellow>�̸��� </td>
   			<td align=left><input type="text" name="email" maxlength=30 size=40 value = <%=regBean.getEmail()%>></td>
   		</tr>
		<tr>
			<td bgcolor=lightyellow>��ȭ��ȣ </td>
  			<td align=left><input type="text" name="phone" maxlength=30 value = <%=regBean.getPhone()%>></td>
  		</tr>
		<tr>
			<td bgcolor=lightyellow>������ȣ</td>
  			<td align=left><input type="text" name="zipcode" maxlength=7 value = <%=regBean.getZipcode()%>></td>
  		</tr>
		<tr>
			<td bgcolor=lightyellow>�ּ� </td>
   			<td align=left><input type="text" name="address" maxlength=30 size=60 value = <%=regBean.getAddress()%>></td>
   		</tr>
		<tr>
			<td bgcolor=lightyellow>���� </td>
  			<td align=left><input type="text" name="job" maxlength=30 size=40 value = <%=regBean.getJob()%>></td>
  		</tr>
		<tr>
			<td colspan=2 align=center><input type="submit" value="�����ϱ�" > 
   			<input type="reset" value="���"></td></tr>
<%
  		}
	}
%>
	</table>
</form>
</body>
</html>