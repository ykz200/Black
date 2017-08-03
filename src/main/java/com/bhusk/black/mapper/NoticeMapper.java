package com.bhusk.black.mapper;

import com.bhusk.black.model.Notice;

import java.util.List;

/**
 * Created by kzyuan on 2017/7/13.
 */
public interface NoticeMapper {
    List<Notice> getNoticeAll(Notice notice);

    Notice getNoticeDetail(Notice notice);
}
