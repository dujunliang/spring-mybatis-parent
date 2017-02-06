<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String contextPath = request.getContextPath();
    String basePath;
    if (request.getServerPort() == 80 || request.getServerPort() == 443) {
        basePath = "//" + request.getServerName() + contextPath + "/";
    } else {
        basePath = "//" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
    }
%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>

    <base href="<%=basePath%>">
    <meta charset="utf-8">


    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />


    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
    <![endif]-->
    <!--[if IE 8]>
    <link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
    <![endif]-->

    <link rel="stylesheet" type="text/css" href="assets/css/main.css"  >
    <link rel="stylesheet" type="text/css" href="assets/css/login.css">
    <link rel="stylesheet" type="text/css" href="assets/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">

    <link rel="stylesheet" type="text/css" href="plugins/bootstrap-switch/css/bootstrap-switch.css">

    <%--<link rel="stylesheet" type="text/css" href="assets/css/icons.css" >--%>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/css/fontawesome/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="plugins/jquery-dataTables-ext/Select/css/select.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="plugins/jquery-dataTables-ext/Buttons/css/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="plugins/jquery-dataTables-ext/Buttons/css/buttons.jqueryui.min.css">
    <link rel="stylesheet" type="text/css" href="plugins/jquery-dataTables-ext/Buttons/css/buttons.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="plugins/select2/css/select2.min.css">
    <%--<link rel="stylesheet" type="text/css" href="plugins/jQuery-Select2-4.0.1/css/select2.min.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="plugins/jQuery-Select2-4.0.1/css/select2-bootstrap.css">--%>
    <link rel="stylesheet" type="text/css" href="plugins/jquery-fancyBox-2.1.5/css/jquery.fancybox.css">
    <link rel="stylesheet" type="text/css" href="plugins/BootstrapValidator-0.5.2/css/bootstrapValidator.min.css">
    <link rel="stylesheet" type="text/css" href="plugins/ztree/css/metroStyle.css">

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="plugins/jQuery-2.1.4/jquery-2.1.4.min.js">
    </script>

    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
    </script>




    <!--[if lt IE 9]>
    <script type="text/javascript" src="plugins/flot/excanvas.min.js">
    </script>
    <![endif]-->





    <!--datatable-->



    <script type="text/javascript" src="assets/js/libs/breakpoints.js">
    </script>
    <script type="text/javascript" src="plugins/respond/respond.min.js">
    </script>
    <script type="text/javascript" src="plugins/cookie/jquery.cookie.min.js">
    </script>
    <script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.min.js">
    </script>
    <script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.horizontal.min.js">
    </script>



    <script type="text/javascript" src="plugins/select2/js/select2.full.min.js">
    </script>


    <script type="text/javascript" src="plugins/select2/prettify.min.js">
    </script>

    <%--<script type="text/javascript" src="plugins/select2/select2.min.js">--%>
    <%--</script>--%>
    <script type="text/javascript" src="plugins/noty/jquery.noty.js">
    </script>
    <script type="text/javascript" src="plugins/noty/layouts/top.js">
    </script>
    <script type="text/javascript" src="plugins/noty/layouts/center.js">
    </script>
    <script type="text/javascript" src="plugins/noty/themes/default.js">
    </script>

    <script type="text/javascript" src="assets/js/app.js">
    </script>
    <script type="text/javascript" src="assets/js/ssm.js">
    </script>
    <script type="text/javascript" src="assets/js/plugins.js">
    </script>
    <script type="text/javascript" src="assets/js/moudle.js">
    </script>


    <script type="text/javascript" src="assets/js/form_components.js">
    </script>


    <!--datatable-->
    <script type="text/javascript" src="plugins/jquery-dataTables/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables/dataTables.bootstrap.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Select/js/dataTables.select.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Buttons/js/dataTables.buttons.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Buttons/js/buttons.bootstrap.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Buttons/js/buttons.colVis.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Moment/datetime-moment.js">
    </script>
    <script type="text/javascript" src="plugins/datatables/ColVis.js">
    </script>
    <script type="text/javascript" src="plugins/datatables/TableTools.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Buttons/js/buttons.html5.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Buttons/js/buttons.print.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-dataTables-ext/Buttons/js/buttons.flash.min.js">
        </script>

    <script type="text/javascript" src="plugins/jquery-fancyBox-2.1.5/js/jquery.fancybox.pack.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-fancyBox-2.1.5/js/jquery.fancybox.js">
    </script>
    <%--<script type="text/javascript" src="plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js">--%>
    <%--</script>--%>

    <script type="text/javascript" src="plugins/BootstrapValidator-0.5.2/js/bootstrapValidator.min.js">
    </script>
    <script type="text/javascript" src="plugins/validation/jquery.validate.min.js">
    </script>

    <!--ztree-->
    <script type="text/javascript" src="plugins/ztree/jquery.ztree.all.min.js">
    </script>
    <script type="text/javascript" src="plugins/ztree/jquery.ztree.core.min.js">
    </script>
    <script type="text/javascript" src="plugins/ztree/jquery.ztree.excheck.min.js">
    </script>

    <script type="text/javascript" src="plugins/jsview/jsviews.js">
    </script>

    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.js">
    </script>

    <script type="text/javascript" src="plugins/tagsinput/jquery.tagsinput.min.js">
    </script>

    <script>

        var contextSelectPath = '${pageContext.request.contextPath}';

        $.fn.select2.defaults.set('placeholder', '請選擇...');

        $(document).ready(function() {
            App.init();
            Plugins.init();
            FormComponents.init()
        });

        var processParams = function (params, data) {
            return $.extend({}, {
                'params.keyword': params && params.term ? '%' + params.term + '%' : '',
                'pageNumber':  params.page || 1,
                'pageSize': 10
            }, data);
        };

    </script>



    <sitemesh:write property='head'/>
</head>
<body>
<sitemesh:write property='body'/>
</body>
</html>