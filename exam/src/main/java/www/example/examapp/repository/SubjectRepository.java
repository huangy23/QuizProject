package www.example.examapp.repository;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SubjectRepository extends JpaRepository<Question, Integer>{
    public List<Question> findByType(String type);
        PageInfo<Question> findAllBy();



}
