package com.jacket.webapp.teacher.controller;

import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.teacher.entity.*;
import com.jacket.webapp.teacher.service.*;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jacket on 2016/4/2.
 */
@Controller
@RequestMapping("teacher")
public class PaperController {
    @Autowired
    private PaperService paperService;
    @Autowired
    private PaperDetailService paperDetailService;
    @Autowired
    private QuestionBankService questionBankService;
    @Autowired
    private SingleQuestionService singleQuestionService;
    @Autowired
    private TfQuestionService tfQuestionService;

    /**
     * 新建试卷
     * @param paper
     * @param httpSession
     * @param courseId
     * @return
     */
    @RequestMapping(value = "{courseId}/addPaper",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addPaper(Paper paper,HttpSession httpSession,@PathVariable String courseId){
        paper.setId(new UUIDGeneratorUtils().uuid32());
        paper.setCourseId(courseId);
        User user=(User)httpSession.getAttribute("USER");
        paper.setUserId(user.getId());
        paper.setCreateTime(new Date());
        paper.setUpdateTime(new Date());
        Map<String,String> map=new HashMap<>();
        if(1==paperService.save(paper))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 删除试卷
     * @param paper
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/deletePaper",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> deletePaper(Paper paper,HttpSession httpSession){
        Map<String,String> map=new HashMap<>();
        if(1==paperService.delete(paper))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 根据课程列出试卷
     * @param courseId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/listPaper",method = RequestMethod.POST)
    @ResponseBody
    public List<Paper> listPaper(@PathVariable String courseId,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return paperService.listPaperByCourseIdAndUserId(courseId,user.getId());
    }

    /**
     * 查看试卷的考试成绩
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/record",method = RequestMethod.GET)
    public String record(@PathVariable String courseId,@PathVariable String paperId,
                              HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        Paper paper=paperService.getOne(paperId);
        map.put("paper",paper);
        //map.put("singleQuestions",paperDetailService.listSingleQuestion(paperId));
        return "teacher/paper/paperDetail";
    }

    /**
     * 试卷详细信息
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}",method = RequestMethod.GET)
    public String paperDetail(@PathVariable String courseId,@PathVariable String paperId,
                              HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        Paper paper=paperService.getOne(paperId);
        map.put("paper",paper);
        map.put("singleQuestions",paperDetailService.listSingleQuestion(paperId));
        return "teacher/paper/paperDetail";
    }

    /**
     * 试题管理
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @return
     */

    @RequestMapping(value = "{courseId}/paper/{paperId}/questionManage",method = RequestMethod.GET)
    public String questionManage(@PathVariable String courseId,@PathVariable String paperId,
                              HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        Paper paper=paperService.getOne(paperId);
        map.put("paper",paper);
        map.put("singleQuestions",paperDetailService.listSingleQuestion(paperId));
        map.put("tfQuestions",paperDetailService.listTfQuestion(paperId));
        map.put("multipleQuestions",paperDetailService.listMultipleQuestion(paperId));
        map.put("completeQuestions", paperDetailService.listCompleteQuestion(paperId));
        map.put("shortAnswerQuestions", paperDetailService.listShortAnswerQuestion(paperId));

        return "teacher/paper/questionManage";
    }

    /**
     * 删除试卷中的题目
     * @param courseId
     * @param paperId
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/questionManage/deleteQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteQuestion(@PathVariable String courseId,@PathVariable String paperId,
                                 HttpSession httpSession,int type,String id){
        User user=(User)httpSession.getAttribute("USER");

        Map<String,String> map=new HashMap<>();
        if(1==paperDetailService.deleteQuestionByPaperIdQuestionId(paperId,id)){
            map.put("msg","success");
        }
        else {
            map.put("msg","failed");
        }

        return map;
    }

    /**
     * 添加试题
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/questionManage/addQuestion",method = RequestMethod.GET)
    public String addQuestion(@PathVariable String courseId,@PathVariable String paperId,
                                 HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        Paper paper=paperService.getOne(paperId);
        map.put("paper",paper);
        List<QuestionBank> questionBanks=questionBankService.listQuestionBank(courseId, user.getId());
        map.put("questionBanks",questionBanks);
        //map.put("singleQuestions",paperDetailService.listSingleQuestion(paperId));
        return "teacher/paper/addQuestion";
    }
    @RequestMapping(value = "{courseId}/paper/{paperId}/questionManage/randomAddQuestion",method = RequestMethod.GET)
    public String randomAddQuestion(@PathVariable String courseId,@PathVariable String paperId,
                              HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        Paper paper=paperService.getOne(paperId);
        map.put("paper",paper);
        List<QuestionBank> questionBanks=questionBankService.listQuestionBank(courseId, user.getId());
        map.put("questionBanks",questionBanks);
        return "teacher/paper/randomAddQuestion";
    }

    /**
     * 随机组卷
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @param bankId 题库id
     * @param type 题目类型
     * @param score 每题分数
     * @param count 题目数量
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "{courseId}/paper/{paperId}/questionManage/randomAddQuestion",method = RequestMethod.POST)
    public String randomAddQuestion2(@PathVariable String courseId,@PathVariable String paperId,
                                    HttpSession httpSession,ModelMap map,String bankId,int type,int score,int count){
        User user=(User)httpSession.getAttribute("USER");
        PaperDetail paperDetail=new PaperDetail();

        paperDetail.setPaperId(paperId);
        paperDetail.setType(type);
        if(1==type){
            List<SingleQuestion> singleQuestions=singleQuestionService.listSingleQuestion(user.getId(), courseId, bankId, score, count);
            System.out.println("------随机组卷--选择题--"+count+"----得到数量"+singleQuestions.size());
            for(SingleQuestion singleQuestion:singleQuestions){
                paperDetail.setId(new UUIDGeneratorUtils().uuid32());
                paperDetail.setQuestionId(singleQuestion.getId());
                paperDetailService.save(paperDetail);
            }


        }
        else if(2==type){
            List<TfQuestion> tfQuestions=tfQuestionService.listTfQuestion(user.getId(), courseId, bankId, score, count);
            System.out.println("------随机组卷--判断题--"+count+"----得到数量"+tfQuestions.size());
            for(TfQuestion tfQuestion:tfQuestions){
                paperDetail.setId(new UUIDGeneratorUtils().uuid32());
                paperDetail.setQuestionId(tfQuestion.getId());
                paperDetailService.save(paperDetail);
            }

        }
        else if(3==type){

        }
        else if(4==type){

        }
        else if(5==type){

        }

        return "teacher/paper/randomAddQuestion";
    }
    @RequestMapping(value = "{courseId}/paper/{paperId}/addSingleQuestion",method = RequestMethod.GET)
    public String addSingleQuestion(@PathVariable String courseId,@PathVariable String paperId,
                              HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        //map.put("singleQuestions",singleQuestionService.listSingleQuestion(user.getId(),courseId,questionBanks.get(0).getId()));
        return "teacher/paper/addSingleQuestion";
    }
    @RequestMapping(value = "{courseId}/paper/{paperId}/addTfQuestion",method = RequestMethod.GET)
    public String addTfQuestion(@PathVariable String courseId,@PathVariable String paperId,
                                    HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        List<QuestionBank> questionBanks=questionBankService.listQuestionBank(courseId, user.getId());
        map.put("questionBanks",questionBanks);
        map.put("singleQuestions",tfQuestionService.listTfQuestion(user.getId(), courseId, questionBanks.get(0).getId()));
        return "teacher/paper/addTfQuestion";
    }

    /**
     * 添加单选题到试卷
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param id
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/addSingleQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addSingleQuestion2(@PathVariable String courseId,@PathVariable String paperId,
                                    HttpSession httpSession,String id){
        User user=(User)httpSession.getAttribute("USER");
        PaperDetail paperDetail=new PaperDetail();
        paperDetail.setType(1);
        paperDetail.setPaperId(paperId);
        paperDetail.setId(new UUIDGeneratorUtils().uuid32());
        Map<String,String> map=new HashMap<>();
        paperDetail.setQuestionId(id);
            if (0==paperDetailService.save(paperDetail)){
                map.put("msg","failed");
        } else {
                map.put("msg", "success");
            }
        return map;
    }

    /**
     * 添加判断题到试卷
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param id
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/addTfQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addTfQuestion2(@PathVariable String courseId,@PathVariable String paperId,
                                                 HttpSession httpSession,String id){

        User user=(User)httpSession.getAttribute("USER");
        PaperDetail paperDetail=new PaperDetail();
        paperDetail.setType(2);
        paperDetail.setPaperId(paperId);

        paperDetail.setId(new UUIDGeneratorUtils().uuid32());
        paperDetail.setQuestionId(id);
        Map<String,String> map=new HashMap<>();

        if (0==paperDetailService.save(paperDetail)){
                map.put("msg","failed");
        }
        else {
            map.put("msg","success");
        }

        return map;
    }

    /**
     * 添加多选题到试卷
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param id
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/addMultipleQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addMultipleQuestion(@PathVariable String courseId,@PathVariable String paperId,
                                             HttpSession httpSession,String id){

        User user=(User)httpSession.getAttribute("USER");
        PaperDetail paperDetail=new PaperDetail();
        paperDetail.setType(3);
        paperDetail.setPaperId(paperId);

        paperDetail.setId(new UUIDGeneratorUtils().uuid32());
        paperDetail.setQuestionId(id);
        Map<String,String> map=new HashMap<>();

        if (0==paperDetailService.save(paperDetail)){
            map.put("msg","failed");
        }
        else {
            map.put("msg","success");
        }

        return map;
    }

    /**
     * 添加填空题到题库
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param id
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/addCompleteQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addCompleteQuestion(@PathVariable String courseId,@PathVariable String paperId,
                                                  HttpSession httpSession,String id){

        User user=(User)httpSession.getAttribute("USER");
        PaperDetail paperDetail=new PaperDetail();
        paperDetail.setType(4);
        paperDetail.setPaperId(paperId);

        paperDetail.setId(new UUIDGeneratorUtils().uuid32());
        paperDetail.setQuestionId(id);
        Map<String,String> map=new HashMap<>();

        if (0==paperDetailService.save(paperDetail)){
            map.put("msg","failed");
        }
        else {
            map.put("msg","success");
        }

        return map;
    }

    /**
     * 添加简答题到题库
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param id
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/addShortAnswerQuestion",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addShortAnswerQuestion(@PathVariable String courseId,@PathVariable String paperId,
                                                  HttpSession httpSession,String id){

        User user=(User)httpSession.getAttribute("USER");
        PaperDetail paperDetail=new PaperDetail();
        paperDetail.setType(5);
        paperDetail.setPaperId(paperId);

        paperDetail.setId(new UUIDGeneratorUtils().uuid32());
        paperDetail.setQuestionId(id);
        Map<String,String> map=new HashMap<>();

        if (0==paperDetailService.save(paperDetail)){
            map.put("msg","failed");
        }
        else {
            map.put("msg","success");
        }

        return map;
    }


    /**
     * 无答案试卷预览
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/preview",method = RequestMethod.GET)
    public String preview(@PathVariable String courseId,@PathVariable String paperId,
                                HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        map.put("paperName",paperService.getOne(paperId).getName());
        map.put("singleQuestions", paperDetailService.listSingleQuestion(paperId));
        map.put("tfQuestions", paperDetailService.listTfQuestion(paperId));
        map.put("multipleQuestions", paperDetailService.listMultipleQuestion(paperId));
        map.put("completeQuestions", paperDetailService.listCompleteQuestion(paperId));
        map.put("shortAnswerQuestions", paperDetailService.listShortAnswerQuestion(paperId));
        return "teacher/paper/preview";
    }

    /**
     * 有答案的试卷预览
     * @param courseId
     * @param paperId
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "{courseId}/paper/{paperId}/previewAnswer",method = RequestMethod.GET)
    public String preview2(@PathVariable String courseId,@PathVariable String paperId,
                          HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        map.put("paperName",paperService.getOne(paperId).getName());
        map.put("singleQuestions",paperDetailService.listSingleQuestion(paperId));
        map.put("tfQuestions",paperDetailService.listTfQuestion(paperId));
        map.put("multipleQuestions",paperDetailService.listMultipleQuestion(paperId));
        map.put("completeQuestions", paperDetailService.listCompleteQuestion(paperId));
        map.put("shortAnswerQuestions", paperDetailService.listShortAnswerQuestion(paperId));
        return "teacher/paper/previewAnswer";
    }
}
