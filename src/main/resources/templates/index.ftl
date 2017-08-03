<!DOCTYPE html>
<html class=" -webkit-">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="fragment" content="!">
    <title><#if site_title.pageValue??>${site_title.pageValue}</#if></title>
    <meta name="keywords" content="<#if keywords.pageValue??>${keywords.pageValue}</#if>"/>
    <meta name="description" content="<#if description.pageValue??>${description.pageValue}</#if>"/>
    <link rel="icon" type="image/x-icon" href="${request.contextPath}/static/favicon.ico">

    <script src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<#if head_index.pageValue??>${head_index.pageValue}</#if>
    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline
        }

        article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
            display: block
        }

        body {
            line-height: 1;
            /*background-color: #1FE7CF;*/
            background-color: #70cef0;
            font-family: arial;
        }

        ol, ul {
            list-style: none
        }

        blockquote, q {
            quotes: none
        }

        blockquote:before, blockquote:after, q:before, q:after {
            content: '';
            content: none
        }

        table {
            border-collapse: collapse;
            border-spacing: 0
        }

        @charset "UTF-8";
        /* 重置*/
        *, *:before, *:after {
            box-sizing: border-box;
        }

        /*容器设置*/
        #container {
            counter-reset: counterA;
        }

        /*布局实现*/
        div.row {
            position: relative;
            width: 100%;
            height: 20vw;
            padding-left: 15vw;
            counter-increment: counterA;
            /*设置背景色，随机颜色*/
        }

        div.row:before {
            content: counter(counterA);
            color: rgba(255, 255, 255, 0.05);
            font-size: 10vw;
            position: absolute;
            left: 0px;
        }

        div.row label {
            position: relative;
            display: block;
            float: left;
            margin: 8vw 2vw;
        }

        div.row label input {
            width: 160px;
            height: 30px;
            line-height: 30px;
            background: rgba(255, 255, 255, 0.1);
            border: none;
            outline: none;
            border: 1px solid #fff;
            color: #000000;
            padding: 4px 10px;
            border-radius: 4px;
            text-indent: 38px;
            transition: all .3s ease-in-out;
        }

        div.row label input ::-webkit-input-placeholder {
            color: transparent;
        }

        div.row label input + span {
            position: absolute;
            left: 0;
            top: 0;
            color: #fff;
            background: #7AB893;
            display: inline-block;
            padding: 7px 4px;
            transform-origin: left center;
            transform: perspective(300px);
            transition: all .3s ease-in-out;
            border-radius: 4px 0 0 4px;
        }

        div.row label input:focus,
        div.row label input:active {
            text-indent: 0;
            background: rgba(255, 255, 255, 0.2);
        }

        div.row label input:focus ::-webkit-input-placeholder,
        div.row label input:active ::-webkit-input-placeholder {
            color: #f00;
        }

        div.row label input:focus + span,
        div.row label input:active + span {
            background: #478560;
        }

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
            width: 80%;
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


    </style>


    <script src="${request.contextPath}/static/js/prefixfree.min.js"></script>

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
<div class="note">
    <div id="container">
        <div class="row">
            <form id="form">
                <label>
                    <input type="text" name="companyName" id="companyName"
                           value="<#if userInfo.companyName??>${userInfo.companyName}</#if>"/>
                    <span>单位</span>
                </label>
                <label>
                    <input type="text" name="position" id="position"
                           value="<#if userInfo.position??>${userInfo.position}</#if>"/>
                    <span>地址</span>
                </label>
                <label>
                    <button type="button"
                            style="background-color: #ffffff;width: 100px;height: 30px;border: 1px #70cef0 solid;"
                            onclick="searchFrom(1,${pageInfo.pageSize})">
                        <span style="font-family: 微软雅黑;">查询</span>
                    </button>
                </label>
            </form>
        </div>

    </div>

</div>

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

<div name="footer" style="width: 100%;text-align: center;margin: 30px auto;">
<#if footer_pc.pageValue??>${footer_pc.pageValue}</#if>
</div>
<!--footer_advertising_index_pc-->
<div style="width: 100%;text-align: center;">
<#if footer_advertising_index_pc.pageValue??>${footer_advertising_index_pc.pageValue}</#if>
</div>
<#if js_index.pageValue??>${js_index.pageValue}</#if>
<script src="${request.contextPath}/static/js/tingyun-rum.js"></script>
<script type="application/javascript">
    /**
     * 查询
     * @param page
     * @param pageSize
     */
    function searchFrom(page, pageSize) {
        var companyName = document.getElementById("companyName").value;
        var position = document.getElementById("position").value;
        if (companyName == "") {
            companyName = "1"
        }
        if (position == "") {
            position = "1"
        }
        window.location.href = "${request.contextPath}/index/" + page + "/" + pageSize + "/" + companyName + "/" + position
    }
</script>
</body>
</html>