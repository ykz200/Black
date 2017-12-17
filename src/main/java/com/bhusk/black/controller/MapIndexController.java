package com.bhusk.black.controller;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.MapCompanyInfo;
import com.bhusk.black.model.Page;
import com.bhusk.black.service.InfoService;
import com.bhusk.black.service.PageService;
import com.bhusk.black.util.CommonPageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * 移动端页面查询类
 * Created by kzyuan on 2017/7/10.
 */
@Controller
@RequestMapping("/map")
public class MapIndexController extends CommonPageUtils {

    @Autowired
    private InfoService infoService;
    @Autowired
    private PageService pageService;

    /**
     * 移动端 主页信息
     * @param companyInfo
     * @return
     */
    @RequestMapping(value = "/index")
    public String mapIndex(CompanyInfo companyInfo,Model model) {

        if (StringUtils.isEmpty(companyInfo.getCompanyName())) {
            companyInfo.setCompanyName(null);
        }

        if (StringUtils.isEmpty(companyInfo.getPosition())) {
            companyInfo.setPosition(null);
        }

//        ModelAndView result = new ModelAndView("map/index");

        /**
         * 调用共同的配置信息
         */
//        result = this.CommonPage(result);
        model = super.mapCommonPage(model);
        List<MapCompanyInfo> companyInfoList = new ArrayList<MapCompanyInfo>();
        model.addAttribute("pageInfo", companyInfoList);
        model.addAttribute("userInfo", companyInfo);

        return "map/index";
    }

    /**
     * 移动端 模糊查询
     *
     * @param mapCompanyInfo
     * @param common
     * @return
     */
    @RequestMapping(value = "/index/{common}")
    public String mapIndexSearch(MapCompanyInfo mapCompanyInfo, @PathVariable String common,Model model) {

        if (StringUtils.isEmpty(common)) {
            mapCompanyInfo.setCommon(null);
        } else {
            mapCompanyInfo.setCommon(common);
        }

//        ModelAndView result = new ModelAndView("map/index");
        /**
         * 调用共同的配置信息
         */
        model = super.mapCommonPage(model);
        List<CompanyInfo> companyInfoList = infoService.mapIndexSearch(mapCompanyInfo);
        model.addAttribute("pageInfo", (companyInfoList.size() != 0) ? companyInfoList: null);
        model.addAttribute("common", common);
        return "map/index";
    }

    /**
     * 移动端黑企业查询页面 共同的配置信息
     *
     * @param result
     * @return
     */
    private ModelAndView CommonPage(ModelAndView result) {
        /**
         * 网页尾部
         */
        Page footer = new Page();
        footer.setPageName("js_map_index");
        result.addObject("js_map_index", pageService.getPage(footer));
        /**
         * 网页<head>之间的内容</head>
         */
        footer.setPageName("head_map_index");
        result.addObject("head_map_index", pageService.getPage(footer));
        /**
         * 网页js
         */
        footer.setPageName("footer_map");
        result.addObject("footer_map", pageService.getPage(footer));

        /**
         * PC端主页头部提示内容
         */
        footer.setPageName("header_map_index");
        result.addObject("header_map_index", pageService.getPage(footer));
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

        footer.setPageName("head_advertising_index_map");
        result.addObject("head_advertising_index_map", pageService.getPage(footer));

        footer.setPageName("footer_advertising_index_map");
        result.addObject("footer_advertising_index_map", pageService.getPage(footer));


        return result;
    }

}

