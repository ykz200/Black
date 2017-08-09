package com.bhusk.black.controller;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.service.InfoService;
import com.bhusk.black.service.PageService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/FreeVpnSS")
public class FreevpnController {

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private InfoService infoService;

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, CompanyInfo companyInfo) {

        ModelAndView result = new ModelAndView("index");

        if (StringUtils.isEmpty(companyInfo.getCompanyName())) {
            companyInfo.setCompanyName(null);
        }

        if (StringUtils.isEmpty(companyInfo.getPosition())) {
            companyInfo.setPosition(null);
        }
        /**
         * 调用共同的配置信息
         */
//        result = this.CommonPage(result);
        /**
         * 显示公司查询数据
         */
        List<CompanyInfo> companyInfoList = infoService.getAll(companyInfo);
        result.addObject("pageInfo", new PageInfo<CompanyInfo>(companyInfoList));
        result.addObject("userInfo", companyInfo);
        result.addObject("page", companyInfo.getPage());
        result.addObject("rows", companyInfo.getRows());
        return result;
    }


}
