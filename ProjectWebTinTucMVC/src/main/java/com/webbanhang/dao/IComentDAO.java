/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.dao;

import com.webbanhang.model.CommentModel;
import com.webbanhang.paging.Pageble;
import java.util.List;

/**
 *
 * @author asus
 */
public interface IComentDAO extends GenericDAO {

    List<CommentModel> findAll(Pageble pageble);

    Long save(CommentModel cmtModel);

    CommentModel findOne(Long id);

    List<CommentModel> finAllCmtByUserId(Long id);

    int getTotalCmt();

    void delete(long id);

}
