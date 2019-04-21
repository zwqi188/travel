package com.yugii.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by apple on 19/1/21.
 */
@Entity
@Table(name = "comment")
public class Comment {

    /**
     * 评论id
     */
    private Integer id;
    /**
     * 用户id
     */
    private String userId;
    /**
     * 景点编号
     */
    private String spotId;
    /**
     * 父景点编号
     */
    private Integer comParentId;
    /**
     * 评论
     */
    private String comDesc;
    /**
     * 点赞数
     */
    private Integer comLike;
    private Date createdAt;
    private Date updatedAt;

    private Comment() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "userId")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "comDesc")
    public String getComDesc() {
        return comDesc;
    }

    public void setComDesc(String comDesc) {
        this.comDesc = comDesc;
    }

    @Column(name = "comLike")
    public Integer getComLike() {
        return comLike;
    }

    public void setComLike(Integer comLike) {
        this.comLike = comLike;
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

    @Column(name = "spotId")
    public String getSpotId() {
        return spotId;
    }

    public void setSpotId(String spotId) {
        this.spotId = spotId;
    }

    @Column(name = "comParentId")
    public Integer getComParentId() {
        return comParentId;
    }

    public void setComParentId(Integer comParentId) {
        this.comParentId = comParentId;
    }
}
