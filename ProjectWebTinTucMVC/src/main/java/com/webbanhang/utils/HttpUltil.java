/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;

/**
 *
 * @author asus
 */
public class HttpUltil {

    private String value;

    public HttpUltil(String value) {
        this.value = value;
    }
    public <T> T toModel(Class<T> tClass){
        try {
            return new ObjectMapper().readValue(value, tClass);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static HttpUltil of(BufferedReader reader) {
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            while((line = reader.readLine()) != null){
                sb.append(line);
            }
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return new HttpUltil(sb.toString());
    }
}
