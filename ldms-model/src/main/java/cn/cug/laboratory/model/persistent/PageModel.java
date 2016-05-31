/*
 * Copyright 2016-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package cn.cug.laboratory.model.persistent;

import java.util.List;

import static javafx.scene.input.KeyCode.T;

/**
 * @autor shixing
 * @since 1.0.0
 */

public class PageModel<T> {
    private Integer currentPage = 1;//当前页码
    private Integer startPosition = 0;//起始记录位置
    private Integer offset = 6;//每页显示数目
    private Integer startPage = 1;//起始页面
    private Integer endPage = 1;//结束页面
    private Integer totalPages = 0; //总页面数
    private Integer totalRecords = 0;//总记录数
    private List<T> data = null;//数据

    public PageModel() {
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public PageModel(Integer currentPage,Integer offset,Integer totalRecords){
        //初始化当前页面
        if (currentPage == null){
            currentPage = 1;
        }
        if (currentPage <= 1){
            this.currentPage = 1;
        }
        else if (currentPage > totalPages){
            this.currentPage = currentPage;
        }
        //初始化起始点
        this.startPosition = (this.currentPage-1) * offset;
        //初始化offset
        if (offset <= 0){
            this.offset = 0;
        }
        this.offset = offset;
        //初始化总记录数
        this.totalRecords = totalRecords;
        //初始化总页面数
        if (totalRecords % offset == 0)
            this.totalPages = totalRecords / offset;
        else
            this.totalPages = totalRecords / offset + 1;
        //初始化起始结束页面
        if (totalPages <= 10){
            this.startPage = 1;
            this.endPage = this.totalPages;
        }else {
            this.startPage = currentPage - currentPage % 10 + 1;
            this.endPage = this.startPage + 10;
        }
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getStartPosition() {
        return startPosition;
    }

    public void setStartPosition(Integer startPosition) {
        this.startPosition = startPosition;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getStartPage() {
        return startPage;
    }

    public void setStartPage(Integer startPage) {
        this.startPage = startPage;
    }

    public Integer getEndPage() {
        return endPage;
    }

    public void setEndPage(Integer endPage) {
        this.endPage = endPage;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
