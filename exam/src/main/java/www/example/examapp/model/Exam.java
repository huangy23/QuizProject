package www.example.examapp.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "exam")
public class Exam {//exam record

    private int id;
    private String subjectname;
    private String username;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date starttime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date endtime;
    private int recordid;
    private String pass;
    public Exam() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subjectname) {
        this.subjectname = subjectname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public int getRecordid() {
        return recordid;
    }

    public void setRecordid(int recordid) {
        this.recordid = recordid;
    }

    public Exam(String subjectname, String username, Date starttime, Date endtime, int recordid,String pass) {
        this.subjectname = subjectname;
        this.username = username;
        this.starttime = starttime;
        this.endtime = endtime;
        this.recordid = recordid;
        this.pass = pass;
    }
}
