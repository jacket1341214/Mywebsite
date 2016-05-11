package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.*;
import com.jacket.webapp.teacher.repository.PaperDetailRepository;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/4.
 */
@Service
public class PaperDetailService extends BaseService<PaperDetail>{
    @Autowired
    private PaperDetailRepository paperDetailRepository;
    public List<SingleQuestion> listSingleQuestion(String paperId){
        return paperDetailRepository.listSingleQuestion(paperId);
    }
    public List<TfQuestion> listTfQuestion(String paperId){
        return paperDetailRepository.listTfQuestion(paperId);
    }
    public List<MultipleQuestion> listMultipleQuestion(String paperId){
        return paperDetailRepository.listMultipleQuestion(paperId);
    }
    public List<CompleteQuestion> listCompleteQuestion(String paperId){
        return paperDetailRepository.listCompleteQuestion(paperId);
    }
    public List<ShortAnswerQuestion> listShortAnswerQuestion(String paperId){
        return paperDetailRepository.listShortAnswerQuestion(paperId);
    }
    public int deleteQuestionByPaperIdQuestionId(String paperId,String questionId){
        Example example=new Example(PaperDetail.class);
        example.createCriteria().andEqualTo("paperId",paperId).andEqualTo("questionId",questionId);
        return mapper.deleteByExample(example);
    }


}
