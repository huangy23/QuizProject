package www.example.examapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import www.example.examapp.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
