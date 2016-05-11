package com.jacket.webapp.student.controller;

import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.student.entity.ErrorQuestion;
import com.jacket.webapp.student.entity.ErrorSingleQuestion;
import com.jacket.webapp.student.entity.Grade;
import com.jacket.webapp.student.service.ErrorQuestionService;
import com.jacket.webapp.student.service.GradeService;
import com.jacket.webapp.teacher.entity.SingleQuestion;
import com.jacket.webapp.teacher.service.*;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jacket on 2016/4/4.
 */
@Controller
@RequestMapping("student")
public class GradeController {
    @Autowired
    private PaperDetailService paperDetailService;
    @Autowired
    private SingleQuestionService singleQuestionService;
    @Autowired
    private TfQuestionService tfQuestionService;
    @Autowired
    private GradeService gradeService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private PaperService paperService;
    @Autowired
    private ErrorQuestionService errorQuestionService;

    /**
     * 列出考试的试题
     * @param courseId
     * @param paperId
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/viewPaper/{paperId}",method = RequestMethod.GET)
    public String startExam(@PathVariable String courseId,@PathVariable String paperId,
                            ModelMap map){
        map.put("paperName",paperService.getOne(paperId).getName());
        map.put("singleQuestions",paperDetailService.listSingleQuestion(paperId));
        map.put("tfQuestions",paperDetailService.listTfQuestion(paperId));
        map.put("multipleQuestions",paperDetailService.listMultipleQuestion(paperId));
        map.put("completeQuestions", paperDetailService.listCompleteQuestion(paperId));
        map.put("shortAnswerQuestions", paperDetailService.listShortAnswerQuestion(paperId));
        return "student/paper/exam";
    }

    /**
     * 添加错题
     * @param courseId
     * @param paperId
     * @param id
     * @param type
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/viewPaper/{paperId}/addErrorQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addErrorQuestion(@PathVariable String courseId,@PathVariable String paperId,
                           String id,int type, HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        Map<String,String> map=new HashMap<>();
        ErrorQuestion errorQuestion=new ErrorQuestion();
        errorQuestion.setId(new UUIDGeneratorUtils().uuid32());
        errorQuestion.setCourseId(courseId);
        errorQuestion.setType(type);
        errorQuestion.setQuestionId(id);
        errorQuestion.setUserId(user.getId());
        errorQuestion.setAddTime(new Date());
        if(1==errorQuestionService.save(errorQuestion)){
            map.put("msg","success");
        }
        else {
            map.put("msg","failed");
        }

        return map;
    }
    @RequestMapping(value = "{courseId}/viewGrade",method = RequestMethod.GET)
    public String viewGrade(@PathVariable String courseId,HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        map.put("grades",gradeService.findByUserIdAndCourseId(user.getId(),courseId));
        return "student/grade/viewGrade";
    }
}
