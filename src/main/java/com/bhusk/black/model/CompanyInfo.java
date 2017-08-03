package com.bhusk.black.model;

/**
 * company info
 * Created by kzyuan on 2017/7/5.
 */
public class CompanyInfo extends BaseEntity  {

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

    @Override
    public Integer getId() {
        return id;
    }

    @Override
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
}
