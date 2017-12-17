package com.bhusk.black.model;

import java.util.Date;

/**
 * 密钥库实体类
 * Created by kzyuan on 2017/11/25 22:49
 * @author kzyuan
 */

public class Keys {

    private long id;

    /**
     * key value 秘钥值
     */
    private String keyValue;

    /**
     * key_type key的类型
     *  1、对接黑名单接口
     */
    private String keyType;

    /**
     * 备注
     */
    private String keyRemark;

    /**
     * key创建时间
     */
    private Date createDate;

    /**
     * 停止时间 有效期
     */
    private Date stopDate;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getKeyValue() {
        return keyValue;
    }

    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    public String getKeyType() {
        return keyType;
    }

    public void setKeyType(String keyType) {
        this.keyType = keyType;
    }

    public String getKeyRemark() {
        return keyRemark;
    }

    public void setKeyRemark(String keyRemark) {
        this.keyRemark = keyRemark;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getStopDate() {
        return stopDate;
    }

    public void setStopDate(Date stopDate) {
        this.stopDate = stopDate;
    }
}
