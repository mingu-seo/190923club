<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
<c:if test="${cmd == 'popclose'}">
alert('${msg}');
self.close();
</c:if> 

<c:if test="${cmd != 'popclose'}">
alert('${msg}');
location.href='${url}';
</c:if>
</script>