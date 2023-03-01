package www.example.examapp.repository;

import www.example.examapp.model.Exam;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamRepository extends JpaRepository<Exam, Integer>{
    Exam findByRecordid(int id);
    List<Exam> findByUsername(String username);
}
