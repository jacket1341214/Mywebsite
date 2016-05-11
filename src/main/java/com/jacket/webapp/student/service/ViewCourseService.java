package com.jacket.webapp.student.service;

import com.jacket.webapp.student.entity.ViewCourse;
import com.jacket.webapp.student.repository.ViewCourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/3/31.
 */
@Service
public class ViewCourseService {
    @Autowired
    private ViewCourseRepository viewCourseRepository;
    public List<ViewCourse> queryAll(){
        return viewCourseRepository.queryAll();
    }
    public List<ViewCourse> findCourseByUserId(String userId){
        return viewCourseRepository.findCourseByUserId(userId);
    }
    public List<ViewCourse> findCourseByUserId2(String userId){
        return viewCourseRepository.findCourseByUserId2(userId);
    }
}
