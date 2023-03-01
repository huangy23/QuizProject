package www.example.examapp.service;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Feedback;

public interface FeedbackService {


    PageInfo<Feedback> allUser(String userName, Integer pageNum, Integer pageSize);

}
