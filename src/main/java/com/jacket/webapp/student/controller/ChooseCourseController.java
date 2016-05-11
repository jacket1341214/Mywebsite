package com.jacket.webapp.student.controller;

import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.student.entity.ChooseCourse;
import com.jacket.webapp.student.entity.ViewCourse;
import com.jacket.webapp.student.service.ChooseCourseService;
import com.jacket.webapp.student.service.ViewCourseService;
import com.jacket.webapp.teacher.service.CourseService;
import com.jacket.webapp.teacher.service.PaperService;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jacket on 2016/3/31.
 */
@Controller
@RequestMapping("student")
public class ChooseCourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private ChooseCourseService chooseCourseService;
    @Autowired
    private PaperService paperService;
    @Autowired
    private ViewCourseService viewCourseService;

    /**
     * 选课跳转，列出所有课程
     * @param map
     * @return
     */
    @RequestMapping(value = "chooseCourse",method = RequestMethod.GET)
    public String chooseCourseInit(ModelMap map){
        map.put("viewCourses",viewCourseService.queryAll() );
        return "student/course/chooseCourse";
    }

    /**
     * 根据课程id选课
     * @param courseId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "chooseCourse",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> chooseCourse(String courseId,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        ChooseCourse chooseCourse=new ChooseCourse();
        chooseCourse.setId(new UUIDGeneratorUtils().uuid32());
        chooseCourse.setCourseId(courseId);
        chooseCourse.setUserId(user.getId());
        Map<String,String> map=new HashMap<>();
        if(1==chooseCourseService.save(chooseCourse))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 查看选课初始化跳转
     * @param map
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "viewCourse",method = RequestMethod.GET)
    public String viewCourseInit(ModelMap map,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        map.put("viewCourses",viewCourseService.findCourseByUserId(user.getId()));
        return "student/course/viewCourse";
    }

    /**
     * 查看选课动态加载
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "findCourseByUserId",method = RequestMethod.POST)
    @ResponseBody
    public List<ViewCourse> findCourseByUserId(HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
       return viewCourseService.findCourseByUserId2(user.getId());
    }
    @RequestMapping(value = "viewCourse",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> viewCourseInit(ChooseCourse chooseCourse){
        Map<String,String> map=new HashMap<>();
        if(1==chooseCourseService.delete(chooseCourse))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 根据课程列出试卷
     * @param courseId
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/viewPaper",method = RequestMethod.GET)
    public String viewPaper(@PathVariable String courseId,ModelMap map){
        map.put("course",courseService.getOne(courseId));
        map.put("papers",paperService.listPaperByCourseId(courseId));
        return "student/paper/viewPaper";
    }
}
