/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service;

import com.webbanhang.model.NewsModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public interface INewsService {

    List<NewsModel> findByCategoryId(Long categoryId);
    List<NewsModel> findAll(Pageble pageble);
    NewsModel save(NewsModel newsModel);
    NewsModel update(NewsModel updateNews);
    void delete(long[] ids);
    int getTotalItem();
    NewsModel finOne(Long id);
}
