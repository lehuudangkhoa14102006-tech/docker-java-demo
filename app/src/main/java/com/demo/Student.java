package com.demo;

public class Student {
    private int id;
    private String fullName;
    private String email;
    private String major;

    public Student(int id, String fullName, String email, String major) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.major = major;
    }

    public int getId() { return id; }
    public String getFullName() { return fullName; }
    public String getEmail() { return email; }
    public String getMajor() { return major; }
}