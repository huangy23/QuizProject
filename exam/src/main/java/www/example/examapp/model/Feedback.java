package www.example.examapp.model;

import javax.persistence.*;

@Entity
@Table(name = "feedback")
public class Feedback {//feedback

    private int id;
    private String text;
    private int grade;//rating

    public Feedback() {
    }

    public Feedback(String text, int grade) {
        this.text = text;
        this.grade = grade;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
}
