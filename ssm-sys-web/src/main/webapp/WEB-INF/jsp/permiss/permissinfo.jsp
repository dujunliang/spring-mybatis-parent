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
                权限管理
            </a>
        </li>
    </ul>
</div>
<div class="container" style="margin-top: 20px;width: 100%">
    <div class="row">
        <div class="col-md-12">
            <div class="widget box">
                <div class="widget-header">
                    <h4><i class="icon-reorder"></i>权限管理</h4>

                    <div class="toolbar no-padding">
                        <div class="btn-group"><span class="btn btn-xs widget-collapse">  <i
                                class="icon-angle-down"> </i> </span></div>
                    </div>
                </div>
                <div class="widget-content">

                    <%--<form id="form" class="form-horizontal form-group-sm" >--%>

                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">--%>
                    <%--权限名称--%>
                    <%--</label>--%>
                    <%--<div class="col-sm-3">--%>
                    <%--<input type="text" name="permissName" class="form-control">--%>
                    <%--</div>--%>
                    <%--<label class="col-sm-2 control-label">--%>
                    <%--权限状态--%>
                    <%--</label>--%>
                    <%--<div class="col-sm-3">--%>
                    <%--<select id="isValid" name="isValid" class="form-control select2">--%>
                    <%--<option value="">=======请选择=======</option>--%>
                    <%--<option value="A">有效</option>--%>
                    <%--<option value="C">无效</option>--%>
                    <%--</select>--%>
                    <%--</div>--%>

                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">--%>
                    <%--权限类型--%>
                    <%--</label>--%>
                    <%--<div class="col-sm-3">--%>
                    <%--<select id="permissType" name="permissType" class="form-control select2">--%>
                    <%--<option value="">=======请选择=======</option>--%>
                    <%--<option value="MENU">菜单</option>--%>
                    <%--<option value="FUNCITONG">功能</option>--%>
                    <%--</select>--%>
                    <%--</div>--%>

                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                    <%--<div class="col-sm-11">--%>
                    <%--<div class="navbar-right">--%>
                    <%--<div class="text-center">--%>
                    <%--<button id="btn-load" type="button" class="btn btn-sm btn-primary">--%>
                    <%--<i class="icon-search"></i> 查询--%>
                    <%--</button>--%>
                    <%--<button id="btn-reset" type="button" class="btn btn-sm btn-default">--%>
                    <%--<i class="icon-adjust"></i> 重置--%>
                    <%--</button>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--</form>--%>
                    <table id="table" class="table table-bordered table-hover table-condensed">
                        <thead>
                        <tr>

                            <th>权限名称</th>
                            <th>权限类型</th>
                            <th>权限内容</th>
                            <th>权限状态</th>
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

        </div>
    </div>
</div>
</div>
</div>

