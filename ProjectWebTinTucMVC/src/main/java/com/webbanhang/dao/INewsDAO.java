/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao;

import com.webbanhang.model.NewsModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public interface INewsDAO extends GenericDAO{
    NewsModel findOne(Long id);
    List<NewsModel> findByCategoryId(Long categoryId);
    Long save(NewsModel newsModel);
    void update(NewsModel updateModel);
    void delete(long id);
    List<NewsModel> findAll(Pageble pageble);
    int getTotalItem();
}
