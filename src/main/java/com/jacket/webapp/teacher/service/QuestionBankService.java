package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.QuestionBank;
import com.jacket.webapp.teacher.entity.SingleQuestion;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/3/26.
 */
@Service
public class QuestionBankService extends BaseService<QuestionBank>{
    public List<QuestionBank> listQuestionBank(String courseId,String userId){
        Example example=new Example(QuestionBank.class);
        example.setOrderByClause("create_time desc");
        example.createCriteria().andEqualTo("courseId",courseId).andEqualTo("userId",userId);
        return mapper.selectByExample(example);
    }

}
