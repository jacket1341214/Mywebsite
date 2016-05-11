package com.jacket.webapp.teacher.repository;

import com.jacket.webapp.user.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jacket on 2016/4/8.
 */
@Repository
public interface StudentRepository {
    public List<User> listStudentByCourseIdAndTeacherId(String courseId,String teacherId);
}
