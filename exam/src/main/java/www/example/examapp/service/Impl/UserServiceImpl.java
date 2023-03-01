package www.example.examapp.service.Impl;

import java.util.List;
import java.util.Optional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import www.example.examapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import www.example.examapp.model.User;
import www.example.examapp.repository.RoleRepository;
import www.example.examapp.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// @Override
	// public void save(User user) {
	// 	user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	// 	user.setRoles(new HashSet<>(roleRepository.findAll()));
	// 	userRepository.save(user);
	// }
	@Override
	public void add(User S) {
		userRepository.save(S);
	}

	@Override
	public void del(Integer id) {
		userRepository.deleteById(Long.parseLong(String.valueOf(id)));
	}

	@Override
	public void update(User S) {

		User save = userRepository.save(S);
		System.out.println("1111"+save.toString());
	}

	@Override
	public User findById(Long id) {
		Optional<User> byId = userRepository.findById(id);

		return byId.get();
	}

	@Override
	public List<User> selectAll() {
		List<User> all = userRepository.findAll();

		return all;
	}
	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public PageInfo<User> allUser(String userName, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<User> list = userRepository.findAll();
		PageInfo<User> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
}
