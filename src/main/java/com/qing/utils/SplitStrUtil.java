package com.qing.utils;

//将查询变成符合模糊插叙的字符串，如："肥牛"-->"%肥%牛%"
public class SplitStrUtil {
    private String str;
    public SplitStrUtil(String str){
        this.str = str;
    }
    public static String new_str(String str){
        char[] chars = str.toCharArray();
        String new_str = "";
        for (char aChar : chars) {
            new_str = new_str + "%" + aChar;
        }
        new_str = new_str + "%";
        return new_str;
    }
}
