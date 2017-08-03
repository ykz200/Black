package com.bhusk.black.model;

/**
 * 配置属性
 * Created by kzyuan on 2017/7/12.
 */
public class Page  {

    private Integer id;

    /**
     * 配置参数名
     */
    private String pageName;

    /**
     * 配置参数值
     */
    private String pageValue;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getPageValue() {
        return pageValue;
    }

    public void setPageValue(String pageValue) {
        this.pageValue = pageValue;
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
}

