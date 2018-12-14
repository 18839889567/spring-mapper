package com.baizhi;

import com.baizhi.entity.Address;
import com.baizhi.entity.City;
import com.baizhi.mapper.CityMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringMapperApplicationTests {
    @Autowired
     CityMapper cityMapper;
    @Test
    public void selectAll() {
        List<City> list = cityMapper.selectAll();
        for (City city : list) {
            System.out.println(city);
        }
    }

    @Test
    public void selectByPrimaryKey(){
        City city = cityMapper.selectByPrimaryKey(1);
        System.out.println(city);
    }

    @Test
    public void select(){
        City city1 = new City();
        city1.setName("三门峡市");
        //Address address = new Address(1);
        //city1.setAddress(address);
        List<City> select = cityMapper.select(city1);
        for (City city : select) {
            System.out.println(city);
        }
    }
    @Test
    public void inser(){
        City city = new City();
        city.setName("wangwang");

        cityMapper.insert(city);

    }


    @Test
    public void maopao(){
        int[] a={9,8,7,5,2,3,5,11,22};
        for(int i=0;i<a.length;i++){
            for(int j=1;j<a.length-i;j++){
                //交换位置
                if(a[j]<a[j+1]){
                    int temp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = temp;
                }
            }
        }
        for (int i : a) {
            System.out.println(i);

        }


    }




}

