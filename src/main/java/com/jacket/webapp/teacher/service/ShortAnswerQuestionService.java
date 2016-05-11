package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.ShortAnswerQuestion;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/28.
 */
@Service
public class ShortAnswerQuestionService extends BaseService<ShortAnswerQuestion>{
    public List<ShortAnswerQuestion> listShortAnswerQuestion(String userId,String courseId,
                                                             String bankId){
        Example example=new Example(ShortAnswerQuestion.class);
        example.createCriteria().andEqualTo("bankId",bankId).andEqualTo("courseId",courseId)
                .andEqualTo("userId",userId);
        return mapper.selectByExample(example);
    }
    public List<ShortAnswerQuestion> listShortAnswerQuestionByBankId(String userId,
                                                             String bankId){
        Example example=new Example(ShortAnswerQuestion.class);
        example.createCriteria().andEqualTo("bankId",bankId).andEqualTo("userId",userId);
        return mapper.selectByExample(example);
    }
}
