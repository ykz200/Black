package com.bhusk.black.mapper;

import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.MapCompanyInfo;
import com.bhusk.black.util.MyMapper;

import java.util.List;

/**
 * @author kzyuan
 */
public interface InfoMapper extends MyMapper<CompanyInfo> {
    List<CompanyInfo> getAll(CompanyInfo nfo);
    List<CompanyInfo> getMapIndexSearch(MapCompanyInfo mapCompanyInfo);
}