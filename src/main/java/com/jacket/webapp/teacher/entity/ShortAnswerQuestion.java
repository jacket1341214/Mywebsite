package com.jacket.webapp.teacher.entity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by jacket on 2016/4/28.
 */
@Table(name = "t_shortanswer_question")
public class ShortAnswerQuestion extends BaseQuestion{
    @Id
    private String id;
    private String answer;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
