package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.Course;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/3/23.
 */
@Service
public class CourseService extends BaseService<Course>{
    public List<Course> viewCourse(String userId){
        Example example=new Example(Course.class);
        example.createCriteria().andEqualTo("userId", userId);
        return mapper.selectByExample(example);

    }
    public Course findById(String id,String userId){
        Example example=new Example(Course.class);
        example.createCriteria().andEqualTo("userId", userId).andEqualTo("id",id);
        List<Course> course=mapper.selectByExample(example);
        Course course1=null;
        if(1==course.size())
            course1=course.get(0);
        return course1;
    }
    public int updateCourse(Course course){
        Example example=new Example(Course.class);
        example.createCriteria().andEqualTo("id", course.getId());
        return mapper.updateByExample(course,example);
    }
    public List<Course> findCourseByUserId(String userId){
        Example example=new Example(Course.class);
        example.createCriteria().andEqualTo("userId", userId);
        return mapper.selectByExample(example);
    }
}
