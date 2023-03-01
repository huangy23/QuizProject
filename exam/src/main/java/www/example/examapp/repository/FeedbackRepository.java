package www.example.examapp.repository;

import www.example.examapp.model.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer>{


}
