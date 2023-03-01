package www.example.examapp.service;

import www.example.examapp.model.Admin;

public interface AdminService {

    Admin login(String name, String password);
}
