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
    <title>权限修改</title>
</head>

<body >

<div class="container-fluid" >
    <!--修改-->
    <div class="row" style="padding: 0px;" >
        <div class="col-md-4" style="padding: 0px;">
            <div class="widget box"  style="padding: 0px;margin: 0px">
                <div class="widget-header">
                    <h4>
                        <i class="icon-reorder">
                        </i>
                        修改
                    </h4>
                </div>
                <div class="widget-content" >

                    <form method="post" class="form-horizontal form-group-sm" id="form">

                        <input type="hidden" name="permissId" value="${permissDTO.permissId}">


                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="permissName">
                                权限名称
                            </label>

                            <div class="col-sm-3">
                                <input type="text" name="permissName" id="permissName" value="${permissDTO.permissName}" class="form-control required">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                权限状态
                            </label>

                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input id="valid-type-A" type="radio" class="uniform" name="permissType" value="MENU" checked>
                                    菜单
                                </label>
                                <label class="radio-inline">
                                    <input id="valid-type-B" type="radio" class="uniform" name="permissType" value="FUNCTION">
                                    功能
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="permissVal">
                                输出内容
                            </label>

                            <div class="col-sm-3">
                                <input type="text" name="permissVal" id="permissVal"  value="${permissDTO.permissVal}" class="form-control required">
                            </div>
                        </div>

                        <%--<div class="form-group">--%>
                            <%--<label class="col-sm-2 control-label" for="permissSuper">--%>
                                <%--上级--%>
                            <%--</label>--%>

                            <%--<div class="col-sm-3">--%>
                                <%--<input type="text" name="permissSuper" id="permissSuper" value="${permissDTO.permissSuper}" class="form-control required">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="permissSuperId">
                                上级
                            </label>
                            <div class="col-sm-3">
                                <select id="permissSuperId" name="permissSuperId" class="form-control select2" style="width: 170px">
                                    <option value="${permissDTO.permissSuperId}">${permissDTO.permissSuperVal}</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="permissOwnId">
                                权限编码
                            </label>

                            <div class="col-sm-3">
                                <input type="text" name="permissOwnId" id="permissOwnId" value="${permissDTO.permissOwnId}" class="form-control required">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                权限状态
                            </label>

                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input id="valid-status-A" type="radio" class="uniform" name="isValid" value="A" checked>
                                    有效
                                </label>
                                <label class="radio-inline">
                                    <input id="valid-status-B" type="radio" class="uniform" name="isValid" value="C">
                                    无效
                                </label>
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

                        <input type="hidden" id="permissSuperVal" name="permissSuperVal"  value="${permissDTO.permissSuperVal}" />

                    </form>
                </div>

            </div>

        </div>

    </div>

</div>
</div>

<script type="text/javascript">

    $(function(){

        $("#permissSuperId").select2();
        $('select#permissSuperId').select2Remote({
            url: '${pageContext.request.contextPath}/select2/select2Permiss.do',
        });

        $("body").css({ height: "auto"});
        var status = '${permissDTO.isValid}';
        var type = '${permissDTO.permissType}';
        status=="A"?$('#valid-status-A').attr("checked","checked"):$('#valid-status-B').attr("checked","checked");
        type=="MENU"?$('#valid-type-A').attr("checked","checked"):$('#valid-type-B').attr("checked","checked");


        //$('#attributeForm').bootstrapValidator();
        $('#form').bootstrapValidator({
            excluded:[":disabled"],
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                rolename: {
                    validators: {
                        notEmpty: {//非空验证：提示消息
                            message: "权限名不能为空"
                        },
                        stringLength: {
                            min: 2,
                            max: 20,
                            message: "权限名长度必须在2到20之间"
                        },
                        threshold: 2, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                        remote: {
                            url: '${pageContext.request.contextPath}/permiss/exitspermiss.do',
                            message: '权限名已存在',//提示消息
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
                },
                permissVal:{
                    validators: {

                        notEmpty: {//非空验证：提示消息
                            message: "权限内容不能为空"
                        },
                        stringLength: {
                            min: 1,
                            max: 20,
                            message: "权限内容长度必须在1到20之间"
                        }

                    }
                },
                permissOwnId:{
                    validators: {
                        integer: {
                            message: "请输入数字"
                        },
                        notEmpty: {//非空验证：提示消息
                            message: "权限编码不能为空"
                        },
                        stringLength: {
                            min: 3,
                            max: 3,
                            message: "权限内容长度必须在3到3之间"
                        }

                    }
                }
            }
        });


        $('#btn-commit').click(function () {

            var $form = $('#form');
            if (!$.formValidator($form)) {
                return false;
            }

            if($("#permissSuperId").text() == null){
                $("#permissSuperId").text("");
            }


            $("#permissSuperVal").val($("#permissSuperId").find("option:selected").text());

            var $btn = $(this);
            $.ajax({
                url: "${pageContext.request.contextPath}/permiss/update.do",
                type: 'POST',
                data: $form.serialize(),
                dataType: 'json',
                beforeSend: function () {
                    return $btn.attr('disabled', 'disabled');
                },
                success: function (result) {
                    $.showResult(result);
                }
                , complete: function () {
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
