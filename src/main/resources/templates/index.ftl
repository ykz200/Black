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
    <!--页面手动定义 css start -->
    <link rel="stylesheet" href="${request.contextPath}/static/index/css/style.css">
    <!--页面手动定义 css end -->
    <!-- 弹框 start-->
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/xcConfirm.css"/>
    <script src="${request.contextPath}/static/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${request.contextPath}/static/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <!-- 弹框 end -->


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

<input id="search" type="hidden" value="<#if userInfo.common??>${userInfo.common}</#if>">


<div class="main" id="main">
    <iframe name="iframe" id="iframe" style="width: 100%;height: 100%" frameborder="no" border="0"
            src="${request.contextPath}/content/content" onload="iFrameHeight()"></iframe>
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
    var iframeContent = document.getElementById("iframe");
    <#--if ("" != '${iframeUrl}') {-->
        <#--iframeContent.setAttribute('src', '${iframeUrl}')-->
    <#--}-->

    /**
     * 查询
     * @param page
     * @param pageSize
     */
    function searchFrom(page, pageSize) {
        var common = document.getElementById("search").value;
        if (common == "" || null == common) {

            iframeContent.setAttribute('src', "${request.contextPath}/content/content");
        } else {
        <#--window.location.href = "${request.contextPath}/index/" + page + "/" + pageSize + "/" + common + "#main";-->
            iframeContent.setAttribute('src', "${request.contextPath}/content/content/" + page + "/" + pageSize + "/" + common + "#main");
        }
    }

    $(function () {
        $('#search1').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                var input = document.getElementById("search1");
                input.blur();
                var common = input.value;
                alert(common +${pageInfo.pageSize});
                if (common == "" || null == common) {
                <#--window.location.href = "${request.contextPath}/content/content#main";-->
                    iframeContent.setAttribute('src', "${request.contextPath}/content/content#main");
                } else {
                <#--window.location.href = "${request.contextPath}/content/content/" + 1 + "/" + ${pageInfo.pageSize} + "/" + common + "#main";-->
                    iframeContent.setAttribute('src', "${request.contextPath}/content/content/" + 1 + "/" + ${pageInfo.pageSize} +"/" + common + "#main");
                }
            }
        });
    });

    $(function () {
        $('#search2').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                var input = document.getElementById("search2");
                input.blur();
                var common = input.value;
                alert(common);
                if (common == "" || null == common) {
                <#--window.location.href = "${request.contextPath}/content/content#main";-->
                    iframeContent.setAttribute('src', "${request.contextPath}/content/content#main");
                } else {
                <#--window.location.href = "${request.contextPath}/content/content/1/" + ${pageInfo.pageSize} + "/" + common + "#main";-->
                    iframeContent.setAttribute('src', "${request.contextPath}/content/content/1/" + ${pageInfo.pageSize} +"/" + common + "#main");
                }
            }
        });
    });

    document.onkeydown = function (event) {
        var e = event || window.event;
        if (e && e.keyCode == 13) {
            var input = document.getElementById("search2");
            input.blur();
            var common = input.value;

            if (common == "" || null == common) {
            <#--window.location.href = "${request.contextPath}/content/content#main";-->
                iframeContent.setAttribute('src', "${request.contextPath}/content/content#main");
            } else {

            <#--window.location.href = "${request.contextPath}/content/content/1/" + ${pageInfo.pageSize} + "/" + common + "#main";-->
                iframeContent.setAttribute('src', "${request.contextPath}/content/content/1/" + ${pageInfo.pageSize} +"/" + common + "#main");
            }

        }
    };

    function iFrameHeight() {
        var ifm = document.getElementById("iframe");

        var subWeb = document.frames ? document.frames["iframe"].document :
                ifm.contentDocument;
        if (ifm != null && subWeb != null) {
            $("#main").height(subWeb.body.scrollHeight + "px");

        }
    }

</script>

</body>
</html>