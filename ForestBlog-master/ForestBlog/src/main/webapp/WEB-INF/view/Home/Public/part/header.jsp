<%--
    博客顶部部分
    包括：顶部菜单，主要菜单(包括搜索按钮)，面包屑
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<link rel="icon" href="img/core-img/favicon.ico">

<style type="text/css">

</style>

<header class="header-area">

    <!-- Top Header Area -->
    <div class="top-header">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <!-- Breaking News Area -->
                <div class="col-12 col-sm-8">
                    <div class="breaking-news-area">
                        <div id="breakingNewsTicker" class="ticker">
                            <c:choose>
                                <c:when test="${sessionScope.user==null}">
                                    <a href="/admin">登录</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/admin">进入后台</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!-- Top Social Area -->
                <div class="clear"> </div>
                <div class="menu-topmenu-container">
                    <ul id="menu-topmenu" class="top-menu">
                        <c:forEach items="${menuList}" var="m">
                            <li class="menu-item">
                                <c:if test="${m.menuLevel==1}">
                                    <a href="${m.menuUrl}" >
                                        <i class="${m.menuIcon}"></i>
                                        <span class="font-text">${m.menuName}&nbsp;</span>&nbsp;
                                    </a>
                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Logo Area -->
    <div class="logo-area text-center">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <a href="/" class="original-logo"><img src="/img/logo.png" alt=""></a>
                </div>
            </div>
        </div>
    </div>

    <%--主要菜单 satrt--%>
    <div id="menu-box">
        <div id="top-menu">
            <div id="site-nav-wrap">
                <nav id="site-nav" class="main-nav">
                    <div class="menu-pcmenu-container">
                        <ul id="menu-pcmenu" class="down-menu nav-menu sf-js-enabled sf-arrows">

                            <li>
                                <a href="/">
                                    <i class="fa-home fa"></i>
                                    <span class="font-text">首页</span>
                                </a>
                            </li>

                            <c:forEach items="${allCategoryList}" var="category">
                                <c:if test="${category.categoryPid==0}">
                                    <li>
                                        <a href="/category/${category.categoryId}">
                                            <i class="${category.categoryIcon}"></i>
                                            <span class="font-text">${category.categoryName}&nbsp;</span>
                                        </a>
                                        <ul class="sub-menu">
                                            <c:forEach items="${allCategoryList}" var="cate">
                                                <c:if test="${cate.categoryPid==category.categoryId}">
                                                    <li>
                                                        <a href="/category/${cate.categoryId}" target="_blank">${cate.categoryName}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <%--主要菜单其余部分--%>
                            <c:forEach items="${menuList}" var="m">
                                <c:if test="${m.menuLevel == 2}">
                                    <li>
                                        <a href="${m.menuUrl}">
                                            <i class="${m.menuIcon}"></i>
                                            <span class="font-text">${m.menuName}&nbsp;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div><!-- #menu-box -->
</header>

<rapid:block name="breadcrumb"></rapid:block>

