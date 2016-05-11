package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.SingleQuestion;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/3/30.
 */
@Service
public class SingleQuestionService extends BaseService<SingleQuestion> {
    public List<SingleQuestion> listSingleQuestion(String userId,String courseId,
                                                   String bankId){
        Example example=new Example(SingleQuestion.class);
        example.createCriteria().andEqualTo("bankId",bankId).andEqualTo("courseId",courseId)
                .andEqualTo("userId",userId);
        return mapper.selectByExample(example);

    }
    public List<SingleQuestion> listSingleQuestionByBankId(String bankId,String userId){
        Example example=new Example(SingleQuestion.class);
        example.createCriteria().andEqualTo("bankId",bankId).andEqualTo("userId", userId);
        return mapper.selectByExample(example);
    }
    public List<SingleQuestion> listSingleQuestion(String userId,String courseId,
                                                   String bankId,int score,int count){
        Example example=new Example(SingleQuestion.class);
        example.setOrderByClause("rand() limit "+count);
        example.createCriteria().andEqualTo("bankId", bankId).andEqualTo("courseId",courseId)
                .andEqualTo("userId", userId).andEqualTo("score",score);
        return mapper.selectByExample(example);

    }
}
