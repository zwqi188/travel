package com.yugii.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "ticket")
public class Ticket {
	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 景点id
	 */
	private Integer spotId;
	/**
	 * 价格
	 */
	private BigDecimal price;
	private Date createdAt;
	/**
	 * 是否团购票
	 */
	private Integer isGroup;
	/**
	 * 团购数量
	 */
	private Integer groupNum;

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
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdAt")
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Column(name = "isGroup")
	public Integer getIsGroup() {
		return isGroup;
	}

	public void setIsGroup(Integer isGroup) {
		this.isGroup = isGroup;
	}

	@Column(name = "groupNum")
	public Integer getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(Integer groupNum) {
		this.groupNum = groupNum;
	}

	@Column(name = "spotId")
	public Integer getSpotId() {
		return spotId;
	}

	public void setSpotId(Integer spotId) {
		this.spotId = spotId;
	}
}
