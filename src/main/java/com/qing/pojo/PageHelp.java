package com.qing.pojo;

public class PageHelp {
    // 每页的数量
    private Integer pageSize = 10;
    // 当前页
    private Integer pageNum = 1;
    // 循环页数
    private Integer navigatePages = 2;

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getNavigatePages() {
        return navigatePages;
    }

    public void setNavigatePages(Integer navigatePages) {
        this.navigatePages = navigatePages;
    }
}
