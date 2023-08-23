/**
 * @author: Alessandro Porfírio
 */

public class TaskBuilder {
    
    Task task;

    public TaskBuilder() {
        this.task = new Task();
    }

    public TaskBuilder withWhatId(String whatId) {
        this.task.WhatId = whatId;
        return this;
    }

    public TaskBuilder withStatus(String status) {
        this.task.Status = status;
        return this;
    }

    public TaskBuilder withPriority(String priority) {
        this.task.Priority = priority;
        return this;
    }

    public TaskBuilder withSubject(String subject) {
        this.task.Subject = subject;
        return this;
    }

    public Task build() {
        return this.task;
    }

}