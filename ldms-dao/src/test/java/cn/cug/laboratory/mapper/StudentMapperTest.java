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
package cn.cug.laboratory.mapper;

import cn.cug.laboratory.mapper.extend.UserExtendMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @autor shixing
 * @since 1.0.0
 */

public class StudentMapperTest extends AbstarctSpringTest {
    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private UserExtendMapper userExtendMapper;

    @Test
    public void getAuthTest(){
//        studentMapper.selectByPrimaryKey("");
    }

    @Test
    public void testSelectByPrimaryKey(){

        //studentMapper.selectByPrimaryKey("");
    }


}
