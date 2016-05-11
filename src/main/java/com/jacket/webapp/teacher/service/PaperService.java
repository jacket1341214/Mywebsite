package com.jacket.webapp.teacher.service;

import com.github.abel533.entity.Example;
import com.jacket.webapp.teacher.entity.Paper;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/4/2.
 */
@Service
public class PaperService extends BaseService<Paper>{
    public List<Paper> listPaperByCourseIdAndUserId(String courseId,String userId){
        Example example=new Example(Paper.class);
        example.createCriteria().andEqualTo("userId",userId).andEqualTo("courseId",courseId);
        return mapper.selectByExample(example);

    }
    public List<Paper> listPaperByCourseId(String courseId){
        Example example=new Example(Paper.class);
        example.createCriteria().andEqualTo("courseId",courseId);
        return mapper.selectByExample(example);

    }
}
