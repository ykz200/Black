package com.bhusk.black.service;

import com.bhusk.black.mapper.PageMapper;
import com.bhusk.black.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by kzyuan on 2017/7/12.
 */
@Service
public class PageService {

    @Autowired
    private PageMapper pageMapper;

    /**
     * 获取配置参数内容
     * @param page
     * @return
     */
    public Page getPage(Page page) {

        return pageMapper.getPage(page);
    }
}
