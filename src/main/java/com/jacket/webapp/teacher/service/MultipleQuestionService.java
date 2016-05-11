package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.MultipleQuestion;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/28.
 */
@Service
public class MultipleQuestionService extends BaseService<MultipleQuestion>{
    public List<MultipleQuestion> listMultipleQuestion(String userId,String courseId,
                                                       String bankId){
        Example example=new Example(MultipleQuestion.class);
        example.createCriteria().andEqualTo("bankId",bankId).andEqualTo("courseId",courseId)
                .andEqualTo("userId",userId);
        return mapper.selectByExample(example);
    }
    public List<MultipleQuestion> listMultipleQuestionByBankId(String userId,
                                                       String bankId){
        Example example=new Example(MultipleQuestion.class);
        example.createCriteria().andEqualTo("bankId",bankId).andEqualTo("userId",userId);
        return mapper.selectByExample(example);
    }
}
