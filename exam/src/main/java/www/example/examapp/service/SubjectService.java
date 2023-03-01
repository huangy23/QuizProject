package www.example.examapp.service;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Question;

import java.util.List;

public interface SubjectService {

      void insert(Question S);
      void del(int id);
      Question update(Question S);
      List<Question> selectAll();




      int add(Question user);
      //修改
      Integer updates(Question user);
      Question findById(Integer id);
      int del(Integer id);
      PageInfo<Question> allUser(String userName, Integer pageNum, Integer pageSize);

}
