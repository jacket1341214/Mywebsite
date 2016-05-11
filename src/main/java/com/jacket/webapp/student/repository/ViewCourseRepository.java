package com.jacket.webapp.student.repository;

import com.jacket.webapp.student.entity.ViewCourse;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jacket on 2016/3/31.
 */
@Repository
public interface ViewCourseRepository {
    public List<ViewCourse> queryAll();
    public List<ViewCourse> findCourseByUserId(String userId);
    public List<ViewCourse> findCourseByUserId2(String userId);
}
