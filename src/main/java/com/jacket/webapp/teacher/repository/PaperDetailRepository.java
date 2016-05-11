package com.jacket.webapp.teacher.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.teacher.entity.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jacket on 2016/4/4.
 */
@Repository
public interface PaperDetailRepository extends Mapper<PaperDetail> {
    public List<SingleQuestion> listSingleQuestion(String paperId);
    public List<TfQuestion> listTfQuestion(String paperId);
    public List<MultipleQuestion> listMultipleQuestion(String paperId);
    public List<CompleteQuestion> listCompleteQuestion(String paperId);
    public List<ShortAnswerQuestion> listShortAnswerQuestion(String paperId);
}
