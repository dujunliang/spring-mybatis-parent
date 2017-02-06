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
    <title>角色权限分配</title>
</head>

<body>
<div class="container-fluid">
    <!--修改-->
    <div class="row" style="padding: 0px;">
        <div class="col-md-4" style="padding: 0px;">
            <div class="widget box" style="padding: 0px;margin: 0px">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        角色权限
                    </h4>
                </div>
                <div class="widget-content">

                    <form method="post" class="form-horizontal form-group-sm" id="form">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                权限
                            </label>
                            <input type="hidden" class="uniform" id="roleid" name="roleid" value="${rolesid}">
                            <input type="hidden" class="uniform" id="permissId" name="permissId" >

                            <div class="col-sm-3" >
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button id="btn-close" type="button" class="btn btn-sm  pull-right" data-dismiss="modal">
                                <i class="icon-remove"></i>关闭
                            </button>
                            &nbsp;&nbsp;&nbsp;
                            <button id="btn-commit" type="button" class="btn btn-sm btn-primary  pull-right">
                                <i class="icon-ok"></i>提交
                            </button>
                        </div>

                    </form>
                </div>

            </div>

        </div>

    </div>

</div>


<script type="text/javascript">

    $(function () {


       var permiss = ${permisslist};

        //alert(JSON.stringify($.parseJSON(peimiss)));

        var setting = {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback:{
                onCheck:onCheck
            }
        };

        $(document).ready(function(){
            $.ajax({
                type: "post",
                url: "<%=request.getContextPath()%>/permiss/list.do",
                success: function (result) {
                    $.fn.zTree.init($("#treeDemo"), setting, fn(result.data, ""));
                }
            });

        });
        function onCheck(e,treeId,treeNode){
            var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
                    nodes=treeObj.getCheckedNodes(true),
                    v=[];
            for(var i=0;i<nodes.length;i++){
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
                var obj;
                var permisstext = permissstr(data[i]);
                if( permisstext != null){
                    obj = permisstext;
                }else{
                    obj = { id:data[i].permissOwnId, pId:data[i].permissSuperId, name:data[i].permissName, open:true};
                }
                result.push(obj);
            }
            return result;
        }

        function permissstr(data){
            var text;
            for(var j=0;j<permiss.length;j++){

                if(data.permissOwnId == permiss[j].permissId){
                    text = { id:data.permissOwnId, pId:data.permissSuperId, name:data.permissName, open:true,checked:true};
                    break;
                }
            }
            return text;
        }

        $("body").css({height: "auto"});

        $('#btn-commit').click(function () {

            var $form = $('#form');
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


        $('#btn-close').click(function () {
            parent.$.fancybox.close();
        });
    });
</script>
</body>

</html>
