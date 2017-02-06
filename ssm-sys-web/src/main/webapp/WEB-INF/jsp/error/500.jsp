<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
  <title>500内部系统错误</title>
</head>
  
  <body class="error">
    <div class="title">
      <h1>
        500
      </h1>
    </div>
    <div class="actions">
      <div class="list-group">
        <li class="list-group-item list-group-header align-center">
          异常信息内容:${exception}
        </li>

        <a href="javascript:void(0);" class="list-group-item">
          <i class="icon-question">
          </i>
          Support
          <i class="icon-angle-right align-right">
          </i>
        </a>
        <a href="javascript:void(0);" class="list-group-item">
          <i class="icon-phone">
          </i>
          Call us
          <i class="icon-angle-right align-right">
          </i>
          <span class="badge">
            021-215-584
          </span>
        </a>
      </div>
    </div>
    <div class="footer">
      Melon - Flat &amp; Responsive Admin Template
      <br>
      &copy; 2013
    </div>

  </body>

</html>