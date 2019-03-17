package com.yugii.entity;

import javax.persistence.*;

/**
 * Created by mac on 2019/3/17.
 */
@Entity
@Table(name = "country")
public class Country {

    /**
     * 国家编号
     */
    private int id;
    /**
     * 国家名称
     */
    private String countryName;
    /**
     * 是否境外
     */
    private int outBound;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "countryName")
    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    @Column(name = "outBound")
    public int getOutBound() {
        return outBound;
    }

    public void setOutBound(int outBound) {
        this.outBound = outBound;
    }
}
