package com.bhusk.black.mapper;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.MapCompanyInfo;
import com.bhusk.black.util.MyMapper;

import java.util.List;

/**
 * @author kzyuan
 */
public interface InfoMapper extends MyMapper<CompanyInfo> {
    List<CompanyInfo> getAll(CompanyInfo info);
    List<CompanyInfo> getMapIndexSearch(MapCompanyInfo mapCompanyInfo);

    /**
     * API 接口 插入公司信息
     * @param companyInfo
     */
    int apiSubmitInfo(CompanyInfo companyInfo);
}