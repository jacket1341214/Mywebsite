package com.jacket.webapp.student.entity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by jacket on 2016/4/5.
 */
@Table(name = "t_error_tf_question")
public class ErrorTfQuestion extends ErrorQuestion{
    @Id
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
