<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Hans角色信息管理页面</title>

</head>

<body style="height: 100%">

<div class="crumbs" style="margin-left: 2px">
    <ul id="breadcrumbs" class="breadcrumb">
        <li>
            <i class="icon-home">
            </i>
            <a href="index.html">
                系统管理
            </a>
        </li>
        <li class="current">
            <a href="pages_calendar.html" title="">
                角色管理
            </a>
        </li>
    </ul>
</div>
<div class="container" style="margin-top: 20px;width: 100%">
    <div class="row">
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4><i class="icon-reorder"></i> 角色管理</h4>

                    <div class="toolbar no-padding">
                        <div class="btn-group"><span class="btn btn-xs widget-collapse">  <i
                                class="icon-angle-down"> </i> </span></div>
                    </div>
                </div>
                <div class="widget-content">

                    <form id="form" class="form-horizontal form-group-sm">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                角色名称
                            </label>

                            <div class="col-sm-3">
                                <input type="text" name="rolename" class="form-control">
                            </div>
                            <label class="col-sm-2 control-label">
                                用户状态
                            </label>

                            <div class="col-sm-3">
                                <select id="isValid" name="isValid" class="form-control select2">
                                    <option value="">=======请选择=======</option>
                                    <option value="A">有效</option>
                                    <option value="C">无效</option>
                                </select>
                            </div>

                        </div>

                        <div class="form-group">
                            <div class="col-sm-11">
                                <div class="navbar-right">
                                    <div class="text-center">
                                        <shiro:hasPermission name="roles/search">
                                            <button id="btn-load" type="button" class="btn btn-sm btn-primary">
                                                <i class="icon-search"></i> 查询
                                            </button>
                                        </shiro:hasPermission>
                                        <button id="btn-reset" type="button" class="btn btn-sm btn-default">
                                            <i class="icon-adjust"></i> 重置
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>

                    <table id="table" class="table table-bordered table-hover table-condensed">
                        <thead>
                        <tr>

                            <th>角色名称</th>
                            <th>用户状态</th>
                        </tr>
                        </thead>
                    </table>


                </div>

                <!--add modal-->
                <div class="modal fade" id="myModal1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title">
                                    新增
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="widget-content">

                                    <form method="post" class="form-horizontal form-group-sm" id="roleform">

                                    </form>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <div class="form-group">
                                    <button id="role-btn-close" type="button" class="btn btn-sm  pull-right"
                                            data-dismiss="modal">
                                        <i class="icon-remove"></i>关闭
                                    </button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button id="role-btn-commit" type="button"
                                            class="btn btn-sm btn-primary  pull-right">
                                        <i class="icon-ok"></i>提交
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!--edit modal-->
                <div class="modal fade" id="myModalEdit">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form method="post" class="form-horizontal form-group-sm" id="editform">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        权限
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="widget-content">
                                        <div class="form-group">
                                            <input type="hidden" class="uniform" id="roleid" name="roleid">
                                            <input type="hidden" class="uniform" id="permissId" name="permissId">

                                            <div class="col-sm-3">
                                                <ul id="treeDemo" class="ztree"></ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <button id="edit-btn-close" type="button" class="btn btn-sm  pull-right"
                                                data-dismiss="modal">
                                            <i class="icon-remove"></i>关闭
                                        </button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button id="edit-btn-commit" type="button"
                                                class="btn btn-sm btn-primary  pull-right">
                                            <i class="icon-ok"></i>提交
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
</div>
</div>
</div>

<script id="permissTemplate" type="text/x-jsrender">



        <input type="hidden" name="roleid" value="" />

        <div class="form-group">
            <label class="col-sm-2 control-label" for="rolename">
                用户名称
            </label>

            <div class="col-sm-4">
                <input type="text" name="rolename" id="rolename" value="{^{:rolename}}"
                       class="form-control required">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
                用户状态
            </label>
            <div class="col-sm-3">
                    <label class="radio-inline">
                     <input id="valid-A" type="radio" checked="checked" class="uniform" name="isValid" value="A">
                        有效
                    </label>
                    <label class="radio-inline">
                        <input id="valid-B" type="radio" {^{if isValid == "C"}} checked="checked" {{/if}} class="uniform" name="isValid" value="C">
                        无效
                    </label>
            </div>
        </div>





