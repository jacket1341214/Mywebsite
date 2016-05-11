package com.jacket.webapp.teacher.entity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by jacket on 2016/4/28.
 */
@Table(name="t_multiple_question")
public class MultipleQuestion extends BaseQuestion {
    @Id
    private String id;
    private String answer;
    private String A;
    private String B;
    private String C;
    private String D;
    private String E;
    private String F;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAnswer() {
        return this.answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getA() {
        return A;
    }

    public void setA(String a) {
        A = a;
    }

    public String getB() {
        return B;
    }

    public void setB(String b) {
        B = b;
    }

    public String getC() {
        return C;
    }

    public void setC(String c) {
        C = c;
    }

    public String getD() {
        return D;
    }

    public void setD(String d) {
        D = d;
    }

    public String getF() {
        return F;
    }

    public void setF(String f) {
        F = f;
    }

    public String getE() {
        return E;
    }

    public void setE(String e) {
        E = e;
    }
}
