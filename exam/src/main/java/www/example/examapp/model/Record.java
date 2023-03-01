package www.example.examapp.model;

import javax.persistence.*;

@Entity
@Table(name = "record")
public class Record {

    private int id;
    private int subjectid;//question ID
    private String userchoice;  //user answer
    private int examid;//which exam

    public Record() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(int subjectid) {
        this.subjectid = subjectid;
    }

    public String getUserchoice() {
        return userchoice;
    }

    public void setUserchoice(String userchoice) {
        this.userchoice = userchoice;
    }

    public int getExamid() {
        return examid;
    }

    public void setExamid(int examid) {
        this.examid = examid;
    }

    public Record(int subjectid, String userchoice, int examid) {
        this.subjectid = subjectid;
        this.userchoice = userchoice;
        this.examid = examid;
    }
}