<script type="text/javascript">

    (function ($) {


        var resultdata = [];
        var selected = [];
        var table = $('#table').DataTable({//jquery_datatable插件的默认参数皮质
            //"bStateSave": true, //是否把获得数据存入cookie
            "bLengthChange": false, //关闭每页显示多少条数据
            "bProcessing": true,
            //"aaSorting" : [[4, "asc"]],
            "bAutoWidth": false,//自动宽度
            "bServerSide": false,
            "bSort": false,
            "bInfo": false,
            "ajax": {
                type: "post",
                url: "<%=request.getContextPath()%>/permiss/list.do",
                dataSrc: function (data) {
                    if (data.callbackCount == null) {
                        data.callbackCount = 0;
                    }
                    //$("#url_sortdata").val(data.aaData);
                    var datafilter = data["data"];
                    resultdata = [];
                    var result = fn(datafilter, "", "");
                    for (var i = 0; i < result.length; i++) {
                        returndata(result[i], resultdata);
                    }
                    data.data = resultdata;
                    //alert(JSON.stringify(data.data));
                    return resultdata;             //自定义数据源，默认为data
                }    //dataSrc相当于success，在datatable里面不能用success方法，会覆盖datatable内部回调方法
            },
            // "sAjaxSource": "<%=request.getContextPath()%>/permiss/list.do",
            // "fnServerData": retrieveData,
            "bPaginate": false,  //是否分页
            "searching": true,
            "bFilter": true, //是否启动过滤、搜索功能
            //"sPaginationType": "full_numbers",      //分页样式
            // "pageLength": 10,
            "language": {"search": "", "info": ""},
            "columns": [{
                data: 'permissName'
            }, {
                data: 'permissType'
            }, {
                data: 'permissVal'
            }, {
                data: 'isValid'
            }, {
                data: 'orderpermiss'
            }
            ],
            "columnDefs": [

                {
                    "visible": false,
                    "searchable": false,
                    "targets": [4],
                },
                {
                    render: function (data, type, row) {
                        var txt = "";
                        var superLengthtxt = row.orderpermiss;
                        for (var i = 0; i < superLengthtxt.length; i++) {
                            if (superLengthtxt.length > 3) {
                                txt = txt + "&nbsp&nbsp";
                            }
                        }
                        return txt + row.permissName;
                    },
                    targets: 0
                },
                {
                    render: function (data, type, row) {
                        var status = {
                            'A': '<span class="label label-success">有效</span>',
                            'C': '<span class="label label-danger">无效</span>'
                        };
                        return status[row.isValid];
                    },
                    targets: 3
                },
                {
                    render: function (data, type, row) {
                        var type = {
                            'MENU': '<span class="label label-success">菜单</span>',
                            'FUNCTION': '<span class="label label-info">功能</span>'
                        };
                        return type[row.permissType];
                    },
                    targets: 1
                }


            ],

            "rowCallback": function (row, data) {
                $(row).attr('id', data.permissId);
                if ($.inArray(data.permissId + "", selected) !== -1) {
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
                <shiro:hasPermission name="permiss/add">
                {
                    text: '<i class="icon-plus"></i>新增',
                    action: function (e, dt, node, conf) {
                        actionflag = "add";
                        var frameSrc = '${contextPath}/permiss/addview.do';
                        $('#myModal1').modal('show');
                        $("#NoPermissioniframe").attr("src", frameSrc);
                        $('#myModal1').modal({show: true, backdrop: 'static'});
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
                <shiro:hasPermission name="permiss/update">
                {
                    text: '<i class="icon-pencil"></i>修改',
                    action: function (e, dt, node, conf) {
                        actionflag = "update";
                        // ShowMsg('You successfully read this danger alert message.','confirm','top',false);
                        $.fancybox({
                            type: 'iframe',
                            href: '${contextPath}/permiss/findpermiss.do?permissid=' + selected,
                            hideOnContentClick: false,
                            afterClose: function () {
                                reload();
                            }
                        });
                    },
                    enabled: false
                },
                </shiro:hasPermission>
                <shiro:hasPermission name="permiss/delete">
                {
                    text: '<i class="icon-trash"></i>删除',
                    action: function (e, dt, node, conf) {

                        $.confirm('你确定需要删除选择的数据？', function (option) {
                            if (option) {
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/permiss/delete.do?permissid=" + selected,
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
                {
                    text: '<i class="icon-ban-circle"></i>禁用',
                    action: function (e, dt, node, conf) {
                        console.log('Button 2 clicked on');
                        var data = table.row({select: true}).data();


                    }
                },
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
            var index = $.inArray(id, selected);
            if (index === -1) {
                selected.push(id);
            } else {
                selected.splice(index, 1);
            }
            $(this).toggleClass('selected');

            table.button(2).enable(selected.length == 1);

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
                    var datafilter = data["data"];
                    resultdata = [];
                    var result = fn(datafilter, "", "");
                    for (var i = 0; i < result.length; i++) {
                        returndata(result[i], resultdata);
                    }
                    data.data = resultdata;
                    fnCallback(data.data); //服务器端返回的对象的returnObject部分是要求的格式
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
            table.ajax.reload();
        }

        /**
         * 整理数据成树形结构
         */
        function fn(data, pid, str) {
            var result = [], temp;
            for (var i = 0; i < data.length; i++) {
                if (data[i].permissSuperId == pid) {
                    var obj = data[i];
                    obj["orderpermiss"] = str + obj.permissOwnId;
                    temp = fn(data, obj.permissOwnId, obj["orderpermiss"]);
                    if (temp.length > 0) {
                        obj.children = temp;
                    }
                    result.push(obj);
                }
            }
            return result;
        }


        /**
         * 树形结构输出
         * @param data
         * @param resultdata
         */
        function returndata(data, resultdata) {

            resultdata.push(data);

            var children = data.children;

            if (children && children.length) {

                for (var j = 0; j < children.length; j++) {
                    returndata(children[j], resultdata);
                }
            }

        }


    })(jQuery);

</script>

</body>
</html>
