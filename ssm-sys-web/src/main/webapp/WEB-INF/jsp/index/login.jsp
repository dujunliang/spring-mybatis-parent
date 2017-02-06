<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<script type="text/javascript" src="assets/js/login.js">
</script>

  <head>
   	 <title>Hans用户登录页面</title>
  </head>
  
  <body style="height: 100%">

  <div class="login" style="height:100% ">
    <div class="logo">
      <img src="assets/img/logo.png" alt="logo" />
      <strong>
        Hans-Me
      </strong>Admin</div>
    <%--<div style="width: 200px;height: 200px;background-image: url(http://localhost:8080/ssm-sys-web/assets/img/icons/iconsweets/icos-dark.png);"></div>--%>
    <div class="box">
      <div class="content">
        <form id="form" class="form-vertical login-form" >
          <h3 class="form-title">
             登陆
          </h3>
          <div class="alert fade in alert-danger" style="display: none;">
            <i class="icon-remove close" data-dismiss="alert">
            </i>
           输入任何用户名密码进入.
          </div>
          <div class="form-group">
            <div class="input-icon">
              <i class="icon-user">
              </i>
              <input type="text" name="username" class="form-control" placeholder="<spring:message code="username"/>"
              autofocus="autofocus" data-rule-required="true" data-msg-required="请输入用户名."
              />
            </div>
          </div>
          <div class="form-group">
            <div class="input-icon">
              <i class="icon-lock">
              </i>
              <input type="password" name="password" class="form-control" placeholder="密码"
              data-rule-required="true" data-msg-required="请输入密码."
              />
            </div>
          </div>
          <div class="form-actions">
            <label class="checkbox pull-left">
              <input type="checkbox" class="uniform" name="remember">
              记住密码
            </label>
            <button type="submit" id="login-submit" class="submit btn btn-primary pull-right">
              登录
              <i class="icon-angle-right">
              </i>
            </button>
          </div>
        </form>

      </div>
      <div class="inner-box">
        <div class="content">
          <i class="icon-remove close hide-default">
          </i>
          <a href="#" class="forgot-password-link">
            忘记密码?
          </a>
          <form class="form-vertical forgot-password-form hide-default" action="login.jsp"
          method="post">
            <div class="form-group">
              <div class="input-icon">
                <i class="icon-envelope">
                </i>
                <input type="text" name="email" class="form-control" placeholder="Enter email address"
                data-rule-required="true" data-rule-email="true" data-msg-required="Please enter your email."
                />
              </div>
            </div>
            <button type="submit" class="submit btn btn-default btn-block">
              Reset your Password
            </button>
          </form>
          <div class="forgot-password-done hide-default">
            <i class="icon-ok success-icon">
            </i>
            <span>
              Great. We have sent you an email.
            </span>
          </div>
        </div>
      </div>
    </div>

  </div>

  <script type="text/javascript">

    $(function () {


      $('#form').bootstrapValidator({
        excluded: [":disabled"],

        fields: {
          username: {
            validators: {
              notEmpty: {//非空验证：提示消息
                message: "用户名不能为空"
              },
              stringLength: {
                min: 5,
                max: 30,
                message: "用户名长度必须在5到30之间"
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
                message: '密码长度必须在6到30之间'
              }
            }
          }
        }
      });


      $('#login-submit').click(function () {

        var $form = $('#form');
        if (!$.formValidator($form)) {
          return false;
        }
        var $btn = $(this);
        $.ajax({
          url: "${pageContext.request.contextPath}/login/dologin.do",
          type: 'POST',
          data: $form.serialize(),
          dataType: 'json',
          beforeSend: function () {
            return $btn.attr('disabled', 'disabled');
          },
          success: function (result) {
            $.showResult(result);
            if(result['success']){
              window.location.href="${pageContext.request.contextPath}/login/loginSuc.do";
            }
          } , error : function(data,textstatus){

          } , complete: function () {
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