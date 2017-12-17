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
    <#--<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/xcConfirm.css"/>-->
    <#--<script src="${request.contextPath}/static/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>-->
    <#--<script src="${request.contextPath}/static/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>-->
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
<#include "../include/header.ftl" encoding="UTF-8" parse=true>

<input id="search" type="hidden" value="<#if userInfo.companyName??>${userInfo.companyName}</#if>">

<div class="main" id="main">
    <div class="main-inner">
        <div style="height: 40px;"></div>
    <div class="main-list" align="center">


            <#if pageInfo.list ??>

                <table>
                    <thead>
                <#if (pageInfo.total != 0)>
                <tr>
                    <td style="width: 20%;">单位名称</td>
                    <td style="width: 30%;">地址</td>
                    <td style="width: 50%;">备注</td>
                </tr>
                </#if>
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
        <#if (pageInfo.total == 0)>
                <div style="width: 100%;text-align: center">
                    <span style="size: 20px">在上方输入框内，输入需要查询的公司名称或地区 例如<b style="color:red">北京</b></span>
                </div>
        </#if>
    </div>
</div>

<div style="width: 100%;text-align: center;margin-top: 100px;">
<#if footer_advertising_index_pc.pageValue??>${footer_advertising_index_pc.pageValue}</#if>
</div>

<#include "../include/footer.ftl" encoding="UTF-8" parse=true>

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
        if (common == "" || null == common) {
            window.location.href = "${request.contextPath}/index";
        } else {
            window.location.href = "${request.contextPath}/index/" + page + "/" + pageSize + "/" + common + "#main";
        }
    }

    $(function () {
        $('#search1').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                var input = document.getElementById("search1");
                input.blur();
                var common = input.value;
                alert(common+${pageInfo.pageSize});
                if (common == "" || null == common) {
                    window.location.href = "${request.contextPath}/index";
                } else {
                    window.location.href = "${request.contextPath}/index/" + 1 + "/" + ${pageInfo.pageSize} + "/" + common + "#main";
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
                    window.location.href = "${request.contextPath}/index";
                } else {
                    window.location.href = "${request.contextPath}/index/1/" + ${pageInfo.pageSize} + "/" + common + "#main";
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
                window.location.href = "${request.contextPath}/index";
            } else {
                window.location.href = "${request.contextPath}/index/1/" + ${pageInfo.pageSize} + "/" + common + "#main";
            }

        }
    };

    $("#btnInsert").click(function () {
        var txt = "请输入";
        window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.input, {
            onOk: function (v) {
                console.log(v);
            }
        });
    });


</script>

</body>
</html>