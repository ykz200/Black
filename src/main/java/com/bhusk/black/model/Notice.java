package com.bhusk.black.model;

/**
 * 公告 实体类
 * Created by kzyuan on 2017/7/13.
 */
public class Notice extends BaseEntity {


    private Integer id;
    /**
     * 创建标题
     */
    private String title;
    /**
     * 是否可用
     * Y OR N
     * 是或否
     */
    private String enable;
    /**
     * 创建时间
     */
    private String createDate;
    /**
     * 创建内容
     */
    private String content;

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
