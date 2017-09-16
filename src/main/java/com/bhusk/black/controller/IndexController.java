package com.bhusk.black.controller;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.Page;
import com.bhusk.black.service.InfoService;
import com.bhusk.black.service.PageService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by kzyuan on 2017/7/5.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private InfoService infoService;

    @Autowired
    private PageService pageService;

    /**
     * PC端主页信息
     *
     * @param companyInfo
     * @return
     */
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
        result = this.CommonPage(result);
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

    /**
     * 搜索信息
     *
     * @param companyInfo
     * @param page
     * @param row
     * @param common
     * @return
     */
    @RequestMapping(value = "/index/{page}/{row}/{common}")
    public ModelAndView indexSearch(CompanyInfo companyInfo, @PathVariable Integer page, @PathVariable Integer row,
                                    @PathVariable String common) {

        if (StringUtils.isEmpty(common) || "1".equals(common)) {
            companyInfo.setCommon(null);
        } else {
            companyInfo.setCommon(common);
        }

        if (StringUtils.isEmpty(page)) {
            companyInfo.setPage(null);
        } else {
            companyInfo.setPage(page);
        }

        if (StringUtils.isEmpty(row)) {
            companyInfo.setRows(null);
        } else {
            companyInfo.setRows(row);
        }

        ModelAndView result = new ModelAndView("index");
        /**
         * 调用共同的配置信息
         */
        result = this.CommonPage(result);
        List<CompanyInfo> companyInfoList = infoService.getAll(companyInfo);
        result.addObject("pageInfo", (companyInfoList.size() != 0) ? new PageInfo<CompanyInfo>(companyInfoList): new PageInfo<CompanyInfo>(null));
        result.addObject("userInfo", companyInfo);
        result.addObject("page", companyInfo.getPage());
        result.addObject("rows", companyInfo.getRows());
        return result;
    }

    /**
     * PC端 共同的配置信息
     * @param result
     * @return
     */
    private ModelAndView CommonPage(ModelAndView result){
        /**
         * 网页尾部
         */
        Page footer = new Page();
        footer.setPageName("footer_pc");
        result.addObject("footer_pc", pageService.getPage(footer));
        /**
         * 网页<head>之间的内容</head>
         */
        footer.setPageName("head_index");
        result.addObject("head_index", pageService.getPage(footer));
        /**
         * 网页js
         */
        footer.setPageName("js_index");
        result.addObject("js_index", pageService.getPage(footer));
        /**
         * PC端主页头部提示内容
         */
        footer.setPageName("header_index");
        result.addObject("header_index", pageService.getPage(footer));
        /**
         * 网站标题
         */
        footer.setPageName("site_title");
        result.addObject("site_title", pageService.getPage(footer));
        /**
         * 关键字
         */
        footer.setPageName("keywords");
        result.addObject("keywords", pageService.getPage(footer));
        /**
         * 网站描述
         */
        footer.setPageName("description");
        result.addObject("description", pageService.getPage(footer));

        footer.setPageName("head_advertising_index_pc");
        result.addObject("head_advertising_index_pc", pageService.getPage(footer));

        footer.setPageName("footer_advertising_index_pc");
        result.addObject("footer_advertising_index_pc", pageService.getPage(footer));
        return result;

    }


}