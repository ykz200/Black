<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="fragment" content="!">
    <title><#if site_title.pageValue??>${site_title.pageValue}</#if></title>
    <meta name="keywords" content="<#if keywords.pageValue??>${keywords.pageValue}</#if>"/>
    <meta name="description" content="<#if description.pageValue??>${description.pageValue}</#if>"/>
    <link rel="shortcut icon" href="${request.contextPath}/static/index/favicons/1.png">
    <link rel="stylesheet" href="${request.contextPath}/static/index/css/reset.css">
    <link rel="stylesheet" href="${request.contextPath}/static/index/css/index.css">

    <style>
        @keyframes swing {
            0% {
                transform: rotate(0);
            }
            20% {
                transform: rotate(116deg);
            }
            40% {
                transform: rotate(60deg);
            }
            60% {
                transform: rotate(98deg);
            }
            80% {
                transform: rotate(76deg);
            }
            100% {
                transform: rotate(82deg);
            }
        }

        div.row:nth-child(1) input {
            border-radius: 0;
            border-width: 1px 0;
        }

        div.row:nth-child(1) input + span {
            background: transparent;
        }

        div.row:nth-child(1) input:focus + span,
        div.row:nth-child(1) input:active + span {
            background: transparent;
            border: 1px solid #fff;
            border-radius: 0;
            border-width: 0 0 0 1px;
            animation: halfLeft .6s ease-in;
            animation-fill-mode: forwards;
        }

        @keyframes halfLeft {
            20% {
                transform: translateX(-60%);
            }
            40% {
                transform: translateX(-42%);
            }
            60% {
                transform: translateX(-56%);
            }
            80% {
                transform: translateX(-46%);
            }
            100% {
                transform: translateX(-50%);
            }
        }

        @keyframes borderAnim {
            25% {
                border-top-color: rgba(255, 255, 255, 0);
                border-right-color: white;
                border-bottom-color: white;
                border-left-color: rgba(255, 255, 255, 0);
            }
            50% {
                border-top-color: white;
                border-right-color: white;
                border-bottom-color: white;
                border-left-color: rgba(255, 255, 255, 0);
            }
            75% {
                border-top-color: white;
                border-right-color: white;
                border-bottom-color: white;
                border-left-color: white;
            }
        }

        @keyframes shadowGo {
            0% {
                background-position: 0 0;
            }
            100% {
                background-position: -600% 0%;
            }
        }

        table {
            border: 1px solid #ccc;
            /*width: 80%;*/
            margin: 0;
            padding: 0;
            border-collapse: collapse;
            border-spacing: 0;
            margin: 0 auto;
        }

        table tr {
            border: 1px solid #ddd;
            padding: 5px;
        }

        table th, table td {
            padding: 10px;
            text-align: center;
        }

        table th {
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
        }

        @media screen and (max-width: 600px) {

            table {
                border: 0;
            }

            table thead {
                display: none;
            }

            table tr {
                margin-bottom: 10px;
                display: block;
                border-bottom: 2px solid #ddd;
            }

            table td {
                display: block;
                text-align: right;
                font-size: 13px;
                border-bottom: 1px dotted #ccc;
            }

            table td:last-child {
                border-bottom: 0;
            }

            table td:before {
                content: attr(data-label);
                float: left;
                text-transform: uppercase;
                font-weight: bold;
            }
        }

        .note {
            max-width: 80%;
            margin: 0 auto;
        }

        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        ul.pagination li {
            display: inline;
        }

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        .pagination li:first-child a {
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .pagination li:last-child a {
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        ul.pagination li a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }

        ul.pagination li a:hover:not(.active) {
            background-color: #ddd;
        }

        @font-face {
            font-family: 'webfont';
            src: url('webfont.eot'); /* IE9*/
            src: url('webfont.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */ url('webfont.woff') format('woff'), /* chrome、firefox */ url('webfont.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/ url('webfont.svg#webfont') format('svg'); /* iOS 4.1- */
        }

        .web-font {
            font-family: "webfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
        }

        div .a {
            float: left;
        }

    </style>
</head>
<body>
<#--广告区 head_advertising_index_pc -->
<div style="width: 100%;text-align: center;">
<#if head_advertising_index_pc.pageValue??>${head_advertising_index_pc.pageValue}</#if>
</div>

<div style="text-align: center;margin-top: 10px;">
<#if header_index.pageValue??>${header_index.pageValue}</#if>
    <#--<span>如果有未收录的黑企信息，请将企业信息的以邮件的方式发送至-->
    <#--<a href="mailto:keshu@bhusk.com">keshu#bhusk.com</a>-->
    <#--。请将<span style="color: red;">#</span>替换为<span style="color: red;">@</span></span>-->
</div>
<#include "include/header.ftl" encoding="UTF-8" parse=true>

<input id="search" type="hidden" value="<#if userInfo.companyName??>${userInfo.companyName}</#if>">

<div class="main" id="main">
    <div class="main-inner">
        <div style="height: 40px;"></div>
    <div class="main-list" align="center">
    <#if pageInfo.list ??>
        <table>
            <thead>
            <tr>
                <td>单位名称</td>
                <td>地址</td>
                <td>备注</td>
            </tr>
            </thead>
            <tbody>

                <#list pageInfo.list as ci>
                <tr>
                    <td>${ci.companyName}</td>
                    <td>${ci.position}</td>
                    <td>${ci.remarks}</td>
                </tr>
                </#list>
            </tbody>
        </table>

        <!-- pagehelper 分页插件-->
        <div style="text-align: center; margin-top: 50px;">
            <ul class="pagination">
                <#if pageInfo.hasPreviousPage>
                    <li><a onclick="searchFrom(1,${pageInfo.pageSize})" href="#">首页</a></li>
                    <li><a onclick="searchFrom(${pageInfo.prePage},${pageInfo.pageSize})" href="#">«</a></li>
                </#if>
                <#list pageInfo.navigatepageNums as nav>
                    <#if nav == pageInfo.pageNum>
                        <li><a class="active" href="#">${nav}</a></li>
                    </#if>
                    <#if nav != pageInfo.pageNum>
                        <li>
                            <a onclick="searchFrom(${nav},${pageInfo.pageSize})" href="#">${nav}</a>
                        </li>
                    </#if>
                </#list>
                <#if pageInfo.hasNextPage>
                    <li>
                        <a onclick="searchFrom(${pageInfo.nextPage},${pageInfo.pageSize})" href="#">下一页</a>
                    </li>
                    <li>
                        <a onclick="searchFrom(${pageInfo.pages},${pageInfo.pageSize})" href="#">尾页</a>
                    </li>
                </#if>
            </ul>
        </div>
        <!-- pagehelper 分页插件 结束-->
    </div>
    <#else >
        道歉，暂无这家公司黑企相关信息~ 如果这家公司有黑企性质 请<b><span onclick="{window.location.href='mailto:keshu@bhusk.com'}"
                                               style="color: orangered;cursor:pointer;">举报</span></b> ,我们会进行收录!
    </#if>
    </div>
</div>

<div style="width: 100%;text-align: center;margin-top: 100px;">
<#if footer_advertising_index_pc.pageValue??>${footer_advertising_index_pc.pageValue}</#if>
</div>

<#include "include/footer.ftl" encoding="UTF-8" parse=true>

<div class="elevator-wrap">
    <a href="javascript:;" id="elevator"></a>
</div>

<script src="${request.contextPath}/static/index/js/jquery.js"></script>
<script src="${request.contextPath}/static/index/js/script.js"></script>
<!--footer_advertising_index_pc-->

<#if js_index.pageValue??>${js_index.pageValue}</#if>
<script src="${request.contextPath}/static/js/tingyun-rum.js"></script>
<script language="JavaScript" type="text/javascript">

    /**
     * 查询
     * @param page
     * @param pageSize
     */
    function searchFrom(page, pageSize) {
        var common = document.getElementById("search").value;

        if (common == "") {
            common = "1"
        }

        window.location.href = "${request.contextPath}/index/" + page + "/" + pageSize + "/" + common + "#main";
    }


</script>

</body>
</html>