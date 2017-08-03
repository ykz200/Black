<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IT黑目录-公告</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="fragment" content="!">
    <#--<title><#if site_title.pageValue??>${site_title.pageValue}</#if></title>-->
    <#--<meta name="keywords" content="<#if keywords.pageValue??>${keywords.pageValue}</#if>"/>-->
    <#--<meta name="description" content="<#if description.pageValue??>${description.pageValue}</#if>"/>-->
    <link rel="icon" type="image/x-icon" href="${request.contextPath}/static/favicon.ico">


    <link rel="stylesheet" href="${request.contextPath}/static/css/global.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/animate.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/toast.css">
    <link rel="stylesheet" href="${request.contextPath}/static/css/centermenu.css">

    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/default.css" />
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/component.css" />
    <script src="${request.contextPath}/static/js/modernizr.custom.js"></script>
</head>

<style>
    body,html{
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .ul-centermenu{
        width: 200px;
        margin: 0 auto;
    }

    .ul-centermenu li{
        width: 100%;
        text-align: center;
        margin-bottom: 15px;
    }

</style>

<body>
<div class="md-modal md-effect-1" id="modal-1">

    <div class="md-content">

        <h3>Modal Dialog</h3>

        <div>

            <p>This is a modal window. You can do the following things with it:</p>

            <ul>

                <li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>

                <li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>

                <li><strong>Close:</strong> click on the button below to close the modal.</li>

            </ul>

            <button class="md-close">Close me!</button>

        </div>

    </div>

</div>
<p style="width: 300px;margin: 50px auto;background: #222;color: #fff;margin-bottom: 40px;border-radius: 6px;padding: 10px;font-size: 14px;line-height: normal;">我们的目的很明显,只是为了竭尽我们的力量去帮助我们能够帮助的同伴。</p>
<ul class="ul-centermenu">

    <li class="dw-btn btn-danger has-hover centermenu md-trigger" data-modal="modal-1" >样例</li>


</ul>
<script src="${request.contextPath}/static/js/classie.js"></script>
<script src="${request.contextPath}/static/js/modalEffects.js"></script>
<script>
    // this is important for IEs
    var polyfilter_scriptpath = '/js/';
</script>
<script src="${request.contextPath}/static/js/cssParser.js"></script>
<script src="${request.contextPath}/static/js/css-filters-polyfill.js"></script>

</body>

</html>