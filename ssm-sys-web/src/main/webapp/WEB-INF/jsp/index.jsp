<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Bootstrap3响应式后台管理系统模版MeAdmin</title>
    <style>

      #iframe{
        height: 100%;
        width: 100%;
      }
      #content{
        height: 100%;
      }

    </style>
  </head>

    <script>
    $(document).ready(function() {

      App.init();
      Plugins.init();
      FormComponents.init()
    });
  </script>
  <body>
    <header class="header navbar navbar-fixed-top" role="banner">
      <div class="container">
        <ul class="nav navbar-nav">
          <li class="nav-toggle">
            <a href="javascript:void(0);" title="">
              <i class="icon-reorder">
              </i>
            </a>
          </li>
        </ul>
        <a class="navbar-brand" href="index.html">
          <div class="logo">
            <img src="assets/img/logo.png" alt="logo" />
            <strong>
              Hans-
            </strong>Admin</div>
        </a>
        <a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom"
        data-original-title="Toggle navigation">
          <i class="icon-reorder">
          </i>
        </a>
        <ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
          <li>
            <a href="${contextPath}/loginUser/console.do" target="iframe">
              控制台
            </a>
          </li>

        </ul>
        <ul class="nav navbar-nav navbar-right">


          <li class="dropdown hidden-xs hidden-sm">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="icon-envelope">
              </i>
              <span class="badge">
                1
              </span>
            </a>
            <ul class="dropdown-menu extended notification">
              <li class="title">
                <p>
                  你有3条新消息
                </p>
              </li>
              <li>
                <a href="javascript:void(0);">
                  <span class="photo">
                    <img src="assets/img/demo/avatar-1.jpg" alt="" />
                  </span>
                  <span class="subject">
                    <span class="from">
                      Bob Carter
                    </span>
                    <span class="time">
                      Just Now
                    </span>
                  </span>
                  <span class="text">
                    Consetetur sadipscing elitr...
                  </span>
                </a>
              </li>
              <li>
                <a href="javascript:void(0);">
                  <span class="photo">
                    <img src="assets/img/demo/avatar-2.jpg" alt="" />
                  </span>
                  <span class="subject">
                    <span class="from">
                      Jane Doe
                    </span>
                    <span class="time">
                      45 mins
                    </span>
                  </span>
                  <span class="text">
                    Sed diam nonumy...
                  </span>
                </a>
              </li>
              <li>
                <a href="javascript:void(0);">
                  <span class="photo">
                    <img src="assets/img/demo/avatar-3.jpg" alt="" />
                  </span>
                  <span class="subject">
                    <span class="from">
                      Patrick Nilson
                    </span>
                    <span class="time">
                      6 hours
                    </span>
                  </span>
                  <span class="text">
                    No sea takimata sanctus...
                  </span>
                </a>
              </li>
              <li class="footer">
                <a href="javascript:void(0);">
                  View all messages
                </a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#" class="dropdown-toggle row-bg-toggle">
              <i class="icon-resize-vertical">
              </i>
            </a>
          </li>
          <li class="dropdown">
            <a href="#" class="project-switcher-btn dropdown-toggle">
              <i class="icon-folder-open">
              </i>
              <span>
                项目
              </span>
            </a>
          </li>
          <li class="dropdown user">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="icon-male">
              </i>
              <span class="username">
                ${user.username}
              </span>
              <i class="icon-caret-down small">
              </i>
            </a>
            <ul class="dropdown-menu">
              <li>
                <a href="pages_user_profile.html">
                  <i class="icon-user">
                  </i>
                  我的资料
                </a>
              </li>
              <li>
                <a href="pages_calendar.html">
                  <i class="icon-calendar">
                  </i>
                  我的日历
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="icon-tasks">
                  </i>
                  我的任务
                </a>
              </li>
              <li class="divider">
              </li>
              <li>
                <a href="user/loginOut.do">
                  <i class="icon-key">
                  </i>
                  退出
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div id="project-switcher" class="container project-switcher">
        <div id="scrollbar">
          <div class="handle">
          </div>
        </div>
        <div id="frame">
          <ul class="project-list">
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-desktop">
                  </i>
                </span>
                <span class="title">
                  Lorem ipsum dolor
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-compass">
                  </i>
                </span>
                <span class="title">
                  Dolor sit invidunt
                </span>
              </a>
            </li>
            <li class="current">
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-male">
                  </i>
                </span>
                <span class="title">
                  Consetetur sadipscing elitr
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-thumbs-up">
                  </i>
                </span>
                <span class="title">
                  Sed diam nonumy
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-female">
                  </i>
                </span>
                <span class="title">
                  At vero eos et
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-beaker">
                  </i>
                </span>
                <span class="title">
                  Sed diam voluptua
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-desktop">
                  </i>
                </span>
                <span class="title">
                  Lorem ipsum dolor
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-compass">
                  </i>
                </span>
                <span class="title">
                  Dolor sit invidunt
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-male">
                  </i>
                </span>
                <span class="title">
                  Consetetur sadipscing elitr
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-thumbs-up">
                  </i>
                </span>
                <span class="title">
                  Sed diam nonumy
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-female">
                  </i>
                </span>
                <span class="title">
                  At vero eos et
                </span>
              </a>
            </li>
            <li>
              <a href="javascript:void(0);">
                <span class="image">
                  <i class="icon-beaker">
                  </i>
                </span>
                <span class="title">
                  Sed diam voluptua
                </span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <div id="container">
      <div id="sidebar" class="sidebar-fixed">
        <div id="sidebar-content">
          <form class="sidebar-search">
            <div class="input-box">
              <button type="submit" class="submit">
                <i class="icon-search">
                </i>
              </button>
              <span>
                <input type="text" placeholder="搜索...">
              </span>
            </div>
          </form>
          <div class="sidebar-search-results">
            <i class="icon-remove close">
            </i>
            <div class="title">
              Documents
            </div>
            <ul class="notifications">
              <li>
                <a href="javascript:void(0);">
                  <div class="col-left">
                    <span class="label label-info">
                      <i class="icon-file-text">
                      </i>
                    </span>
                  </div>
                  <div class="col-right with-margin">
                    <span class="message">
                      <strong>
                        John Doe
                      </strong>
                      received $1.527,32
                    </span>
                    <span class="time">
                      finances.xls
                    </span>
                  </div>
                </a>
              </li>
              <li>
                <a href="javascript:void(0);">
                  <div class="col-left">
                    <span class="label label-success">
                      <i class="icon-file-text">
                      </i>
                    </span>
                  </div>
                  <div class="col-right with-margin">
                    <span class="message">
                      My name is
                      <strong>
                        John Doe
                      </strong>
                      ...
                    </span>
                    <span class="time">
                      briefing.docx
                    </span>
                  </div>
                </a>
              </li>
            </ul>
            <div class="title">
              Persons
            </div>
            <ul class="notifications">
              <li>
                <a href="javascript:void(0);">
                  <div class="col-left">
                    <span class="label label-danger">
                      <i class="icon-female">
                      </i>
                    </span>
                  </div>
                  <div class="col-right with-margin">
                    <span class="message">
                      Jane
                      <strong>
                        Doe
                      </strong>
                    </span>
                    <span class="time">
                      21 years old
                    </span>
                  </div>
                </a>
              </li>
            </ul>
          </div>
          <ul id="nav">
            <li class="current">
              <a href="${contextPath}/loginUser/console.do" target="iframe">
                <i class="icon-dashboard">
                </i>
                控制台
              </a>
            </li>

            <li>
              <a href="javascript:void(0);">
                <i class="icon-edit">
                </i>
               系统管理
              </a>
              <ul class="sub-menu">
                <li>
                  <a href="${contextPath}/user/userload.do" target="iframe">
                    <i class="icon-angle-right">
                    </i>
                    用户管理
                  </a>
                </li>
                <li>
                  <a href="${contextPath}/roles/rolesload.do" target="iframe">
                    <i class="icon-angle-right">
                    </i>
                    角色管理
                  </a>
                </li>
                <li>
                  <a href="${contextPath}/permiss/permissload.do" target="iframe">
                    <i class="icon-angle-right">
                    </i>
                    权限管理
                  </a>
                </li>

              </ul>
            </li>
            <li>
              <a href="javascript:void(0);">
                <i class="icon-table">
                </i>
                表格
              </a>
              <ul class="sub-menu">
                <li>
                  <a href="tables_static.html">
                    <i class="icon-angle-right">
                    </i>
                    静态表格
                  </a>
                </li>
                <li>
                  <a href="tables_dynamic.html">
                    <i class="icon-angle-right">
                    </i>
                    动态表格
                  </a>
                </li>
                <li>
                  <a href="tables_responsive.html">
                    <i class="icon-angle-right">
                    </i>
                    响应式表格
                  </a>
                </li>
              </ul>
            </li>


          </ul>
          <div class="sidebar-widget align-center">
            <div class="btn-group" data-toggle="buttons" id="theme-switcher">
              <label class="btn active">
                <input type="radio" name="theme-switcher" data-theme="bright">
                <i class="icon-sun">
                </i>
                白天
              </label>
              <label class="btn">
                <input type="radio" name="theme-switcher" data-theme="dark">
                <i class="icon-moon">
                </i>
                夜晚
              </label>
            </div>
          </div>
        </div>
        <div id="divider" class="resizeable">
        </div>
      </div>
      <div id="content">

        <iframe id="iframe" name="iframe" src="" class="embed-responsive-item" frameborder="0"
                scrolling="auto" >

        </iframe>

      </div>
    </div>

  </body>

</html>