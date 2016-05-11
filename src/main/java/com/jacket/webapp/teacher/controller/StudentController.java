package com.jacket.webapp.teacher.controller;

import com.jacket.webapp.student.service.GradeService;
import com.jacket.webapp.teacher.entity.Course;
import com.jacket.webapp.teacher.entity.Paper;
import com.jacket.webapp.teacher.service.CourseService;
import com.jacket.webapp.teacher.service.PaperService;
import com.jacket.webapp.teacher.service.StudentService;
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
 * Created by jacket on 2016/4/6.
 */
@Controller
@RequestMapping("teacher/student")
public class StudentController {
    @Autowired
    private PaperService paperService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private GradeService gradeService;

    /**
     * 初始化跳转到显示选了该课程的学生
     * @param courseId
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}",method = RequestMethod.GET)
    public String listStudent(@PathVariable String courseId,ModelMap map){
        Course course=courseService.getOne(courseId);
        map.put("courseName", course.getName());
        map.put("courseId",course.getId());
        return "teacher/student/listStudent";
    }

    /**
     * 加载学生列表
     * @param courseId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/listStudent",method = RequestMethod.POST)
    @ResponseBody
    public List<User> listStudent2(@PathVariable String courseId,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return studentService.listStudentByCourseIdAndTeacherId(courseId,user.getId());
    }
    @RequestMapping(value = "{courseId}/showGrade",method = RequestMethod.GET)
    public String showGrade(@PathVariable String courseId,ModelMap map){
        Course course=courseService.getOne(courseId);
        map.put("courseName", course.getName());
        map.put("courseId",course.getId());
        return "teacher/student/showGrade";
    }

    /**
     * 根据教师id，课程id，试卷id列出参加考试学生的成绩
     * @param courseId
     * @param paperId
     * @param map
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}",method = RequestMethod.GET)
    public String showGradeDetail(@PathVariable String courseId,@PathVariable String paperId,
                                  ModelMap map,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        Paper paper=paperService.getOne(paperId);
        map.put("paper",paper);
        map.put("viewGrades",gradeService.findByTeacherIdAndCourseIdAndPaperId(user.getId(), courseId,paperId));
        return "teacher/paper/record";
    }
}
