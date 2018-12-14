
<%@ page  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>

<c:forEach items="${requestScope.list}" var="p">
    <h1>${p.id}</h1>
    <h2>${p.name}</h2>
    <h3>${p.salary}</h3>
    <h4>${p.age}</h4>

</c:forEach>
</body>
</html>