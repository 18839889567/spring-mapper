package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.code.ORDER;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="city")
public class City implements Serializable {
    @Id
    @KeySql(sql = "select city_seq.nextval from dual", order = ORDER.BEFORE)
    private Long id;
    private Long code;
    private String name;
    @Column(name="provincecode")
    private Long num;  //字段名与数据库与列不一致
    @Transient
    private String bucunzai;//不存在数据库中的属性
   // private Address address;  //不会把对象当成字段去查询

}
