package com.jacket.webapp.teacher.controller;

import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jacket on 2016/3/23.
 */
@Controller
@RequestMapping("teacher")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping(value = "createCourse",method = RequestMethod.GET)
    public String createCourseInit(){
        return "teacher/course/createCourse";
    }
    @RequestMapping(value = "createCourse",method = RequestMethod.POST)
    public String createCourse(Course course,HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        course.setId(new UUIDGeneratorUtils().uuid32());
        course.setUserId(user.getId());
        course.setUpdateTime(new Date());
        if(1==courseService.save(course))
            map.put("msg","sucess");
        else map.put("msg","failed");
        return "teacher/course/createCourse";
    }
    @RequestMapping(value = "viewCourse",method = RequestMethod.GET)
    public String viewCourseInit(HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        map.put("courses", courseService.viewCourse(user.getId()));
        return "teacher/course/viewCourse";
    }
    @RequestMapping(value = "viewCourse",method = RequestMethod.POST)
    public String viewCourse(){
        return "teacher/course/viewCourse";
    }
    @RequestMapping(value = "updateCourse",method = RequestMethod.GET)
    public String updateCourseInit(HttpSession httpSession,ModelMap map,String courseId){
        User user=(User)httpSession.getAttribute("USER");
        map.put("course",courseService.findById(courseId,user.getId()));
        return "teacher/course/updateCourse";
    }

    @RequestMapping(value = "updateCourse",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> updateCourse(Course course){
        course.setUpdateTime(new Date());
        Map<String,String> map=new HashMap<>();
        if(1==courseService.update(course))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "findCourseByUserId",method = RequestMethod.POST)
    public List<Course> findCourseByUserId(HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return courseService.findCourseByUserId(user.getId());
    }

    /**
     * 根据课程编号查看题库
     * @param courseId
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}",method = RequestMethod.GET)
    public String findCourseById(@PathVariable("courseId")String courseId,ModelMap map){
        System.out.println("--------courseId--------" + courseId + "--------------");
        Course course=courseService.getOne(courseId);
        map.put("courseName", course.getName());
        map.put("courseId",course.getId());
        return "teacher/questionBank/viewQuestionBank";
    }

}
