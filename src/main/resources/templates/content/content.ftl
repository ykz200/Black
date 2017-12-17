<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="fragment" content="!">
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
<input id="search" type="hidden" value="<#if userInfo.common??>${userInfo.common}</#if>">

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
                    <li><a onclick="searchFrom(${pageInfo.prePage},${rows})" href="#">«</a></li>
                </#if>
                <#list pageInfo.navigatepageNums as nav>
                    <#if nav == pageInfo.pageNum>
                        <li><a class="active" href="#">${nav}</a></li>
                    </#if>
                    <#if nav != pageInfo.pageNum>
                        <li>
                            <a onclick="searchFrom(${nav},${rows})" href="#">${nav}</a>
                        </li>
                    </#if>
                </#list>
                <#if pageInfo.hasNextPage>
                    <li>
                        <a onclick="searchFrom(${pageInfo.nextPage},${rows})" href="#">下一页</a>
                    </li>
                    <li>
                        <a onclick="searchFrom(${pageInfo.pages},${rows})" href="#">尾页</a>
                    </li>
                </#if>
                    </ul>
                </div>
                <!-- pagehelper 分页插件 结束-->
    </div>

            </#if>
            <#if (showStatus == 0)>
                道歉，暂无这家公司黑企相关信息~ 如果这家公司有黑企性质 请<b><span
                    onclick="{window.location.href='${request.contextPath}/addCompany'}"
                    style="color: orangered;cursor:pointer;">举报</span></b> ,我们会进行收录!
            </#if>
        <#if (showStatus == -1)>
                <div style="width: 100%;height:100px;text-align: center">

                    <span style="size: 20px">在上方输入框内，输入需要查询的公司名称或地区 例如<b style="color:red">北京</b></span>
                </div>
        </#if>
    </div>

</div>
</div>

</body>
<script src="${request.contextPath}/static/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
<script language="JavaScript" type="text/javascript">

    /**
     * 查询
     * @param page
     * @param pageSize
     */
    function searchFrom(page, pageSize) {
        var common = document.getElementById("search").value;

        if (common == "" || null == common) {
            common = 1
        }
        window.location.href = "${request.contextPath}/content/content/" + page + "/" + pageSize + "/" + common;
    }
</script>
<#if js_index.pageValue??>${js_index.pageValue}</#if>
</html>