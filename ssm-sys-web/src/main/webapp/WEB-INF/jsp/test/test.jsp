<%--
  Created by IntelliJ IDEA.
  User: dujunliang
  Date: 16/12/13
  Time: 下午4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>用戶新增</title>

</head>

<body>

<select class="js-basic-multiple js-states form-control" id="id_label_multiple" multiple="multiple"></select>

<script type="text/javascript">
    var data1 = [{ id: 0, text: 'enhancement' }, { id: 1, text: 'bug' }, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }];

    //    $("#id_label_single").select2({
    //        placeholder: "Select a state",
    //        allowClear: true,
    //        data: data1
    //    });
    $(".js-basic-multiple").select2({
        placeholder: "Select a state",
        data:data1
    });

    //    $(".js-example-data-array-selected").select2({
    //        data: data
    //    })
</script>

<script type="text/javascript">

    $(function () {



    });
</script>
</body>

</html>
