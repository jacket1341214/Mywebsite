package com.jacket.webapp.student.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.student.entity.Grade;
import com.jacket.webapp.student.entity.ViewGrade;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jacket on 2016/4/4.
 */
@Repository
public interface GradeRepository extends Mapper<Grade> {
    public List<ViewGrade> viewGrade(String teacherId, String courseId, String paperId);

}
