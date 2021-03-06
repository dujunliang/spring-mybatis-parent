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
    <title>用戶修改</title>
</head>

<body >

<div class="container-fluid" >
    <!--新增-->
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

                        <input type="hidden" name="userid" value="${userDTO.userid}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="username">
                                用户名称
                            </label>
                            <div class="col-sm-3" >
                                <input type="text" name="username" id="username" value="${userDTO.username}" class="form-control required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                邮箱账号
                            </label>

                            <div class="col-sm-3">
                                <input type="text" name="email" value="${userDTO.email}" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                账号密码

                            </label>

                            <div class="col-sm-3">
                                <input type="password" name="password" value="${userDTO.password}"  class="form-control" minlength="6">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                重输密码

                            </label>

                            <div class="col-sm-3">
                                <input type="password" name="rePassword" value="${userDTO.password}"  class="form-control" minlength="6"
                                       equalTo="[name='password']">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                用户状态
                            </label>
                            <div class="col-sm-3">
                                <div class="make-switch" data-on="info" data-off="success" id="mySwitch">
                                    <input type="checkbox" checked class="toggle" id="isValid" name="isValid" value="A" />
                                </div>
                                <%--<label class="radio-inline">--%>
                                    <%--<input id="valid-A" type="radio"  class="uniform" name="isValid" value="A" >--%>
                                    <%--有效--%>
                                <%--</label>--%>
                                <%--<label class="radio-inline">--%>
                                    <%--<input id="valid-B" type="radio" class="uniform" name="isValid" value="C"  >--%>
                                    <%--无效--%>
                                <%--</label>--%>
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
</div>

<script type="text/javascript">

    $(function(){

        var status ='${userDTO.isValid}';

        $('#mySwitch').bootstrapSwitch('setState', status=="A"?true:false);

        $('#mySwitch').on('switch-change', function (e, data) {
            var $el = $(data.el)
                    , value = data.value;

            var isvalid;
            if(value){ isvalid = "A"; }else{ isvalid = "C"; }
            $("#isValid").val(isvalid);
        });

        $("body").css({ height: "auto"});

//        status=="A"?$('#valid-A').attr("checked","checked"):$('#valid-B').attr("checked","checked");

        //$('#attributeForm').bootstrapValidator();
        $('#form').bootstrapValidator({
            excluded:[":disabled"],
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    validators: {
                        notEmpty: {//非空验证：提示消息
                            message: "用户名不能为空"
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: "用户名长度必须在6到30之间"
                        },
                        threshold: 6, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                        remote: {
                            url: '${pageContext.request.contextPath}/user/exitsuser.do',
                            message: '用户已存在',//提示消息
                            delay :  2000,
                            type: 'POST',//请求方式
                            //定义提交数据，默认值提交当前input value
                            data: function(validator) {
                                return {
                                    //username: $('[name="username"]').val(),
                                    //height: $('[name="height"]').val()
                                };
                            }

                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 5,
                            max: 30,
                            message: '用户名长度必须在5到30之间'
                        },
                        identical: {//相同
                            field: 'password', //需要进行比较的input name值
                            message: '两次密码需一致'
                        },
                        different: {//不能和用户名相同
                            field: 'username',//需要进行比较的input name值
                            message: '不能和用户名相同'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: ''
                        }
                    }
                },
                rePassword: {

                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        },
                        identical: {//相同
                            field: 'password',
                            message: '两次密码需一致'
                        },
                        different: {//不能和用户名相同
                            field: 'username',
                            message: '不能和用户名相同'
                        },
                        regexp: {//匹配规则
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: ''
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮件不能为空'
                        },
                        emailAddress: {
                            message: '请输入正确的邮件地址如：123@qq.com'
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
                url: "${pageContext.request.contextPath}/user/update.do",
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
