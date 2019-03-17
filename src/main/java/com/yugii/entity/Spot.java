package com.yugii.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "spot")
public class Spot {

	/**
	 * 景点编号
	 */
	private int id;
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
    private BigDecimal price;
	/**
	 * 景点图片列表
	 */
	private String spotImg;
	/**
	 * 点赞数
	 */
	private Integer like;
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

	public Spot() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "price")
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
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

	@Column(name = "like")
	public Integer getLike() {
		return like;
	}

	public void setLike(Integer like) {
		this.like = like;
	}

	@Column(name = "spotDesc")
	public String getSpotDesc() {
		return spotDesc;
	}

	public void setSpotDesc(String spotDesc) {
		this.spotDesc = spotDesc;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdAt")
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updatedAt")
	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	/**
	 * 图片详情
	 */
	private class ImgDetail {
		/**
		 * 排序
		 */
		private int index;
		/**
		 * 图片地址
		 */
		private String url;


		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}
	}

}
