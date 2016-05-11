package com.jacket.webapp.teacher.controller;

import com.jacket.webapp.teacher.entity.Course;
import com.jacket.webapp.teacher.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by jacket on 2016/4/6.
 */
@Controller
@RequestMapping("exam")
public class ExamController {
    @Autowired
    private CourseService courseService;
    @RequestMapping(value = "{courseId}",method = RequestMethod.GET)
    public String listStudent(@PathVariable String courseId,ModelMap map){
        Course course=courseService.getOne(courseId);
        map.put("courseName", course.getName());
        map.put("courseId",course.getId());
        return "teacher/exam/listPaper";
    }
    @RequestMapping(value = "{courseId}/paperStatus",method = RequestMethod.GET)
    public String paperStatus(@PathVariable String courseId,ModelMap map){
        Course course=courseService.getOne(courseId);
        map.put("courseName", course.getName());
        map.put("courseId",course.getId());
        return "teacher/exam/paperStatus";
    }
}
