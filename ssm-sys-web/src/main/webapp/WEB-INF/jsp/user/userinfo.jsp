<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Hans用户信息管理页面</title>
</head>

<body style="height: 100%">

<div class="crumbs" style="margin-left: 2px">
    <ul id="breadcrumbs" class="breadcrumb">
        <li>
            <i class="icon-home">
            </i>
            <a href="index.html">
                用户管理
            </a>
        </li>
        <li class="current">
            <a href="pages_calendar.html" title="">
                用户信息
            </a>
        </li>
    </ul>
</div>
<div class="container" style="margin-top: 20px;width: 100%">
    <div class="row">
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4><i class="icon-reorder"></i> 用户信息</h4>

                    <div class="toolbar no-padding">
                        <div class="btn-group"><span class="btn btn-xs widget-collapse">  <i
                                class="icon-angle-down"> </i> </span></div>
                    </div>
                </div>
                <div class="widget-content">

                    <form id="form" class="form-horizontal form-group-sm">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                用户名称
                            </label>

                            <div class="col-sm-3">
                                <input type="text" name="username" class="form-control">
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
                                        <shiro:hasPermission name="user/search">
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

                            <th>用户名称</th>
                            <th>邮箱信息</th>
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
                                <iframe id="NoPermissioniframe" width="100%" height="450px" frameborder="0"></iframe>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--edit modal-->
            <div class="modal fade" id="myModalEdit">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                角色分配
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="widget-content">
                                <form method="post" class="form-horizontal form-group-sm" id="roleeditform">
                                    <div class="form-group">
                                        <input type="hidden" class="uniform" id="userid" name="userid">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                选择角色
                                            </label>

                                            <div class="col-sm-3">
                                                <select id="rolesId" name="rolesId"
                                                        class="js-example-basic-multiple form-control"
                                                        multiple="multiple" style="width: 200px"  >

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group">
                                <button id="role-edit-btn-close" type="button" class="btn btn-sm  pull-right"
                                        data-dismiss="modal">
                                    <i class="icon-remove"></i>关闭
                                </button>
                                &nbsp;&nbsp;&nbsp;
                                <button id="role-edit-btn-commit" type="button"
                                        class="btn btn-sm btn-primary  pull-right">
                                    <i class="icon-ok"></i>提交
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
</div>
</div>

<script type="text/javascript">

    (function ($) {

        $("#isValid").select2();
        var selected = [];
        var actionflag;
        var table = $('#table').DataTable({//jquery_datatable插件的默认参数皮质
            //"bStateSave": true, //是否把获得数据存入cookie

            "bLengthChange": false, //关闭每页显示多少条数据
            "bProcessing": true,
            "bAutoWidth": false,//自动宽度
            "bServerSide": true,

            "sAjaxSource": "<%=request.getContextPath()%>/user/list.do",
            "fnServerData": retrieveData,
            "bPaginate": true,  //是否分页。
            "bFilter": false,
            "sPaginationType": "full_numbers",      //分页样式
            "pageLength": 10,
            "columns": [{
                data: 'username'
            }, {
                data: 'email'
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
                "search": "",
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
                    targets: 2
                }


            ],
            "order": [
                [0, "desc"]
            ],
            "rowCallback": function (row, data) {
                $(row).attr('id', data.userid);
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
                <shiro:hasPermission name="user/add">
                {
                    text: '<i class="icon-plus"></i>新增',
                    action: function (e, dt, node, conf) {
                        actionflag = "add";
                        var frameSrc = '${contextPath}/user/addview.do';
                        $('#myModal1').modal('show');

                        $("#NoPermissioniframe").attr("src", frameSrc);
                        $('#myModal1').modal({show: true, backdrop: 'static'});
                    }
                },
                </shiro:hasPermission>
                <shiro:hasPermission name="user/update">
                {
                    text: '<i class="icon-pencil"></i>修改',
                    action: function (e, dt, node, conf) {
                        actionflag = "update";
                        // ShowMsg('You successfully read this danger alert message.','confirm','top',false);
                        $.fancybox({
                            type: 'iframe',
                            href: '${contextPath}/user/finduser.do?userid=' + selected,
                            hideOnContentClick: false,
                            afterClose: function () {
                                reload();
                            }
                        });
                    },

                    enabled: false,

                },
                </shiro:hasPermission>
                <shiro:hasPermission name="user/delete">
                {
                    text: '<i class="icon-trash"></i>删除',
                    action: function (e, dt, node, conf) {

                        //$.confirm('你确定需要删除选择的数据？','confirm','top',false,null);
                        $("html,body").animate({scrollTop: 0}, 500);
                        $.confirm('你确定需要删除选择的数据？', function (option) {
                            if (option) {
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/user/delete.do?userid=" + selected,
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
                <shiro:hasPermission name="user/roledist">
                {
                    text: '<i class="icon-ban-circle"></i>角色分配',
                    action: function (e, dt, node, conf) {
                        $('#myModalEdit').modal({show: true, backdrop: 'static'});
                        $.ajax({
                            url: "${pageContext.request.contextPath}/roles/getroleslist.do",
                            type: 'POST',
                            "dataType": 'json',
                            success: function (result) {
                                $("select#rolesId").select2({
                                    data:result
                                });
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/userrole/list.do?userid=" + selected,
                                    type: 'POST',
                                    "dataType": 'json',
                                    success: function (result) {

                                        $("#userid").val(selected);
                                        var id = [];
                                        for (var i = 0; i < result.length; i++) {
                                            id.push(result[i].roleid);
                                        }
                                        $('select#rolesId').val(id).trigger("change");
                                    }, dataFilter: function (result, type) {
                                        // 對Ajax返回的原始數據進行預處理
                                        return JSON.stringify($.parseJSON(result));
                                    }
                                });
                            }, dataFilter: function (result, type) {
                                // 對Ajax返回的原始數據進行預處理
                                return JSON.stringify($.parseJSON(result));
                            }
                        });
                    },
                    enabled: false,

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

            table.button(2).enable(selected.length == 1);
            table.button(4).enable(selected.length == 1);
            $.each(table.buttons(), function () {
                //table.button(index).enable(selected.length == 1);

                var buttextupdate = table.button(indexbut).text().indexOf("修改") > 0;
                var buttextroles = table.button(indexbut).text().indexOf("角色分配") > 0;

                if(buttextupdate || buttextroles){
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

        $('#role-edit-btn-commit').click(function () {

            var $form = $('#roleeditform');
            var $btn = $(this);
            $.ajax({
                url: "${pageContext.request.contextPath}/userrole/edit.do",
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


        $('#role-edit-btn-close').click(function () {
            $('#myModalEdit').modal('hide');

        });


//     $('#formAdd').find("input").each(function(){
//         alert($(this).attr("name"));
//     });

    })(jQuery);

</script>

</body>
</html>
