/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.service.impl;

import com.webbanhang.dao.IComentDAO;
import com.webbanhang.model.CommentModel;
import com.webbanhang.paging.Pageble;
import com.webbanhang.service.ICommentService;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author asus
 */
public class CommentService implements ICommentService {

    @Inject
    private IComentDAO cmtDAO;

    @Override
    public CommentModel save(CommentModel cmtModel) {
        cmtModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        Long newId = cmtDAO.save(cmtModel);
        return cmtDAO.findOne(newId);
    }

    @Override
    public List<CommentModel> finAllCmtByUserId(Long id) {
        return cmtDAO.finAllCmtByUserId(id);
    }

    @Override
    public List<CommentModel> findAll(Pageble pageble) {
        return cmtDAO.findAll(pageble);
    }

    @Override
    public int getTotalCmt() {
        return cmtDAO.getTotalCmt();
    }

    @Override
    public void delete(long[] ids) {
        for (int i = 0; i < ids.length; i++) {
            long id = ids[i];
            cmtDAO.delete(id);
        }
    }

}
