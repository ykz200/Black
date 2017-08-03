package com.bhusk.black.controller;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.MapCompanyInfo;
import com.bhusk.black.model.Notice;
import com.bhusk.black.model.Page;
import com.bhusk.black.service.NoticeService;
import com.bhusk.black.service.PageService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by kzyuan on 2017/7/10.
 */
@Controller
@RequestMapping("/")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    @Autowired
    private PageService pageService;

    /**
     * 公告list信息
     *
     * @param notice
     * @return
     */
    @RequestMapping(value = "/notice")
    public ModelAndView notice(Notice notice) {
        notice.setEnable("Y");
        notice.setRows(19);
        ModelAndView result = new ModelAndView("notice");
        result = CommonPage(result);
        List<Notice> noticeAll = noticeService.getNoticeAll(notice);
        result.addObject("pageInfo", new PageInfo<Notice>(noticeAll));
        return result;
    }

    /**
     * 搜索信息
     *
     * @param notice
     * @param id
     * @return
     */
    @RequestMapping(value = "/noticeDetail/{id}")
    public ModelAndView noticeDetail(Notice notice, @PathVariable String id) {
        notice.setEnable("Y");
        ModelAndView result = new ModelAndView("noticeDetail");
        result = CommonPage(result);
        notice = new Notice();
        notice.setId(Integer.parseInt(id));
        result.addObject("notice",noticeService.getNoticeDetail(notice));
        return result;
    }

    /**
     * 共同的配置信息
     *
     * @param result
     * @return
     */
    private ModelAndView CommonPage(ModelAndView result) {

        Page footer = new Page();
        /**
         * 网站标题
         */
        footer.setPageName("site_title_notice");
        result.addObject("site_title_notice", pageService.getPage(footer));
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


        footer.setPageName("js_notice");
        result.addObject("js_notice", pageService.getPage(footer));

        footer.setPageName("head_notice");
        result.addObject("head_notice", pageService.getPage(footer));

        footer.setPageName("footer_notice");
        result.addObject("footer_notice", pageService.getPage(footer));

        footer.setPageName("header_notice");
        result.addObject("header_notice", pageService.getPage(footer));

        return result;

    }
}