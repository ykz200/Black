package com.bhusk.black.api;

import com.bhusk.black.controller.IndexController;
import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.Keys;
import com.bhusk.black.model.StatusBean;
import com.bhusk.black.service.InfoService;
import com.bhusk.black.service.Keyservice;
import com.bhusk.black.service.PageService;
import com.bhusk.black.util.MD5Util;
import com.bhusk.black.util.MailUtils;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by kzyuan on 2017/11/20 21:41
 *
 * @author kzyuan
 */
@Controller
@RequestMapping("/api")
public class ApiCompany extends MailUtils {

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private InfoService infoService;

    @Autowired
    private PageService pageService;

    @Autowired
    private Keyservice keyservice;

    private static final String APIPUTPWD = "ApiPutPwd";

    /**
     * 公共的api
     * 获取企业信息 info表数据
     *
     * @param companyInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryInfo")
    public List<CompanyInfo> queryInfo(HttpServletRequest request, HttpServletResponse response, CompanyInfo companyInfo) {

        List<CompanyInfo> companyInfoList = new ArrayList<CompanyInfo>();
        if (StringUtils.isEmpty(companyInfo.getCommon()) &&
                StringUtils.isEmpty(companyInfo.getPosition())) {
            companyInfo.setRemarks("请输入公司名称或坐标等参数");
            companyInfoList.add(companyInfo);
            return companyInfoList;
        }

        /**
         * 显示公司查询数据
         */
        companyInfoList = infoService.apiAll(companyInfo);

        return companyInfoList;
    }


    /**
     * 公共的api 用于保存数据
     *
     * @param request
     * @param response
     * @param companyInfo 传递的公司信息
     * @param md5Date     日期时间 12进制 32大写加密
     * @param apiPwd      apiPwd 来源与数据库校对
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/putInfo", method = RequestMethod.POST)
    public StatusBean apiPutInfo(HttpServletRequest request, HttpServletResponse response, CompanyInfo companyInfo, String md5Date, String apiPwd) {

        StatusBean<String> statusBean = new StatusBean<String>();

        /**
         * Start 日期效验
         */
        if (StringUtils.isBlank(md5Date)) {
            statusBean.setStatus(false);
            statusBean.setMessage("verification failed!");
            return statusBean;
        } else if (!MD5Util.MD5(new SimpleDateFormat("yyyy-MM-dd HH:mmmvn").format(new Date())).equals(md5Date)) {
            statusBean.setStatus(false);
            statusBean.setMessage("Time validation failed!");
            return statusBean;
        }

        /**
         * Start apiPwd  秘钥判断 结束
         * 通过数据库存储的秘钥 进行实时判断api接口传参的秘钥
         */
        if (StringUtils.isBlank(apiPwd)) {
            statusBean.setStatus(false);
            statusBean.setMessage("apiPwd can not be empty!");
            return statusBean;
        }

        Keys keys = new Keys();
        keys.setKeyValue(apiPwd);

        if (null == keyservice.getKeys(keys)) {
            statusBean.setStatus(false);
            statusBean.setMessage("apiPwd does not exist!");
            return statusBean;
        }

        /**
         * End apiPwd 秘钥判断 结束
         */

        /**
         * api接口保存 post的数据信息
         */
        statusBean = infoService.apiSubmitInfo(companyInfo);

        return statusBean;
    }

    /**
     * 公共的api 用于保存数据
     *
     * @param request
     * @param response
     * @param companyInfo 传递的公司信息
     * @return
     */

    @RequestMapping(value = "/putCompany", method = RequestMethod.POST)
    @ResponseBody
    public StatusBean apiPutInfo(HttpServletRequest request, HttpServletResponse response, CompanyInfo companyInfo) {

        StatusBean<String> statusBean = new StatusBean<String>();
        if (StringUtils.isBlank(companyInfo.getCompanyName())) {
            statusBean.setMessage("朋友,公司信息你好歹需要公司名吧!");
            statusBean.setStatus(false);
            return statusBean;
        }
        if (StringUtils.isBlank(companyInfo.getPosition())) {
            statusBean.setMessage("朋友,位置不能不填，或者你写个省或市也行!");
            statusBean.setStatus(false);
            return statusBean;
        }
        if (StringUtils.isBlank(companyInfo.getRemarks())) {
            statusBean.setMessage("朋友,麻烦写一下具体信息吧，我知道这可能会浪费你一点脑细胞，但这都是值得的！");
            statusBean.setStatus(false);
            return statusBean;
        }
        String captchaId = (String) request.getSession().getAttribute("vrifyCode");
        String parameter = request.getParameter("vrifyCode");
        logger.info("Session  vrifyCode " + captchaId.toUpperCase() + " form vrifyCode " + parameter.toUpperCase());

        if (!captchaId.toUpperCase().equals(parameter.toUpperCase())) {
            statusBean.setMessage("错误的验证码，验证码区分大小写！");
            statusBean.setStatus(false);
            return statusBean;
        }

        /**
         * api接口保存 post的数据信息
         */
        statusBean = infoService.apiSubmitInfo(companyInfo);

        /**
         * 发送邮件提现信息
         */
        if (statusBean.getStatus()) {
            super.sendSimpleMail("keshu@bhusk.com", "IT黑名单：" + companyInfo.getCompanyName(), JSONArray.fromObject(companyInfo).toString());
        }

        /**
         * 发送邮件提现信息
         */
        if (StringUtils.isNotBlank(companyInfo.getEmail()) && statusBean.getStatus()) {
            super.sendSimpleMail(companyInfo.getEmail(), "IT黑名单：[" + companyInfo.getCompanyName() + "]申请收录提醒", "我们已收到你的申请，我们会尽快进行审核。 这是黑壳博客壳叔亲口说的. http://black.bhusk.com");
            System.out.println(companyInfo.getEmail() + "IT黑名单：[" + companyInfo.getCompanyName() + "]申请收录提醒" + "我们已收到你的申请，我们会尽快进行审核。 这是黑壳博客壳叔亲口说的. http://black.bhusk.com");
        }

        return statusBean;
    }
}
