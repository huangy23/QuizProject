package www.example.examapp.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Feedback;
import www.example.examapp.repository.FeedbackRepository;
import www.example.examapp.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackRepository feedbackService;
    @Override
    public PageInfo<Feedback> allUser(String userName , Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Feedback> list = feedbackService.findAll();
        PageInfo<Feedback> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

}
