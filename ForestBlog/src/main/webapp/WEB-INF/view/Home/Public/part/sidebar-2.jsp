<%--
    一般用于首页侧边栏：
    包括 关于本站，网站概况，热评文章，所有标签，随机文章 等小工具

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script type="text/javascript" src="/js/out/tagcloud.js"></script>
<style type="text/css">
    .wrapper{ width: 500px; height: 400px; margin: 0 auto; }
    .tagcloud { position: relative; margin-top:0px; }
    .tagcloud a{ position: absolute;  top: 0; left: 0;  display: block; padding: 11px 30px; color: #333; font-size: 16px; border: 1px solid #e6e7e8; border-radius: 18px; background-color: #f2f4f8; text-decoration: none; white-space: nowrap;
        -o-box-shadow: 6px 4px 8px 0 rgba(151,142,136,.34);
        -ms-box-shadow: 6px 4px 8px 0 rgba(151,142,136,.34);
        -moz-box-shadow: 6px 4px 8px 0 rgba(151,142,136,.34);
        -webkit-box-shadow: 6px 4px 8px 0 rgba(151,142,136,.34);
        box-shadow: 6px 4px 8px 0 rgba(151,142,136,.34);
        -ms-filter:"progid:DXImageTransform.Microsoft.Shadow(Strength=4,Direction=135, Color='#000000')";/*兼容ie7/8*/
        filter: progid:DXImageTransform.Microsoft.Shadow(color='#969696', Direction=125, Strength=9);
        /*strength是阴影大小，direction是阴影方位，单位为度，可以为负数，color是阴影颜色 （尽量使用数字）使用IE滤镜实现盒子阴影的盒子必须是行元素或以行元素显示（block或inline-block;）*/
    }
    .tagcloud a:hover{ color: #3385cf; }
</style>

<%--博客主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

    <%--搜索框--%>
    <aside class="widget widget_search">
        <div class="searchbar">
            <form method="get" id="searchform1" action="/search">
                    <span> <input type="text" value="" name="keywords" id="s1" placeholder="输入搜索内容" required="">
                        <button type="submit" id="searchsubmit1">搜索</button>
                    </span>
            </form>
        </div>
        <div class="clear"></div>
    </aside>
    <%--搜索框--%>

    <%--网站概况 start--%>
    <aside id="php_text-22" class="widget php_text">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>网站概况
        </h3>
        <div class="textwidget widget-text">
            <ul class="site-profile">
                <li><i class="fa fa-file-o"></i> 文章总数：${siteBasicStatistics[0]} 篇</li>
                <%--<li><i class="fa fa-commenting-o"></i> 留言数量：${siteBasicStatistics[1]} 条</li>--%>
                <li><i class="fa fa-folder-o"></i> 分类数量：${siteBasicStatistics[2]} 个</li>
                <li><i class="fa fa-tags"></i> 标签总数：${siteBasicStatistics[3]} 个</li>
                <li><i class="fa fa-link"></i> 链接数量：${siteBasicStatistics[4]} 个</li>
                <li><i class="fa fa-eye"></i> 浏览总量：${siteBasicStatistics[5]} 次</li>
                <li style="display: none"><i class="fa fa-pencil-square-o"></i> 最后更新：
                    <span style="color:#2F889A">
                        <fmt:formatDate value="${lastUpdateArticle.articleUpdateTime}" pattern="yyyy年MM月dd日"/>
                    </span>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--网站概况 end--%>

    <%--所有标签 start--%>
    <aside class="widget">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>所有标签
        </h3>
        <div class="tagcloud" style="height: 400px">
            <c:forEach items="${allTagList}" var="tag">
                <a href="/tag/${tag.tagId}">${tag.tagName}</a>
            </c:forEach>
            <div class="clear"></div>
        </div>

        <%--外部导入的标签云样式--%>
        <script type="text/javascript">
            /*3D标签云*/
            tagcloud({
                selector: ".tagcloud",  //元素选择器
                fontsize: 14,       //基本字体大小, 单位px，之前为16
                radius: 100,         //滚动半径, 单位px，之前为100
                mspeed: "normal",   //滚动最大速度, 取值: slow, normal(默认), fast
                ispeed: "normal",   //滚动初速度, 取值: slow, normal(默认), fast
                direction: 135,     //初始滚动方向, 取值角度(顺时针360): 0对应top, 90对应left, 135对应right-bottom(默认)...
                keep: false          //鼠标移出组件后是否继续随鼠标滚动, 取值: false, true(默认) 对应 减速至初速度滚动, 随鼠标滚动
            });
        </script>

        <div class="clear"></div>
    </aside>
    <%--所有标签 end--%>

</div>



<%--博客主体-右侧侧边栏 end--%>
