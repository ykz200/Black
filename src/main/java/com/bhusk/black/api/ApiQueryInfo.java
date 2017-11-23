package com.bhusk.black.api;

import com.bhusk.black.controller.IndexController;
import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.StatusBean;
import com.bhusk.black.service.InfoService;
import com.bhusk.black.service.PageService;
import net.minidev.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by kzyuan on 2017/11/20 21:41
 * @author kzyuan
 */
@Controller
@RequestMapping("/api")
public class ApiQueryInfo {

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private InfoService infoService;

    @Autowired
    private PageService pageService;

    /**
     * 公共的api
     * 获取企业信息 info表数据
     *
     * @param companyInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryInfo")
    public List<CompanyInfo>  queryInfo(HttpServletRequest request, HttpServletResponse response, CompanyInfo companyInfo) {

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
     * @param request
     * @param response
     * @param companyInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/apiSubmitInfo", method = RequestMethod.POST)
    public StatusBean apiSubmitInfo(HttpServletRequest request, HttpServletResponse response, CompanyInfo companyInfo,String md5Date,String apiPwd) {
        StatusBean<String> statusBean = new StatusBean<String>();

        System.out.println(companyInfo);
        statusBean = infoService.apiSubmitInfo(companyInfo);
        return statusBean;
    }

}
