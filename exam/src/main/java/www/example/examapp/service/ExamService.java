package www.example.examapp.service;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Exam;
import www.example.examapp.model.Question;
import www.example.examapp.model.User;

import java.util.List;

public interface ExamService {
    void save(Exam exam);

    User findByUsername(String username);

    List<Exam> selectAll();
    List<Question> selectSubjectAll();
    List<Question> queryMathPage();
    List<Question> queryPhysicsPage();
    List<Question> queryChemicalPage();
    PageInfo<Exam> allUser(String userName, Integer pageNum, Integer pageSize);
}
