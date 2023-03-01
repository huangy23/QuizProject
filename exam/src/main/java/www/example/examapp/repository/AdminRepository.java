package www.example.examapp.repository;

import www.example.examapp.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin, Integer>{

    Admin findByName(String name);
}
