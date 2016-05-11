package com.jacket.webapp.student.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.student.entity.ErrorQuestion;
import com.jacket.webapp.student.entity.ErrorSingleQuestion;
import com.jacket.webapp.student.entity.ErrorTfQuestion;
import com.jacket.webapp.student.repository.ErrorQuestionRepository;
import com.jacket.webapp.teacher.entity.Course;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/5.
 */
@Service
public class ErrorQuestionService extends BaseService<ErrorQuestion>{
    @Autowired
    private ErrorQuestionRepository errorQuestionRepository;
    public List<Course> listCourseByUserId(String userId){
        return errorQuestionRepository.listCourseByUserId(userId);
    }

}
