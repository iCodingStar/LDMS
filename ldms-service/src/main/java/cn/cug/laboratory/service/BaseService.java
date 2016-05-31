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
package cn.cug.laboratory.service;

/**
 * @autor shixing
 * @since 1.0.0
 */

public interface BaseService<T> {
    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:动态插入信息
     */
    public void insertSelective(T record);


    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:根据id删除
     */
    public void deleteByPrimaryKey(Integer id);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:根据id修改任意信息
     */
    public int updateByPrimaryKeySelective(T record);

    /**
     * @author: shixing
     * @function:根据id查询信息
     * @since : 1.0.0
     */
    public T selectByPrimaryKey(String id);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:模糊查询
     */


}
