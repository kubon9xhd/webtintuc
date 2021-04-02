/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.utils;

import java.lang.reflect.InvocationTargetException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtils;


/**
 *
 * @author asus
 */
public class FromUltil {
        public static <T> T toModel(Class<T> tClass,HttpServletRequest request){
            T object = null;
            try {
                object = tClass.newInstance();
                BeanUtils.populate(object, request.getParameterMap());
            } catch (InstantiationException | InvocationTargetException  | IllegalAccessException ex) {
                System.out.println(ex.getMessage());
            }
            return object;
        }
}
