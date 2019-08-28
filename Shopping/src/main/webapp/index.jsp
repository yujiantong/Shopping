<html>
<body>
<h2>Test</h2>
</body>

<form  action="/user/delUser"  method="post">

<input type="hidden" name="_method" value="DELETE">
  delete UserId :<input type="text" name="entityTypeId">
  <br />
  <input type="text" name="uuId">
  
  <input type="submit"> 
</form>
<br />
<%
    response.sendRedirect("/login");
%>

</html>
