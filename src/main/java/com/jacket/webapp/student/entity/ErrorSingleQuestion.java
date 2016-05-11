package com.jacket.webapp.student.entity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by jacket on 2016/4/5.
 */
@Table(name = "t_error_single_question")
public class ErrorSingleQuestion extends ErrorQuestion {
    @Id
    private String id;
    private String a;
    private String b;
    private String c;
    private String d;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }
}
