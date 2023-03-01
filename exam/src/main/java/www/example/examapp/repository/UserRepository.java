package www.example.examapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import www.example.examapp.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    // User findById(Long id);
}
