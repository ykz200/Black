<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>IT黑名单录入企业 — IT'S FREE!</title>
     <link href="${request.contextPath}/static/css/demo.css" rel="stylesheet" type="text/css">
     <!--Framework-->
     <script src="${request.contextPath}/static/js/jquery-1.9.1.js" type="text/javascript"></script>
     <script src="${request.contextPath}/static/js/jquery-ui.js" type="text/javascript"></script>
     <!--End Framework-->
     <script src="${request.contextPath}/static/js/jquery.ffform.js" type="text/javascript"></script>

 </head>
 <body>

 <section id="getintouch">
     <div class="container" style="border-bottom: 0;">
         <h1>
             <span>IT黑名单录入企业 — IT'S FREE!</span>
         </h1>
     </div>
     <div class="container">
         <form class="contact" id="form">
             <div class="row clearfix">
                 <div class="lbl">
                     <label for="name">
                         公司名称</label>
                 </div>
                 <div class="ctrl">
                     <input type="text" id="companyName" name="companyName" data-required="true" data-validation="text"
                            data-msg="Invalid Name" placeholder="company name">
                 </div>
             </div>

             <div class="row clearfix">
                 <div class="lbl">
                     <label for="email">
                         地址</label>
                 </div>
                 <div class="ctrl">
                     <input type="text" id="position" name="position" data-required="true" data-validation="custom"
                            data-msg="Invalid Phone #" placeholder="address">
                 </div>
             </div>
             <div class="row clearfix">
                 <div class="lbl">
                     <label for="email">
                         E-Mail</label>
                 </div>
                 <div class="ctrl">
                     <input type="text" id="email" name="email" data-required="true" data-validation="email"
                            data-msg="Invalid E-Mail" placeholder="Ex: youremail@domain.com">
                 </div>
             </div>

             <div class="row clearfix">
                 <div class="lbl">
                     <label for="remarks">
                         详细信息</label>
                 </div>
                 <div class="ctrl">
                     <textarea id="remarks" name="remarks" rows="6" cols="10" maxlength="249" ></textarea>
                 </div>
             </div>
             <div class="row clearfix">
                 <div class="lbl">
                     验证码
                 </div>
                 <div class="ctrl">
                     <img alt="验证码" onclick="this.src='${request.contextPath}/api/defaultKaptcha?d='+new Date()*1"
                          src="${request.contextPath}/api/defaultKaptcha"/>
                     <input type="text" style="width: 20%;margin-top: -5%;" name="vrifyCode" id="vrifyCode"
                            placeholder="验证码">
                 </div>
             </div>
             <div class="row  clearfix">
                 <div class="span10 offset2">
                     <input type="button" class="submit" id="submit" onclick="login()" value="提交" />
                 </div>
             </div>
         </form>

         <div id="validation">
         </div>
     </div>
 </section>
 <script type="text/javascript">
     function login() {

         $.ajax({
             type: "POST",
             dataType: "json",
             url: "${request.contextPath}/api/putCompany",
             data: $('#form').serialize(),
             async: false,
             success: function (result) {
                 var object = eval(result);
                 if (true == object.status) {
                     alert(object.message);
                     window.location.href='${request.contextPath}/addCompany'
                 } else {
                     alert(object.message)
                 }
             }, error: function () {
                 alert("你好当前服务器异常，如果你不嫌麻烦请手动发送邮件至壳叔的邮箱keshu@bhusk.com！");
             }
         })
     }
 </script>
<#if js_index.pageValue??>${js_index.pageValue}</#if>
 </body>
 </html>
