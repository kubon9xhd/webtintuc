/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.model;

import java.util.List;

/**
 *
 * @author asus
 */
public class NewsModel extends AbstractModel<NewsModel> {

    private String title;
    private String thumnail;
    private String shortDescription;
    private String content;
    private long categoryId;
    private String categoryCode;
    private List<CommentModel> listCmt;

    public List<CommentModel> getListCmt() {
        return listCmt;
    }

    public void setListCmt(List<CommentModel> listCmt) {
        this.listCmt = listCmt;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumnail() {
        return thumnail;
    }

    public void setThumnail(String thumnail) {
        this.thumnail = thumnail;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

}
