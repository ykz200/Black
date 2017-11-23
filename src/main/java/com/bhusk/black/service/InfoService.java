package com.bhusk.black.service;

import com.bhusk.black.mapper.InfoMapper;
import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.CompanyInfo;
import com.bhusk.black.model.MapCompanyInfo;
import com.bhusk.black.model.StatusBean;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by kzyuan on 2017/7/5.
 */
@Service
public class InfoService {

    @Autowired
    private InfoMapper infoMapper;

    /**
     * 查询所有数据
     *
     * @param info
     * @return
     */
    public List<CompanyInfo> getAll(CompanyInfo info) {
        if (info.getPage() != null && info.getRows() != null) {
            PageHelper.startPage(info.getPage(), info.getRows());
        }
        return infoMapper.getAll(info);
    }

    /**
     * 查询所有数据
     *
     * @param info
     * @return
     */
    public List<CompanyInfo> apiAll(CompanyInfo info) {

        return infoMapper.getAll(info);
    }


    /**
     * 移动端搜索
     *
     * @param mapCompanyInfo
     * @return
     */
    public List<CompanyInfo> mapIndexSearch(MapCompanyInfo mapCompanyInfo) {
        return infoMapper.getMapIndexSearch(mapCompanyInfo);
    }

    /**
     * 保存api提供的数据 并且返回状态
     *
     * @param companyInfo
     * @return
     */
    public StatusBean<String> apiSubmitInfo(CompanyInfo companyInfo) {
        StatusBean<String> statusBean = new StatusBean<String>();
        int count = infoMapper.apiSubmitInfo(companyInfo);

        /**
         * 返回count 如果大于1 则表示插入成功
         */
        if (0 < count) {
            statusBean.setStatus(true);
            statusBean.setMessage("Perfect submission ！");
        } else {
            statusBean.setStatus(false);
            statusBean.setMessage("Failure is the mother of success ！");
        }

        return statusBean;
    }
}
