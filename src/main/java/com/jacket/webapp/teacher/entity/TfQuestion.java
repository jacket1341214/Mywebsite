package com.jacket.webapp.teacher.entity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by jacket on 2016/3/27.
 */
@Table(name = "t_tf_question")
public class TfQuestion extends BaseQuestion{
    @Id
    private String id;
    private int answer;

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
