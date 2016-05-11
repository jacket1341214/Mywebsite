package com.jacket.webapp.student.entity;

import java.util.Date;

/**
 * Created by jacket on 2016/4/9.
 */
public class ViewGrade {
    private String id;
    private String username;
    private String name;
    private int score;
    private Date completeTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    @Override
    public String toString() {
        return "ViewGrade{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", score=" + score +
                ", completeTime=" + completeTime +
                '}';
    }
}
