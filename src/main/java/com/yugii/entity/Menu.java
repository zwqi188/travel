package com.yugii.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * 后台管理站点菜单配置表
 */
@Entity
@Table(name = "menu")
public class Menu {

	/**
	 * 景点编号
	 */
	private int id;
	/**
	 * 菜单编号
	 */
    private String menuId;
	/**
	 * 菜单名称
	 */
	private String menuName;
	/**
	 * 路径地址
	 */
	private String menuUri;
	/**
	 * 图标
	 */
	private String menuThumbnail;
	/**
	 * 菜单顺序
	 */
	private Integer menuOrder;
	/**
	 * 叶子节点
	 */
	private Integer isLeaf;
	/**
	 * 父节点
	 */
	private Integer parentId;
	/**
	 * 状态
	 */
	private Integer state;

	private Date createdAt;

	private Date updatedAt;

	public Menu() {
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

	@Column(name = "menuId")
	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	@Column(name = "menuName")
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "menuUri")
	public String getMenuUri() {
		return menuUri;
	}

	public void setMenuUri(String menuUri) {
		this.menuUri = menuUri;
	}

	@Column(name = "menuThumbnail")
	public String getMenuThumbnail() {
		return menuThumbnail;
	}

	public void setMenuThumbnail(String menuThumbnail) {
		this.menuThumbnail = menuThumbnail;
	}

	@Column(name = "menuOrder")
	public Integer getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(Integer menuOrder) {
		this.menuOrder = menuOrder;
	}

	@Column(name = "isLeaf")
	public Integer getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}

	@Column(name = "parentId")
	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	@Column(name = "state")
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
}
