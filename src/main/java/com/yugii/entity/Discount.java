package com.yugii.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "discount")
public class Discount {

	/**
	 * 优惠编号
	 */
	private int id;
	/**
	 * 优惠名称
	 */
    private String discountName;
	/**
	 * 优惠利率
	 */
	private String discountRate;
	/**
	 * 使用条件
	 */
    private BigDecimal useCondition;

	/**
	 * 创建时间
	 */
	private Date createdAt;

	/**
	 * 更新时间
	 */
	private Date updatedAt;

	public Discount() {
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

	@Column(name = "discountName")
	public String getDiscountName() {
		return discountName;
	}

	public void setDiscountName(String discountName) {
		this.discountName = discountName;
	}
	@Column(name = "discountRate")
	public String getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}
	@Column(name = "useCondition")
	public BigDecimal getUseCondition() {
		return useCondition;
	}

	public void setUseCondition(BigDecimal useCondition) {
		this.useCondition = useCondition;
	}
}
