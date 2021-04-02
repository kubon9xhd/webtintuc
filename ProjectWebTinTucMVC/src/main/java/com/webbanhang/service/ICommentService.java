/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service;

import com.webbanhang.model.CommentModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public interface ICommentService {

    List<CommentModel> findAll(Pageble pageble);

    CommentModel save(CommentModel cmtModel);

    List<CommentModel> finAllCmtByUserId(Long id);

    int getTotalCmt();

    void delete(long[] ids);

}
