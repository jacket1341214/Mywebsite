package com.jacket.webapp.common.utils;


/**
 * Created by Wang Gang on 2015/5/5.
 */
public class UUIDGeneratorUtils {

    public String uuid32(){
        return java.util.UUID.randomUUID().toString().replace("-","");
    }
}
