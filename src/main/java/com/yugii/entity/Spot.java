package com.yugii.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "spot")
public class Spot implements Serializable{

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

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "price")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Column(name = "cityId")
	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	@Column(name = "spotName")
	public String getSpotName() {
		return spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	@Column(name = "spotImg")
	public String getSpotImg() {
		return spotImg;
	}

	public void setSpotImg(String spotImg) {
		this.spotImg = spotImg;
	}

	@Column(name = "love")
	public Integer getLove() {
		return love;
	}

	public void setLove(Integer love) {
		this.love = love;
	}

	@Column(name = "spotDesc")
	public String getSpotDesc() {
		return spotDesc;
	}

	public void setSpotDesc(String spotDesc) {
		this.spotDesc = spotDesc;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "createdAt")
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "updatedAt")
	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	@Column(name = "label")
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Column(name = "startPoint")
	public String getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(String startPoint) {
		this.startPoint = startPoint;
	}

	@Column(name = "sysRecommend")
	public Integer getSysRecommend() {
		return sysRecommend;
	}

	public void setSysRecommend(Integer sysRecommend) {
		this.sysRecommend = sysRecommend;
	}
}
