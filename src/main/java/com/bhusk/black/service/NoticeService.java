package com.bhusk.black.service;

import com.bhusk.black.mapper.NoticeMapper;
import com.bhusk.black.mapper.PageMapper;
import com.bhusk.black.model.Notice;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kzyuan on 2017/7/13.
 */
@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    /**
     * 所有公告
     * @param notice
     * @return
     */
    public List<Notice> getNoticeAll(Notice notice) {
        if (notice.getPage() != null && notice.getRows() != null) {
            PageHelper.startPage(notice.getPage(), notice.getRows());
        }
        return noticeMapper.getNoticeAll(notice);
    }

    /**
     * 详细公告
     * @param notice
     * @return
     */
    public Notice getNoticeDetail(Notice notice) {
        if (notice.getPage() != null && notice.getRows() != null) {
            PageHelper.startPage(notice.getPage(), notice.getRows());
        }
        return noticeMapper.getNoticeDetail(notice);
    }
}
