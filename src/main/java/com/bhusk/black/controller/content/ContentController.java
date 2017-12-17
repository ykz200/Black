package com.bhusk.black.controller.content;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.Page;
import com.bhusk.black.model.StatusBean;
import com.bhusk.black.service.InfoService;
import com.bhusk.black.service.PageService;
import com.bhusk.black.util.CommonPageUtils;
import com.bhusk.black.util.MailUtils;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by kzyuan on 2017/7/5.
 */
@Controller
@RequestMapping("/content")
public class ContentController extends CommonPageUtils {

    private static Logger logger = LoggerFactory.getLogger(ContentController.class);

    @Autowired
    private InfoService infoService;

    @Autowired
    private PageService pageService;

    /**
     * 搜索信息
     *
     * @param companyInfo
     * @param page
     * @param row
     * @param common
     * @return
     */
    @RequestMapping(value = "/content/{page}/{row}/{common}")
    public String indexSearch(CompanyInfo companyInfo, @PathVariable Integer page, @PathVariable Integer row,
                              @PathVariable String common, Model model) {

        int showStatus = 0;
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
        model = super.indexCommonJs(model);
        /**
         * 调用共同的配置信息
         */
        List<CompanyInfo> companyInfoList = new ArrayList<CompanyInfo>();
        if (!StringUtils.isEmpty(companyInfo.getCommon())) {
            companyInfoList = infoService.getAll(companyInfo);
            showStatus = (companyInfoList.size() != 0) ? 1 : 0;
        } else {
            showStatus = -1;
        }

        model.addAttribute("pageInfo", ((companyInfoList.size() != 0) ? new PageInfo<CompanyInfo>(companyInfoList) : new PageInfo<CompanyInfo>(null)));
        model.addAttribute("userInfo", companyInfo);
        model.addAttribute("page", companyInfo.getPage());
        model.addAttribute("rows", companyInfo.getRows());
        model.addAttribute("showStatus", showStatus);
        return "content/content";
    }

    @RequestMapping(value = "content")
    public String content(CompanyInfo companyInfo, Model model) {
        int showStatus = 0;
        model = super.indexCommonJs(model);
        List<CompanyInfo> companyInfoList = new ArrayList<CompanyInfo>();
        if (!StringUtils.isEmpty(companyInfo.getCommon())) {
            companyInfoList = infoService.getAll(companyInfo);
            showStatus = (companyInfoList.size() != 0) ? 1 : 0;
        } else {
            showStatus = -1;
        }
        model.addAttribute("userInfo", companyInfo);
        model.addAttribute("pageInfo", ((companyInfoList.size() != 0) ? new PageInfo<CompanyInfo>(companyInfoList) : new PageInfo<CompanyInfo>(null)));
        model.addAttribute("page", companyInfo.getPage());
        model.addAttribute("rows", companyInfo.getRows());
        model.addAttribute("showStatus", showStatus);
        return "content/content";
    }

}