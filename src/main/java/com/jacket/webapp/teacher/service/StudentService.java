package com.jacket.webapp.teacher.service;

import com.jacket.webapp.teacher.repository.StudentRepository;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/8.
 */
@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;
    public List<User> listStudentByCourseIdAndTeacherId(String courseId,String teacherId){
        return studentRepository.listStudentByCourseIdAndTeacherId(courseId, teacherId);
    }
}
