package com.jacket.webapp.student.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.student.entity.Grade;
import com.jacket.webapp.student.entity.ViewGrade;
import com.jacket.webapp.student.repository.GradeRepository;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/4.
 */
@Service
public class GradeService extends BaseService<Grade>{
    @Autowired
    private GradeRepository gradeRepository;
    public List<Grade> findByUserIdAndCourseId(String userId,String courseId){
        Example example=new Example(Grade.class);
        example.createCriteria().andEqualTo("studentId",userId).andEqualTo("courseId",courseId);
        return mapper.selectByExample(example);
    }
    public List<ViewGrade> findByTeacherIdAndCourseIdAndPaperId(String teacherId,
                                                            String courseId, String paperId){

        return gradeRepository.viewGrade(teacherId,courseId,paperId);
    }
}
