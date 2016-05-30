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

import cn.cug.laboratory.model.extend.StudentExtend;
import cn.cug.laboratory.model.persistent.Student;

import java.util.List;

/**
 *  Created by PP on 2016/5/20.
 */

public interface StudentService {
    /**
     *
     * @param id
     * @return
     */
    public Student selectByPrimaryKey(String id);

    /**
     *
     * @param name
     * @param major
     * @param classId
     * @param academy
     * @param sex
     */
    public void insert(String name, String major, Integer classId, String academy, String sex);

    public List<StudentExtend> getAllStudentByProId(String id);

}
