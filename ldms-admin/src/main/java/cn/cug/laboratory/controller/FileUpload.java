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
package cn.cug.laboratory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @autor shixing
 * @since 1.0.0
 */

@Controller
public class FileUpload {
    @RequestMapping(
            value = "/action/file.do",
            method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    String uploadPhoto(@RequestParam MultipartFile uFile,
                       HttpServletRequest request,
                       HttpServletResponse response,
                       ModelMap map) {
        System.out.println("Hello");
        try {
            if (uFile != null && !uFile.isEmpty()) {
                System.out.println("file:" + uFile.getOriginalFilename());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
}
