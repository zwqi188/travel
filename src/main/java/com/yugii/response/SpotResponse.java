package com.yugii.response;

import java.util.Date;

/**
 * Created by mac on 2019/4/21.
 */
public class SpotResponse {
    /**
     * 景点编号
     */
    private Integer id;
    /**
     * 景点名称
     */
    private String spotName;
    /**
     * 城市id
     */
    private String cityId;
    /**
     * 门票价格
     */
    private String price;
    /**
     * 景点图片列表
     */
    private String spotImg;
    /**
     * 点赞数
     */
    private Integer love;
    /**
     * 景点描述
     */
    private String spotDesc;

    /**
     * 创建时间
     */
    private Date createdAt;

    /**
     * 更新时间
     */
    private Date updatedAt;

    /**
     * 关键字
     */
    private String label;

    /**
     * 出发地
     */
    private String startPoint;

    /**
     * 系统推荐指数
     */
    private Integer sysRecommend;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getSpotName() {
        return spotName;
    }

    public void setSpotName(String spotName) {
        this.spotName = spotName;
    }

    public String getSpotImg() {
        return spotImg;
    }

    public void setSpotImg(String spotImg) {
        this.spotImg = spotImg;
    }

    public Integer getLove() {
        return love;
    }

    public void setLove(Integer love) {
        this.love = love;
    }

    public String getSpotDesc() {
        return spotDesc;
    }

    public void setSpotDesc(String spotDesc) {
        this.spotDesc = spotDesc;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(String startPoint) {
        this.startPoint = startPoint;
    }

    public Integer getSysRecommend() {
        return sysRecommend;
    }

    public void setSysRecommend(Integer sysRecommend) {
        this.sysRecommend = sysRecommend;
    }
}
