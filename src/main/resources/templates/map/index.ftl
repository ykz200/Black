<!DOCTYPE html>
<html class=" -webkit-">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="fragment" content="!">
    <title><#if site_title.pageValue??>${site_title.pageValue}</#if></title>
    <meta name="keywords" content="<#if keywords.pageValue??>${keywords.pageValue}</#if>"/>
    <meta name="description" content="<#if description.pageValue??>${description.pageValue}</#if>"/>
    <link rel="icon" type="image/x-icon" href="${request.contextPath}/static/favicon.ico">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/map/index.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/map/layer.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/css/map/jquery.css">
    <link href="${request.contextPath}/static/css/map/layer(1).css" type="text/css" rel="styleSheet" id="layermcss">

    <style type="text/css">
        body {
            font-family: arial;
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

    </style>
<#--<div style="width: 100%;text-align: center;">-->
<#if head_map_index.pageValue??>${head_map_index.pageValue}</#if>
<#--</div>-->
</head>

<body>
<!--广告区 head_advertising_index_map-->
<div style="width: 100%;text-align: center;">
<#if head_advertising_index_map.pageValue??>${head_advertising_index_map.pageValue}</#if>
</div>

<div class="main_div">

    <div class="bottom_div">
        <div class="bottom_text">
        <#if header_map_index.pageValue??>${header_map_index.pageValue}</#if>
        </div>
    </div>
    <div class="car_input">
        <input type="text" name="common" id="common" value="<#if common??>${common}<#else>请输入单位名称或地址</#if>"
               autocomplete="off" class="ac_input">
    </div>
    <div class="next_step" onclick="searchFrom()">
        查询
    </div>
</div>
</div>
<div align="center">
<#if pageInfo ??>

<table>
    <thead>
    <tr>
        <th>单位名称</th>
        <th>地址</th>
        <th>备注</th>
    </tr>
    </thead>
    <tbody>
        <#list pageInfo as ci>
        <tr>
            <td data-label="单位名称">${ci.companyName}</td>
            <td data-label="地址">${ci.position}</td>
            <td data-label="备注">${ci.remarks}</td>
        </tr>
        </#list>
    </tbody>
</table>
<#else >
    道歉，暂无这家公司黑企相关信息~ 如果这家公司有黑企性质 请<b><span onclick="{window.location.href='${request.contextPath}/addCompany'}" style="color: orangered;cursor:pointer;">举报</span></b> ,我们会进行收录!
</#if>
</div>
<div name="footer" style="width: 100%;text-align: center;margin: 30px auto;">
<#if footer_map.pageValue??>${footer_map.pageValue}</#if>
</div>
<div style="width: 100%;text-align: center;">
<#if footer_advertising_index_map.pageValue??>${footer_advertising_index_map.pageValue}</#if>
</div>
<#if js_map_index.pageValue??>${js_map_index.pageValue}</#if>
<script src="${request.contextPath}/static/js/tingyun-rum.js"></script>
<script src="${request.contextPath}/static/js/map/jquery-1.7.1.js"></script>
<script src="${request.contextPath}/static/js/map/jquery.min.js"></script>
<script src="${request.contextPath}/static/js/map/jquery.autocomplete.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${request.contextPath}/static/js/map/layer.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" language="JavaScript">
    var defaultValue = "请输入单位名称或地址";
    $(".ac_input").focus(function () {
        var oldValue = $(this).val();

        if (oldValue == defaultValue) {
            $(this).val("").addClass('focus-fon');
        }

    }).blur(function () {
        var oldValue = $(this).val();
        if (oldValue == "") {
            $(this).val(defaultValue).removeClass('focus-fon');

        }
    });

    function searchFrom() {
        var common = document.getElementById("common").value;
        window.location.href = "${request.contextPath}/map/index/" + common + "";
    }
</script>

</body>
</html>