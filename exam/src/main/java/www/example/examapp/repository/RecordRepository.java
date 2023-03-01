package www.example.examapp.repository;

import www.example.examapp.model.Record;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RecordRepository extends JpaRepository<Record, Integer> {
    List<Record> findByExamid(int id);

}
