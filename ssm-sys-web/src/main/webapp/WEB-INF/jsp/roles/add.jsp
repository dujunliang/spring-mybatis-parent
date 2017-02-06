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
    <title>角色新增</title>
</head>

<body>

<form method="post" class="form-horizontal form-group-sm" id="form">


    <div class="form-group">
        <label class="col-sm-2 control-label" for="rolename">
            用户名称
        </label>

        <div class="col-sm-3">
            <input type="text" name="rolename" id="rolename" class="form-control required">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">
            用户状态
        </label>

        <div class="col-sm-3">
            <label class="radio-inline">
                <input type="radio" class="uniform" name="isValid" value="A" checked>
                有效
            </label>
            <label class="radio-inline">
                <input type="radio" class="uniform" name="isValid" value="C">
                无效
            </label>
        </div>
    </div>

   

    <div class="form-group">
        <div class="col-sm-3">
            <button id="btn-commit" type="button" class="btn btn-sm btn-primary  pull-right">
                <i class="icon-ok"></i>提交
            </button>
        </div>
    </div>

</form>

<script type="text/javascript">



</script>
<script type="text/javascript">

    $(function () {



        $("body").css({height: "auto"});

        $('#form').bootstrapValidator({
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
                            min: 1,
                            max: 20,
                            message: "角色名长度必须在1到20之间"
                        },
                        threshold: 6, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
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


        $('#btn-commit').click(function () {

            var $form = $('#form');
            if (!$.formValidator($form)) {
                return false;
            }
            var $btn = $(this);
            $.ajax({
                url: "${pageContext.request.contextPath}/roles/add.do",
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
