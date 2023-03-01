package www.example.examapp.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Question;
import www.example.examapp.repository.SubjectRepository;
import www.example.examapp.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectRepository subjectRepository;


    @Override
    public void insert(Question S) {
        subjectRepository.save(S);
    }

    @Override
    public void del(int id) {
        subjectRepository.deleteById(id);
    }

    @Override
    public Question update(Question S) {

        Question save = subjectRepository.save(S);
        return save;
    }

    @Override
    public List<Question> selectAll() {
        List<Question> all = subjectRepository.findAll();

        return all;
    }
    //

    @Override
    public Integer updates(Question user) {
        Question save = subjectRepository.save(user);
        if(save!=null){
        return 1;
        }else return 0;
    }

    @Override
    public PageInfo<Question> allUser(String userName , Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Question> list = subjectRepository.findAll();
        PageInfo<Question> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(Question user) {
        Question save = subjectRepository.save(user);
        if(save!=null){
            return 1;
        }else return 0;
    }

    @Override
    public int del(Integer id) {
          subjectRepository.deleteById(id);

            return 1;

    }




    @Override
    public Question findById(Integer id) {
        Optional<Question> byId = subjectRepository.findById(id);
        return byId.get();
    }



}
