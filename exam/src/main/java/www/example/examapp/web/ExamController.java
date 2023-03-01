package www.example.examapp.web;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.*;
import www.example.examapp.repository.ExamRepository;
import www.example.examapp.repository.RecordRepository;
import www.example.examapp.repository.SubjectRepository;
import www.example.examapp.repository.UserRepository;
import www.example.examapp.service.ExamService;
import www.example.examapp.service.Impl.ExamServiceImpl;
import www.example.examapp.validator.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ExamController {
    List<Question> questionPageInfo;
    List<Question> ph;
    List<Question> ch;
    int examid = 3005;
    @Autowired
    private ExamService examService;
    @Autowired
    private ExamServiceImpl examServiceImpl;
    @Autowired
    private SubjectRepository subjectRepository;
    @Autowired
    private RecordRepository recordRepository;
    @Autowired
    private ExamRepository examRepository;

    @Autowired
    private UserRepository userRepository;

    public int getExamid() {
        return examid;
    }

    public void setExamid(int examid) {
        this.examid = examid;
    }

    public List<Question> getPh() {
        return ph;
    }

    public void setPh(List<Question> ph) {
        this.ph = ph;
    }

    public List<Question> getCh() {
        return ch;
    }

    public void setCh(List<Question> ch) {
        this.ch = ch;
    }

    public List<Question> getSubjectPageInfo() {
        return questionPageInfo;
    }

    public void setSubjectPageInfo(List<Question> questionPageInfo) {
        this.questionPageInfo = questionPageInfo;
    }

    public List<Question> ps1() {
        setSubjectPageInfo(examService.queryMathPage());
        return questionPageInfo;
    }

    public List<Question> ps2() {
        setPh(examService.queryPhysicsPage());
        return ph;
    }

    public List<Question> ps3() {
        setCh(examService.queryChemicalPage());
        return ch;
    }

    @RequestMapping(value = {"/mathexam"}, method = RequestMethod.GET)
    public String mathExam(Model model) {
        examid += 1;
        setSubjectPageInfo(examService.queryMathPage());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));

        model.addAttribute("mathExam", getSubjectPageInfo());
        model.addAttribute("start", formatter.format(date).toString());
        model.addAttribute("examid", examid);
        System.out.println(getSubjectPageInfo());
        return "exam";
    }

    @RequestMapping(value = {"/physicsexam"}, method = RequestMethod.GET)
    public String physicsexam(Model model) {
        examid += 1;
        setSubjectPageInfo(examService.queryPhysicsPage());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));

        model.addAttribute("mathExam", getSubjectPageInfo());
        model.addAttribute("start", formatter.format(date).toString());
        model.addAttribute("examid", examid);
        System.out.println(getSubjectPageInfo());
        return "exam";
    }

    @RequestMapping(value = {"/chemistryexam"}, method = RequestMethod.GET)
    public String chemistryexam(Model model) {
        examid += 1;
        setSubjectPageInfo(examService.queryChemicalPage());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));

        model.addAttribute("mathExam", getSubjectPageInfo());
        model.addAttribute("start", formatter.format(date).toString());
        model.addAttribute("examid", examid);
        System.out.println(getSubjectPageInfo());
        return "exam";
    }

    @RequestMapping("/quiz")
    @ResponseBody
    public Message findQuizById(@RequestParam Long id) {

        User user = userRepository.findById(id).get();
        String username = user.getUsername();
        List<Exam> listExam = examRepository.findByUsername(username);
        return Message.success().add("examInfo",listExam);

    }

    @RequestMapping(value = {"/result"}, method = RequestMethod.GET)
    public String result(Model model, @RequestParam int id) {
        int count = 0;
        List<Trans> rtm = new ArrayList();//all questions and choices
        Exam exam = examRepository.findById(id).get();//get current exam
        System.out.println("re   " + exam.getRecordid());
        List<Record> byExamid = recordRepository.findByExamid(exam.getRecordid());//get all questions
        System.out.println("re  re  " + byExamid);
        for (int i = 0; i < byExamid.size(); i++) {
            Question question = subjectRepository.findById(byExamid.get(i).getSubjectid()).get();//each question
            if (byExamid.get(i).getUserchoice().equals(question.getAnswer())) {
                count++;
            }

            Trans trans = new Trans(question.getTitle(), question.getOptionA(), question.getOptionB()
                    , question.getOptionC(), question.getOptionD(), byExamid.get(i).getUserchoice());
            rtm.add(trans);
        }

        model.addAttribute("count", count);
        model.addAttribute("type", exam.getSubjectname());
        model.addAttribute("name", exam.getUsername());
        model.addAttribute("start", exam.getStarttime());
        model.addAttribute("end", exam.getEndtime());
        model.addAttribute("list", rtm);
        return "result";
    }

    @RequestMapping(value = {"submit"}, method = RequestMethod.POST)
    @ResponseBody
    public int submit(@RequestBody String shuzu, @RequestParam String tm
            , @RequestParam String name, @RequestParam String start
            , @RequestParam String examid, @RequestParam String type, Model model) throws ParseException {
        System.out.println(shuzu);
        System.out.println(tm);
        String[] split = shuzu.split("=")[1].split(",");

        List<String> sz = new ArrayList();//answer
        for (int i = 0; i < split.length; i++) {
            sz.add(split[i]);
        }
        System.out.println("list  sz" + sz);
        List<String> t = new ArrayList();//question number
        String[] split1 = tm.split(",");
        for (int i = 0; i < split1.length; i++) {
            t.add(split1[i]);
        }
        System.out.println("question t" + t);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date end = new Date(System.currentTimeMillis());
        System.out.println("end   " + formatter.format(end));//结束时间
        System.out.println("start  " + start);
        System.out.println(examid);
        System.out.println(start);
        System.out.println(name);
        Date parse = formatter.parse(start);
        for (int i = 0; i < t.size(); i++) {
            Record r = new Record(Integer.parseInt(String.valueOf(t.get(i))), (String) sz.get(i), getExamid());
            recordRepository.save(r);
        }

        List<Trans> rtm = new ArrayList();
        int count = 0;
        for (int i = 0; i < t.size(); i++) {
            Question question = subjectRepository.findById(Integer.parseInt((String) t.get(i))).get();
            if (question.getAnswer().equals(sz.get(i))) {
                count++;
            }
            Trans trans = new Trans(question.getTitle(), question.getOptionA(), question.getOptionB()
                    , question.getOptionC(), question.getOptionD(), sz.get(i));
            rtm.add(trans);
        }
        System.out.println("count" + count);
        String pss = "";
        if (count >= 3) {
            pss = "pass";
        } else {
            pss = "fail";
        }

        Exam exam = new Exam(type, name, parse, end, getExamid(), pss);
        examRepository.save(exam);
        System.out.println(exam);


        // System.out.println(rtm);
        // model.addAttribute("count",count);
        // model.addAttribute("type",type);
        // model.addAttribute("name",name);
        // model.addAttribute("start",start);
        // model.addAttribute("end",end.toString());
        // model.addAttribute("list",rtm);
        Exam byRecordid = examRepository.findByRecordid(getExamid());


        return byRecordid.getId();
    }


    @RequestMapping(value = "/gradess", method = RequestMethod.GET)
    @ResponseBody
    public Message grade(@RequestParam(required = false) String userName, @RequestParam(name = "pn", required = false) Integer pageNum) {
        Integer pageSize = 4;
        PageInfo<Exam> users = examService.allUser(userName, 1, pageSize);
        return Message.success().add("pageInfo", users);
    }

    @RequestMapping(value = "/admin/grade", method = RequestMethod.GET)

    public String grades() {
        return "grade";
    }


}
