package www.example.examapp.service.Impl;

import www.example.examapp.model.Admin;
import www.example.examapp.repository.AdminRepository;
import www.example.examapp.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminRepository adminRepository;

	@Override
	public Admin login(String name, String password) {
		Admin a = new Admin();
		a.setName(name);
		System.out.println(name);
		System.out.println(password);
		Admin admin = adminRepository.findByName(a.getName());
		System.out.println("----"+admin);
		if (admin != null && admin.getPassword().equals(password)){
			return admin;
		}
		return null;
	}
}
