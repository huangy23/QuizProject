package www.example.examapp.service;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.User;

import java.util.List;

public interface UserService {
    // void save(User user);
    // void insert(User S);
    // void del(int id);
    // User update(User S);
    List<User> selectAll();
    User findByUsername(String username);
    PageInfo<User> allUser(String userName, Integer pageNum, Integer pageSize);

    void add(User user);
    //修改
    void update(User user);
    User findById(Long id);
    void del(Integer id);
}