</script>

<script type="text/javascript">

    (function ($) {


        $.templates({
            peopleTmpl: "#permissTemplate"
        });


        $("#isValid").select2();

        var permiss = [];

        var permissList;

        <!--ztree-->
        var setting = {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck
            }
        };

        $(document).ready(function () {
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/permiss/list.do",
                success: function (result) {
                    permissList = result.data;

                }
            });

        });
        function onCheck(e, treeId, treeNode) {
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo"),
                    nodes = treeObj.getCheckedNodes(true),
                    v = [];
            for (var i = 0; i < nodes.length; i++) {
//                v+=nodes[i].id + ",";
                v.push(nodes[i].id);
                //alert(nodes[i].id); //获取选中节点的值
            }
            $("#permissId").val(v);
            //alert(v);
        }

        /**
         * 整理数据成树形结构
         */
        function fn(data, pid) {
            var result = [], temp;
            for (var i = 0; i < data.length; i++) {
                if (data[i].isValid == "A") {
                    var obj;
                    var permisstext = permissstr(data[i]);
                    if (permisstext != null) {
                        obj = permisstext;
                    } else {
                        obj = {
                            id: data[i].permissOwnId,
                            pId: data[i].permissSuperId,
                            name: data[i].permissName,
                            open: true
                        };
                    }
                    result.push(obj);
                }
            }
            return result;
        }

        function permissstr(data) {
            var text;
            for (var j = 0; j < permiss.length; j++) {

                if (data.permissOwnId == permiss[j].permissId) {
                    text = {
                        id: data.permissOwnId,
                        pId: data.permissSuperId,
                        name: data.permissName,
                        open: true,
                        checked: true
                    };
                    break;
                }
            }
            return text;
        }

        $('#edit-btn-commit').click(function () {

            var $form = $('#editform');
            var $btn = $(this);
            $.ajax({
                url: "${pageContext.request.contextPath}/rolepermiss/edit.do",
                type: 'POST',
                data: $form.serialize(),
                dataType: 'json',
                beforeSend: function () {
                    return $btn.attr('disabled', 'disabled');
                },
                success: function (result) {
                    $.showResult(result);
                }, complete: function () {
                    $btn.removeAttr('disabled');
                }
            });
        });


        $('#edit-btn-close').click(function () {
            $('#myModalEdit').modal('hide');

        });

        <!--ztree end-->


        var actionflag;
        var selected = [];
        var table = $('#table').DataTable({//jquery_datatable插件的默认参数皮质
            //"bStateSave": true, //是否把获得数据存入cookie
            "bLengthChange": false, //关闭每页显示多少条数据
            "bProcessing": true,
            "bAutoWidth": false,//自动宽度
            "bServerSide": true,
            "sAjaxSource": "<%=request.getContextPath()%>/roles/list.do",
            "fnServerData": retrieveData,
            "bPaginate": true,  //是否分页。
            "bFilter": false,
            "sPaginationType": "full_numbers",      //分页样式
            "pageLength": 10,
            "columns": [{
                data: 'rolename'
            }, {
                data: 'isValid'
            }
            ],
            "language": {
                "lengthMenu": "  _MENU_ 条数据",
                "emptyTable": "抱歉你搜索的数据不存在！！",
                "info": "显示 _START_ 到 _END_ 条数据 共 _TOTAL_ 条数据",
                "infoEmpty": "没有数据~",
                "infoFiltered": "(在 _MAX_ 条数据中查询)",
                "lengthMenu": "显示 _MENU_ 条数据",
                "search": "查询:",
                "zeroRecords": "没有找到对应的数据",
                "paginate": {
                    "previous": "上一页",
                    "next": "下一页",
                    "last": "末页",
                    "first": "首页"
                }
            },
            "columnDefs": [
                {
                    sDefaultContent: '',
                    aTargets: ['_all']
                }
                , {  // 设置默认值
                    'orderable': false,
                    aTargets: ['_all'],
                },
                {
                    render: function (data, type, row) {
                        var status = {
                            'A': '<span class="label label-success">有效</span>',
                            'C': '<span class="label label-danger">无效</span>'
                        };
                        return status[row.isValid];
                    },
                    targets: 1
                }


            ],
            "order": [
                [0, "desc"]
            ],
            "rowCallback": function (row, data) {
                $(row).attr('id', data.roleid);
                if ($.inArray(data.userid + "", selected) !== -1) {
                    $(row).addClass('selected');
                }
            }
        });

        new $.fn.dataTable.Buttons(table, {
            buttons: [
                {
                    text: '<i class="icon-refresh"></i>',

                    action: function (e, dt, node, conf) {

                        table.ajax.reload(null, false);
                    }
                },
                <shiro:hasPermission name="roles/add">
                {
                    text: '<i class="icon-plus"></i>新增',
                    action: function (e, dt, node, conf) {
                        //var frameSrc = '${contextPath}/roles/addview.do';
                        // $('#myModal1').modal('show');

                        var data = {"rolename": "", "isValid": ""};
                        var html = $.templates.peopleTmpl.render(data);
                        $("#roleform").html(html);
                        vilidatefrom();
                        $('#myModal1').modal({show: true, backdrop: 'static'});
                        //$("#NoPermissioniframe").attr("src", frameSrc);
                        actionflag = "add";


                        <%--$.fancybox({--%>
                        <%--type: 'iframe',--%>
                        <%--href: '${contextPath}/user/addview.do',--%>
                        <%--hideOnContentClick:false,--%>
                        <%--scrolling:'no',--%>
                        <%--afterClose: function () {--%>
                        <%--table.ajax.reload();--%>
                        <%--}--%>
                        <%--});--%>


                    }
                },
                </shiro:hasPermission>
                <shiro:hasPermission name="roles/update">
                {
                    text: '<i class="icon-pencil"></i>修改',
                    action: function (e, dt, node, conf) {

                        $.ajax({
                            url: "${pageContext.request.contextPath}/roles/findroles.do?rolesid=" + selected,
                            type: 'POST',
                            "dataType": 'json',
                            success: function (result) {

                                var html = $.templates.peopleTmpl.render(result);
                                $("#roleform").html(html);
                                vilidatefrom();
                                $('#myModal1').modal({show: true, backdrop: 'static'});
                                actionflag = "update";

                            }, dataFilter: function (result, type) {
                                // 對Ajax返回的原始數據進行預處理
                                return JSON.stringify($.parseJSON(result));
                            }
                        });

                        // ShowMsg('You successfully read this danger alert message.','confirm','top',false);
                        <%--$.fancybox({--%>
                        <%--type: 'iframe',--%>
                        <%--href: '${contextPath}/roles/findroles.do?rolesid=' + selected,--%>
                        <%--hideOnContentClick: false,--%>
                        <%--afterClose: function () {--%>
                        <%--reload();--%>
                        <%--}--%>
                        <%--});--%>
                    },
                    enabled: false
                },
                </shiro:hasPermission>
                <shiro:hasPermission name="roles/delete">
                {
                    text: '<i class="icon-trash"></i>删除',
                    action: function (e, dt, node, conf) {

                        $.confirm('你确定需要删除选择的数据？', function (option) {
                            if (option) {
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/roles/delete.do?rolesid=" + selected,
                                    type: 'POST',
                                    "dataType": 'json',
                                    success: function (result) {
                                        reload();
                                        $.showResult(result);
                                    }
                                });
                            }
                        });

                    }
                },
                </shiro:hasPermission>
                <shiro:hasPermission name="roles/permissdist">
                {
                    text: '<i class="icon-ban-circle"></i>权限分配',
                    action: function (e, dt, node, conf) {
                        $('#myModalEdit').modal({show: true, backdrop: 'static'});
                        $.ajax({
                            url: "${pageContext.request.contextPath}/rolepermiss/editview.do?rolesid=" + selected,
                            type: 'POST',
                            "dataType": 'json',
                            success: function (result) {
                                permiss = result;
                                $("#roleid").val(selected);
                                $.fn.zTree.init($("#treeDemo"), setting, fn(permissList, ""));
                            }, dataFilter: function (result, type) {
                                // 對Ajax返回的原始數據進行預處理
                                return JSON.stringify($.parseJSON(result));
                            }
                        });

                        // ShowMsg('You successfully read this danger alert message.','confirm','top',false);
                        <%--$.fancybox({--%>
                        <%--type: 'iframe',--%>
                        <%--href: '${contextPath}/rolepermiss/editview.do?rolesid=' + selected,--%>
                        <%--hideOnContentClick: false,--%>
                        <%--afterClose: function () {--%>
                        <%--reload();--%>
                        <%--}--%>
                        <%--});--%>
                    },
                    enabled: false
                },
                </shiro:hasPermission>
                {
                    text: '<i class="icon-book"></i>可见列',
                    extend: 'colvis'


                }, {
                    text: '<i class="icon-print"></i>打印',
                    extend: 'print'


                }
            ]
        });


        $('#role-btn-commit').click(function () {

            var $form = $('#roleform');
            if (!$.formValidator($form)) {
                return false;
            }
            var $btn = $(this);
            var url
            alert(actionflag);
            if (actionflag != null || actionflag != "") {
                if (actionflag == "add") {
                    url = "${pageContext.request.contextPath}/roles/add.do";
                } else {
                    url = "${pageContext.request.contextPath}/roles/update.do";
                }
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: $form.serialize(),
                    dataType: 'json',
                    beforeSend: function () {
                        return $btn.attr('disabled', 'disabled');
                    },
                    success: function (result) {
                        $.showResult(result);
                    }, complete: function () {
                        $btn.removeAttr('disabled');
                    }
                });
            }
        });


        $('#table tbody').on('click', 'tr', function () {
            var id = this.id;
            var indexbut = 0;
            var index = $.inArray(id, selected);
            if (index === -1) {
                selected.push(id);
            } else {
                selected.splice(index, 1);
            }
            $(this).toggleClass('selected');


            $.each(table.buttons(), function () {
                //table.button(index).enable(selected.length == 1);

                var buttextupdate = table.button(indexbut).text().indexOf("修改","权限分配") > 0;
                var buttextpermiss = table.button(indexbut).text().indexOf("权限分配") > 0;

                if(buttextupdate || buttextpermiss){
                    table.button(indexbut).enable(selected.length == 1);
                }

                indexbut++;
            });




        });

        table.buttons(0, null).container().prependTo(
                table.table().container()
        );

        function retrieveData(sSource, aoData, fnCallback) {
            //查询条件称加入参数数组
            //var rentRuleId =document.getElementById('rentRuleId').value;
            var obj = {};
            var t = $('#form').serializeArray();
            $.each(t, function () {
                if (this.value != '') {
                    obj[this.name] = this.value;
                }
            });
            $.ajax({
                type: "POST",
                url: sSource,
                dataType: "json",
                data: "aoData=" + JSON.stringify(aoData) + '&searchData=' + JSON.stringify([obj]),
                success: function (data) {
                    //$("#url_sortdata").val(data.aaData);
                    fnCallback(data); //服务器端返回的对象的returnObject部分是要求的格式
                },
                dataFilter: function (result, type) {
                    // 對Ajax返回的原始數據進行預處理
                    return JSON.stringify($.parseJSON(result));
                }
            });
        }


        $('#btn-load').click(function () {
            reload();
        });
        $('#btn-reset').click(function () {
            $(":text").each(function () {
                $(this).val("");
            });
        });

        $('#myModal1').on('hide.bs.modal', function () {
            reload();
        });

        function reload() {
            selected = [];
            table.button(2).enable(false);
            table.button(4).enable(false);
            table.ajax.reload();
        }


        <!--新增验证-->
        function vilidatefrom() {
            $('#roleform').bootstrapValidator({
                excluded: [":disabled"],
                feedbackIcons: {
                    /*输入框不同状态，显示图片的样式*/
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    rolename: {
                        validators: {
                            notEmpty: {//非空验证：提示消息
                                message: "角色名不能为空"
                            },
                            stringLength: {
                                min: 2,
                                max: 20,
                                message: "角色名长度必须在2到20之间"
                            },
                            threshold: 2, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                            remote: {
                                url: '${pageContext.request.contextPath}/roles/exitsroles.do',
                                message: '角色已存在',//提示消息
                                delay: 2000,
                                type: 'POST',//请求方式
                                //定义提交数据，默认值提交当前input value
                                data: function (validator) {
                                    return {
                                        //username: $('[name="username"]').val(),
                                        //height: $('[name="height"]').val()
                                    };
                                }

                            }
                        }
                    }
                }
            });
        }


    })(jQuery);

</script>


</body>
</html>
