package com.bhusk.black.util;

import com.bhusk.black.controller.IndexController;
import com.bhusk.black.model.Page;
import com.bhusk.black.service.PageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by kzyuan on 2017/12/17 21:38
 */

public class CommonPageUtils {

    private static Logger logger = LoggerFactory.getLogger(CommonPageUtils.class);
    @Autowired
    private PageService pageService;

    /**
     * PC端 共同的配置信息
     *
     * @param result
     * @return
     */
    public Model indexCommonPage(Model result) {
        /**
         * 网页尾部
         */
        Page footer = new Page();
        footer.setPageName("footer_pc");
        result.addAttribute("footer_pc", pageService.getPage(footer));
        /**
         * 网页<head>之间的内容</head>
         */
        footer.setPageName("head_index");
        result.addAttribute("head_index", pageService.getPage(footer));
        /**
         * 网页js
         */
        footer.setPageName("js_index");
        result.addAttribute("js_index", pageService.getPage(footer));
        /**
         * PC端主页头部提示内容
         */
        footer.setPageName("header_index");
        result.addAttribute("header_index", pageService.getPage(footer));
        /**
         * 网站标题
         */
        footer.setPageName("site_title");
        result.addAttribute("site_title", pageService.getPage(footer));
        /**
         * 关键字
         */
        footer.setPageName("keywords");
        result.addAttribute("keywords", pageService.getPage(footer));
        /**
         * 网站描述
         */
        footer.setPageName("description");
        result.addAttribute("description", pageService.getPage(footer));

        footer.setPageName("head_advertising_index_pc");
        result.addAttribute("head_advertising_index_pc", pageService.getPage(footer));

        footer.setPageName("footer_advertising_index_pc");
        result.addAttribute("footer_advertising_index_pc", pageService.getPage(footer));
        return result;
    }


    /**
     * 移动端黑企业查询页面 共同的配置信息
     *
     * @param result
     * @return
     */
    public Model mapCommonPage(Model result) {
        /**
         * 网页尾部
         */
        Page footer = new Page();
        footer.setPageName("js_map_index");
        result.addAttribute("js_map_index", pageService.getPage(footer));
        /**
         * 网页<head>之间的内容</head>
         */
        footer.setPageName("head_map_index");
        result.addAttribute("head_map_index", pageService.getPage(footer));
        /**
         * 网页js
         */
        footer.setPageName("footer_map");
        result.addAttribute("footer_map", pageService.getPage(footer));

        /**
         * PC端主页头部提示内容
         */
        footer.setPageName("header_map_index");
        result.addAttribute("header_map_index", pageService.getPage(footer));
        /**
         * 网站标题
         */
        footer.setPageName("site_title");
        result.addAttribute("site_title", pageService.getPage(footer));
        /**
         * 关键字
         */
        footer.setPageName("keywords");
        result.addAttribute("keywords", pageService.getPage(footer));
        /**
         * 网站描述
         */
        footer.setPageName("description");
        result.addAttribute("description", pageService.getPage(footer));

        footer.setPageName("head_advertising_index_map");
        result.addAttribute("head_advertising_index_map", pageService.getPage(footer));

        footer.setPageName("footer_advertising_index_map");
        result.addAttribute("footer_advertising_index_map", pageService.getPage(footer));

        return result;
    }


    /**
     * pc端页面通用js
     *
     * @param model
     * @return
     */
    public Model indexCommonJs(Model model) {
        Page footer = new Page();
        footer.setPageName("js_index");
        model.addAttribute("js_index", pageService.getPage(footer));
        return model;
    }


    /**
     * map端通用js
     *
     * @param model
     * @return
     */
    public Model mapCommonJs(Model model) {
        Page footer = new Page();
        footer.setPageName("js_map_index");
        model.addAttribute("js_map_index", pageService.getPage(footer));
        return model;
    }
    
}