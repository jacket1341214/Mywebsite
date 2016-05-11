package com.jacket.webapp.student.controller;

import com.jacket.webapp.student.entity.ErrorQuestion;
import com.jacket.webapp.student.service.ErrorQuestionService;
import com.jacket.webapp.teacher.entity.Course;
import com.jacket.webapp.teacher.service.CourseService;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by jacket on 2016/4/4.
 */
@Controller
@RequestMapping("student")
public class ErrorQuestionController {
    @Autowired
    private ErrorQuestionService errorQuestionService;
    @Autowired
    private CourseService courseService;

    /**
     * 列出错题的课程
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "errorQuestion",method = RequestMethod.POST)
    @ResponseBody
    public List<Course> listCourse(HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return errorQuestionService.listCourseByUserId(user.getId());
    }



    /**
     * 列出所有错题
     * @param courseId
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/errorQuestion",method = RequestMethod.GET)
    public String errorQuestion(@PathVariable String courseId,HttpSession httpSession,ModelMap map){
        map.put("course",courseService.getOne(courseId));

        return "student/errorQuestion/errorQuestion";
    }
}
