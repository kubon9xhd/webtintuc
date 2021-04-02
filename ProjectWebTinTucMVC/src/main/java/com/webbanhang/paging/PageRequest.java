/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.paging;

import com.webbanhang.sort.Sorter;

/**
 *
 * @author asus
 */
public class PageRequest implements Pageble {

    private Integer page;
    private Integer maxPageItem;
    private Sorter sort;
    
    public PageRequest(Integer page, Integer maxPageItem, Sorter sort) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.sort = sort;
    }

    @Override
    public Integer getPage() {
        if(this.page == null){
            return 1;
        }
        return this.page;
    }

    @Override
    public Integer getOffset() {
        if (this.page != null && this.maxPageItem != null) {
            return (this.page - 1) * this.maxPageItem;
        } else {
            return 0;
        }
    }

    @Override
    public Integer getLimit() {
        if(this.maxPageItem == null){
            return 4;
        }
        return this.maxPageItem;
    }

    @Override
    public Sorter getSorter() {
        if(this.sort != null){
            return this.sort;
        }
        return null;
    }

}
