<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><#if site_title_notice.pageValue??>${site_title_notice.pageValue}</#if></title>
    <meta name="keywords" content="<#if keywords.pageValue??>${keywords.pageValue}</#if>"/>
    <meta name="description" content="<#if description.pageValue??>${description.pageValue}</#if>"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="fragment" content="!">
    <link rel="icon" type="image/x-icon" href="${request.contextPath}/static/favicon.ico">
    <link rel="stylesheet" href="${request.contextPath}/static/css/global.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/animate.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/toast.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/centermenu.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/default.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/component.css"/>
    <script src="${request.contextPath}/static/js/modernizr.custom.js"></script>
</head>

<style>
    body, html {
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .ul-centermenu {
        width: 200px;
        margin: 0 auto;
    }

    .ul-centermenu li {
        width: 100%;
        text-align: center;
        margin-bottom: 15px;
    }

</style>

<body>
<#--广告区 -->
<div style="width: 100%;text-align: center;">

</div>
<#list pageInfo.list as list >
<div class="md-modal md-effect-${list_index+1}" id="modal-${list.id}">

    <div class="md-content">

        <h3>${list.title}</h3>
        <div>
        ${list.content}
            <button class="md-close">ok</button>
        </div>
    </div>

</div>

</#list>
<p style="width: 300px;margin: 50px auto;background: #222;color: #fff;margin-bottom: 40px;border-radius: 6px;padding: 10px;font-size: 14px;line-height: normal;">
<#if header_notice.pageValue??>${header_notice.pageValue}</#if></p>
<ul class="ul-centermenu">
<#list pageInfo.list as list>
    <li class="dw-btn btn-danger has-hover centermenu md-trigger"
        data-modal="modal-${list.id}">${list.title}</li>
</#list>
</ul>

<div name="footer" style="width: 100%;text-align: center;margin: 30px auto;">
<#if footer_notice.pageValue??>${footer_notice.pageValue}</#if>
</div>

<div name="" style="width: 100%;text-align: center;">
<#if js_notice.pageValue??>${js_notice.pageValue}</#if>
</div>

<script src="${request.contextPath}/static/js/classie.js"></script>
<script src="${request.contextPath}/static/js/modalEffects.js"></script>
<script>
    // this is important for IEs
    var polyfilter_scriptpath = '/js/';
</script>
<script src="${request.contextPath}/static/js/cssParser.js"></script>
<script src="${request.contextPath}/static/js/css-filters-polyfill.js"></script>
<script src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script language="JavaScript" type="text/javascript">
    var s = ["btn-danger", "btn-success", "btn-primary", "btn-warning"]
    var i = 0;
    $("ul li").each(function () {
        $(this).removeClass();
        i++
        if (i >= 4) {
            i = 0;
        }
        $(this).addClass("dw-btn " + s[i] + " has-hover centermenu md-trigger");

    });


</script>
</body>

</html>