<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

  <head>
   	 <title>Hans用户登录页面</title>
    <script>
      $(document).ready(function() {
    Login.init()
    });
    </script>
  </head>
  
  <body >
  <div class="login" style="height:100% ">
    <div class="logo">
      <img src="assets/img/logo.png" alt="logo" />
      <strong>
        Hans-Me
      </strong>Admin</div>
    <%--<div style="width: 200px;height: 200px;background-image: url(http://localhost:8080/ssm-sys-web/assets/img/icons/iconsweets/icos-dark.png);"></div>--%>
    <div class="box">
      <div class="content">
        <form class="form-vertical login-form" action="loginUser/login4.do" method="post">
          <h3 class="form-title">
            登录
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
              <input type="text" name="username" class="form-control" placeholder="用户名"
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
            <button type="submit" class="submit btn btn-primary pull-right">
              登录
              <i class="icon-angle-right">
              </i>
            </button>
          </div>
        </form>
        <!--<form class="form-vertical register-form" action="index.jsp" method="post"-->
        <!--style="display: none;">-->
          <!--<h3 class="form-title">-->
            <!--免费注册-->
          <!--</h3>-->
          <!--<div class="form-group">-->
            <!--<div class="input-icon">-->
              <!--<i class="icon-user">-->
              <!--</i>-->
              <!--<input type="text" name="username" class="form-control" placeholder="Username"-->
              <!--autofocus="autofocus" data-rule-required="true" />-->
            <!--</div>-->
          <!--</div>-->
          <!--<div class="form-group">-->
            <!--<div class="input-icon">-->
              <!--<i class="icon-lock">-->
              <!--</i>-->
              <!--<input type="password" name="password" class="form-control" placeholder="Password"-->
              <!--id="register_password" data-rule-required="true" />-->
            <!--</div>-->
          <!--</div>-->
          <!--<div class="form-group">-->
            <!--<div class="input-icon">-->
              <!--<i class="icon-ok">-->
              <!--</i>-->
              <!--<input type="password" name="password_confirm" class="form-control" placeholder="Confirm Password"-->
              <!--data-rule-required="true" data-rule-equalTo="#register_password" />-->
            <!--</div>-->
          <!--</div>-->
          <!--<div class="form-group">-->
            <!--<div class="input-icon">-->
              <!--<i class="icon-envelope">-->
              <!--</i>-->
              <!--<input type="text" name="Email" class="form-control" placeholder="Email address"-->
              <!--data-rule-required="true" data-rule-email="true" />-->
            <!--</div>-->
          <!--</div>-->
          <!--<div class="form-group spacing-top">-->
            <!--<label class="checkbox">-->
              <!--<input type="checkbox" class="uniform" name="remember" data-rule-required="true"-->
              <!--data-msg-required="Please accept ToS first.">-->
              <!--I agree to the-->
              <!--<a href="javascript:void(0);">-->
                <!--Terms of Service-->
              <!--</a>-->
            <!--</label>-->
            <!--<label for="remember" class="has-error help-block" generated="true" style="display:none;">-->
            <!--</label>-->
          <!--</div>-->
          <!--<div class="form-actions">-->
            <!--<button type="button" class="back btn btn-default pull-left">-->
              <!--<i class="icon-angle-left">-->
              <!--</i>-->
              <!--Back-->
              <!--</i>-->
            <!--</button>-->
            <!--<button type="submit" class="submit btn btn-primary pull-right">-->
              <!--Sign Up-->
              <!--<i class="icon-angle-right">-->
              <!--</i>-->
            <!--</button>-->
          <!--</div>-->
        <!--</form>-->
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
    <!--<div class="single-sign-on">-->
      <!--<span>-->
        <!--or-->
      <!--</span>-->
      <!--<button class="btn btn-facebook btn-block">-->
        <!--<i class="icon-facebook">-->
        <!--</i>-->
        <!--Sign in with Facebook-->
      <!--</button>-->
      <!--<button class="btn btn-twitter btn-block">-->
        <!--<i class="icon-twitter">-->
        <!--</i>-->
        <!--Sign in with Twitter-->
      <!--</button>-->
      <!--<button class="btn btn-google-plus btn-block">-->
        <!--<i class="icon-google-plus">-->
        <!--</i>-->
        <!--Sign in with Google-->
      <!--</button>-->
    <!--</div>-->
    <!--<div class="footer">-->
      <!--<a href="#" class="sign-up">-->
        <!--Don't have an account yet?-->
        <!--<strong>-->
          <!--Sign Up-->
        <!--</strong>-->
      <!--</a>-->
    <!--</div>-->
  </div>
  </body>

</html>