package com.bhusk.black.model;

/**
 * 移动端自适应
 * Created by kzyuan on 2017/7/10.
 */
public class MapCompanyInfo {
    private Integer id;
    /**
     * 公司名称
     */
    private String companyName;
    /**
     * 公司地址
     */
    private String position;
    /**
     * 备注
     */
    private String remarks;
    /**
     * 是否可用
     * Y OR N
     * 是或否
     */
    private String enable;

    /**
     * 搜索字段
     */
    private String common;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getCommon() {
        return common;
    }

    public void setCommon(String common) {
        this.common = common;
    }
}
