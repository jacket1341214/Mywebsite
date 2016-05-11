package com.jacket.webapp.teacher.controller;

import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.teacher.entity.*;
import com.jacket.webapp.teacher.service.*;
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
 * Created by jacket on 2016/3/26.
 */
@Controller
@RequestMapping("teacher")
public class QuestionBankController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private QuestionBankService questionBankService;
    @Autowired
    private SingleQuestionService singleQuestionService;
    @Autowired
    private TfQuestionService tfQuestionService;
    @Autowired
    private MultipleQuestionService multipleQuestionService;
    @Autowired
    private CompleteQuestionService completeQuestionService;
    @Autowired
    private ShortAnswerQuestionService shortAnswerQuestionService;
    @RequestMapping(value = "{courseId}/questionBank",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> questionBank(QuestionBank questionBank,
                               @PathVariable String courseId,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        questionBank.setId(new UUIDGeneratorUtils().uuid32());
        questionBank.setCourseId(courseId);
        questionBank.setUserId(user.getId());
        questionBank.setCreateTime(new Date());
        questionBank.setUpdateTime(new Date());
        Map<String,String> map=new HashMap<>();
        if(1==questionBankService.save(questionBank))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;

    }

    /**
     * 根据课程列出题库
     * @param courseId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/listQuestionBank",method = RequestMethod.POST)
    @ResponseBody
    public List<QuestionBank> listQuestionBank(@PathVariable String courseId,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return questionBankService.listQuestionBank(courseId,user.getId());
    }

    /**
     * 列出题库的所有题目
     * @param courseId
     * @param bankId
     * @param map
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/questionBank/{bankId}",method = RequestMethod.GET)
    public String questionBankInit(@PathVariable String courseId,@PathVariable String bankId,
                                   ModelMap map,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        QuestionBank questionBank=questionBankService.getOne(bankId);
        map.put("questionBank",questionBank);
        map.put("singleQuestions", singleQuestionService.listSingleQuestion(user.getId(), courseId, bankId));
        map.put("tfQuestions", tfQuestionService.listTfQuestion(user.getId(), courseId, bankId));
        map.put("multipleQuestions",multipleQuestionService.listMultipleQuestion(user.getId(), courseId, bankId));
        map.put("completeQuestions", completeQuestionService.listCompleteQuestion(user.getId(), courseId, bankId));
        map.put("shortAnswerQuestions", shortAnswerQuestionService.listShortAnswerQuestion(user.getId(), courseId, bankId));


        return "teacher/questionBank/questionBank";

    }

    /**
     * 根据题目类型删除题目
     * @param courseId
     * @param bankId
     * @param type
     * @param id
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/questionBank/{bankId}/deleteQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteQuestion(@PathVariable String courseId,@PathVariable String bankId,
                                  int type,String id,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        Map<String,String> map=new HashMap<>();
        switch (type){
            case 1:if(1==singleQuestionService.deleteByPrimaryKey(id))
                map.put("msg","success");
            else map.put("msg","failed");
                break;
            case 2:if(1==tfQuestionService.deleteByPrimaryKey(id))
                map.put("msg","success");
            else map.put("msg","failed");
                break;
            case 3:if(1==multipleQuestionService.deleteByPrimaryKey(id))
                map.put("msg","success");
            else map.put("msg","failed");
                break;
            case 4:if(1==completeQuestionService.deleteByPrimaryKey(id))
                map.put("msg","success");
            else map.put("msg","failed");
                break;
            case 5:if(1==shortAnswerQuestionService.deleteByPrimaryKey(id))
                map.put("msg","success");
            else map.put("msg","failed");
                break;
        }


        return map;

    }
    @RequestMapping(value = "{courseId}/questionBank/{bankId}/updateQuestion",method = RequestMethod.GET)
    public String updateQuestion(@PathVariable String courseId,@PathVariable String bankId,
                                             int type,String id,HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        map.put("type",type);
        switch (type){
            case 1: map.put("question",singleQuestionService.getOne(id));
                break;
            case 2: map.put("question",tfQuestionService.getOne(id));
                break;
            case 3: map.put("question", multipleQuestionService.getOne(id));
                break;
            case 4: map.put("question",completeQuestionService.getOne(id));
                break;
            case 5:map.put("question",shortAnswerQuestionService.getOne(id));
                break;
        }


        return "teacher/questionBank/updateQuestion";

    }



    /**
     * 添加单选题
     * @param courseId
     * @param singleQuestion 单选题实体
     * @return
     */
    @RequestMapping(value = "{courseId}/addSingleQuestion",method = RequestMethod.POST)
    public String addSingleQuestion(@PathVariable String courseId,ModelMap map,
                                    HttpSession httpSession,SingleQuestion singleQuestion){
        User user=(User)httpSession.getAttribute("USER");
        singleQuestion.setId(new UUIDGeneratorUtils().uuid32());
        singleQuestion.setCourseId(courseId);
        singleQuestion.setUserId(user.getId());
        singleQuestion.setCreateTime(new Date());
        singleQuestion.setUpdateTime(new Date());
        if(1==singleQuestionService.save(singleQuestion))
            map.put("msg","success");
        else map.put("msg","failed");
        addQuestion(courseId,map,httpSession);
        return "teacher/questionBank/addQuestion";

    }

    /**
     * 添加判断题
     * @param courseId
     * @param map
     * @param httpSession
     * @param tfQuestion
     * @return
     */
    @RequestMapping(value = "{courseId}/addTfQuestion",method = RequestMethod.POST)
    public String addTfQuestion(@PathVariable String courseId,ModelMap map,
                                    HttpSession httpSession,TfQuestion tfQuestion){
        User user=(User)httpSession.getAttribute("USER");
        tfQuestion.setId(new UUIDGeneratorUtils().uuid32());
        tfQuestion.setCourseId(courseId);
        tfQuestion.setUserId(user.getId());
        tfQuestion.setCreateTime(new Date());
        tfQuestion.setUpdateTime(new Date());
        if(1==tfQuestionService.save(tfQuestion))
            map.put("msg","success");
        else map.put("msg","failed");
        addQuestion(courseId, map, httpSession);
        return "teacher/questionBank/addQuestion";
    }

    /**
     * 添加多些选择题
     * @param courseId
     * @param map
     * @param httpSession
     * @param multipleQuestion
     * @return
     */
    @RequestMapping(value = "{courseId}/addMultipleQuestion",method = RequestMethod.POST)
    public String addMultipleQuestion(@PathVariable String courseId,ModelMap map,
                                HttpSession httpSession,MultipleQuestion multipleQuestion){
        User user=(User)httpSession.getAttribute("USER");
        multipleQuestion.setId(new UUIDGeneratorUtils().uuid32());
        multipleQuestion.setCourseId(courseId);
        multipleQuestion.setUserId(user.getId());
        multipleQuestion.setCreateTime(new Date());
        multipleQuestion.setUpdateTime(new Date());
        if(1==multipleQuestionService.save(multipleQuestion))
            map.put("msg","success");
        else map.put("msg","failed");
        addQuestion(courseId,map,httpSession);
        return "teacher/questionBank/addQuestion";
    }

    /**
     * 添加填空题
     * @param courseId
     * @param map
     * @param httpSession
     * @param completeQuestion
     * @return
     */
    @RequestMapping(value = "{courseId}/addCompleteQuestion",method = RequestMethod.POST)
    public String addCompleteQuestion(@PathVariable String courseId,ModelMap map,
                                HttpSession httpSession,CompleteQuestion completeQuestion){
        User user=(User)httpSession.getAttribute("USER");
        completeQuestion.setId(new UUIDGeneratorUtils().uuid32());
        completeQuestion.setCourseId(courseId);
        completeQuestion.setUserId(user.getId());
        completeQuestion.setCreateTime(new Date());
        completeQuestion.setUpdateTime(new Date());
        if(1==completeQuestionService.save(completeQuestion))
            map.put("msg","success");
        else map.put("msg","failed");
        addQuestion(courseId, map, httpSession);
        return "teacher/questionBank/addQuestion";
    }

    /**
     * 添加简答题
     * @param courseId
     * @param map
     * @param httpSession
     * @param shortAnswerQuestion
     * @return
     */
    @RequestMapping(value = "{courseId}/addShortAnswerQuestion",method = RequestMethod.POST)
    public String addShortAnswerQuestion(@PathVariable String courseId,ModelMap map,
                                HttpSession httpSession,ShortAnswerQuestion shortAnswerQuestion){
        User user=(User)httpSession.getAttribute("USER");
        shortAnswerQuestion.setId(new UUIDGeneratorUtils().uuid32());
        shortAnswerQuestion.setCourseId(courseId);
        shortAnswerQuestion.setUserId(user.getId());
        shortAnswerQuestion.setCreateTime(new Date());
        shortAnswerQuestion.setUpdateTime(new Date());
        if(1==shortAnswerQuestionService.save(shortAnswerQuestion))
            map.put("msg","success");
        else map.put("msg","failed");
        addQuestion(courseId, map, httpSession);
        return "teacher/questionBank/addQuestion";
    }

    @RequestMapping(value = "{courseId}/questionBank/{bankId}/addTfQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> tfQuestion(@PathVariable String courseId,@PathVariable String bankId,
                                             HttpSession httpSession,TfQuestion tfQuestion){
        User user=(User)httpSession.getAttribute("USER");
        tfQuestion.setId(new UUIDGeneratorUtils().uuid32());
        tfQuestion.setBankId(bankId);
        tfQuestion.setCourseId(courseId);
        tfQuestion.setUserId(user.getId());
        tfQuestion.setCreateTime(new Date());
        tfQuestion.setUpdateTime(new Date());
        Map<String,String> map=new HashMap<>();
        if(1==tfQuestionService.save(tfQuestion))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 添加题目跳转
     * @param courseId
     * @param map
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/addQuestion",method = RequestMethod.GET)
    public String addQuestion(@PathVariable String courseId,ModelMap map,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        Course course=courseService.getOne(courseId);
        map.put("courseId", courseId);
        map.put("courseName", course.getName());
        map.put("questionBanks", questionBankService.listQuestionBank(courseId, user.getId()));
        return "teacher/questionBank/addQuestion";
    }

    /**
     * 根据题库id列出选择题
     * @param bankId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "questionBank/{bankId}/listSingleQuestion",method = RequestMethod.POST)
    @ResponseBody
    public List<SingleQuestion> listSingleQuestionByBankId(@PathVariable String bankId,
                                         HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return singleQuestionService.listSingleQuestionByBankId(bankId,user.getId());
    }

    /**
     * 根据题库ID列出判断题
     * @param bankId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "questionBank/{bankId}/listTfQuestion",method = RequestMethod.POST)
    @ResponseBody
    public List<TfQuestion> listTfQuestionByBankId(@PathVariable String bankId,
                                                           HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return tfQuestionService.listTfQuestionByBankId(bankId, user.getId());
    }

    /**
     * 根据题库id列出多选题
     * @param bankId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "questionBank/{bankId}/listMultipleQuestion",method = RequestMethod.POST)
    @ResponseBody
    public List<MultipleQuestion> listMultipleQuestionByBankId(@PathVariable String bankId,
                                                   HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return multipleQuestionService.listMultipleQuestionByBankId(user.getId(), bankId);
    }

    /**
     * 根据题库id列出填空题
     * @param bankId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "questionBank/{bankId}/listCompleteQuestion",method = RequestMethod.POST)
    @ResponseBody
    public List<CompleteQuestion> listCompleteQuestionByBankId(@PathVariable String bankId,
                                                               HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return completeQuestionService.listCompleteQuestionByBankId(user.getId(), bankId);
    }

    /**
     * 根据题库id列出简答题
     * @param bankId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "questionBank/{bankId}/listShortAnswerQuestion",method = RequestMethod.POST)
    @ResponseBody
    public List<ShortAnswerQuestion> listShortAnswerQuestionByBankId(@PathVariable String bankId,
                                                               HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return shortAnswerQuestionService.listShortAnswerQuestionByBankId(user.getId(), bankId);
    }
}
