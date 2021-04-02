/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service.impl;

import com.webbanhang.dao.ICategoryDAO;
import com.webbanhang.dao.INewsDAO;
import com.webbanhang.model.CategoryModel;
import com.webbanhang.model.NewsModel;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.INewsService;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author asus
 */
public class NewsService implements INewsService {

    @Inject
    private INewsDAO newsDao;
    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<NewsModel> findByCategoryId(Long categoryId) {
        return newsDao.findByCategoryId(categoryId);
    }

    @Override
    public NewsModel save(NewsModel newsModel) {
        newsModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        CategoryModel category = categoryDAO.findOneByCode(newsModel.getCategoryCode());
        newsModel.setCategoryId(category.getId());
        Long newId = newsDao.save(newsModel);
        return newsDao.findOne(newId);
    }

    @Override
    public NewsModel update(NewsModel updateNews) {
        NewsModel oldNews = newsDao.findOne(updateNews.getId());
        updateNews.setCreatedDate(oldNews.getCreatedDate());
        updateNews.setCreatedBy(oldNews.getCreatedBy());
        updateNews.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        CategoryModel category = categoryDAO.findOneByCode(updateNews.getCategoryCode());
        updateNews.setCategoryId(category.getId());
        newsDao.update(updateNews);
        return newsDao.findOne(updateNews.getId());
    }

    @Override
    public void delete(long[] ids) {
        for (int i = 0; i < ids.length; i++) {
            long id = ids[i];
            newsDao.delete(id);
        }
    }

    @Override
    public List<NewsModel> findAll(Pageble pageble) {
        return newsDao.findAll(pageble);
    }

    @Override
    public int getTotalItem() {
        return newsDao.getTotalItem();
    }

    @Override
    public NewsModel finOne(Long id) {
        NewsModel newModel = newsDao.findOne(id);
        CategoryModel categoryModel = categoryDAO.findOne(newModel.getCategoryId());
        newModel.setCategoryCode(categoryModel.getCode());
        return newModel;
    }

}
