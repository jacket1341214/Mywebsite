package com.jacket.webapp.student.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.student.entity.ErrorQuestion;
import com.jacket.webapp.student.entity.ErrorSingleQuestion;
import com.jacket.webapp.teacher.entity.Course;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jacket on 2016/4/5.
 */
@Repository
public interface ErrorQuestionRepository extends Mapper<ErrorQuestion>{
    public List<Course> listCourseByUserId(String userId);
}
