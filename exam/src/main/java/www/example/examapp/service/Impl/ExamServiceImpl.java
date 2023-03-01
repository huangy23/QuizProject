package www.example.examapp.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Exam;
import www.example.examapp.model.Question;
import www.example.examapp.model.User;
import www.example.examapp.repository.ExamRepository;
import www.example.examapp.repository.SubjectRepository;
import www.example.examapp.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
    private ExamRepository examRepository;
    @Autowired
    private SubjectRepository subjectRepository;

    List<Question> questionPageInfo;

    public List<Question> getSubjectPageInfo() {
        return questionPageInfo;
    }

    public void setSubjectPageInfo(List<Question> questionPageInfo) {
        this.questionPageInfo = questionPageInfo;
    }

    @Override
    public void save(Exam exam) {

    }

    @Override
    public User findByUsername(String username) {
        return null;
    }

    @Override
    public List<Exam> selectAll() {
        List<Exam> all = examRepository.findAll();

        return all;
    }

    @Override
    public List<Question> selectSubjectAll() {
        List<Question> all = subjectRepository.findAll();
        return all;
    }

    //返回5题
    @Override
    public List<Question> queryMathPage() {


        List<Question> allByType = subjectRepository.findByType("math");
        // List<Subject> allByType = subjectRepository.findAll();

        List<Question> s = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            s.add(allByType.get((int) (Math.random() * allByType.size())));
        }


        setSubjectPageInfo(s);
        return questionPageInfo;
    }

    @Override
    public List<Question> queryPhysicsPage() {
        List<Question> allByType = subjectRepository.findByType("physics");
        // List<Subject> allByType = subjectRepository.findAll();

        List<Question> s = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            s.add(allByType.get((int) (Math.random() * allByType.size())));
        }


        setSubjectPageInfo(s);
        return questionPageInfo;
    }

    @Override
    public List<Question> queryChemicalPage() {
        List<Question> allByType = subjectRepository.findByType("chemistry");
        // List<Subject> allByType = subjectRepository.findAll();

        List<Question> s = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            s.add(allByType.get((int) (Math.random() * allByType.size())));
        }


        setSubjectPageInfo(s);
        return questionPageInfo;
    }

    @Override
    public PageInfo<Exam> allUser(String userName ,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Exam> list = examRepository.findAll();
        PageInfo<Exam> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }


}
