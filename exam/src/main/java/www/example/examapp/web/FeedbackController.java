package www.example.examapp.web;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Feedback;
import www.example.examapp.repository.FeedbackRepository;
import www.example.examapp.service.FeedbackService;
import www.example.examapp.validator.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;
    @Autowired
    private FeedbackRepository feedbackRepository;
    @RequestMapping(value = { "/adminfeedback"}, method = RequestMethod.GET)
    public String adminfeedback(Model model) {
        return "adminfeedback";
    }

    @RequestMapping(value = { "/feedback"}, method = RequestMethod.GET)
    public String feed(Model model) {
        return "feedback";
    }


    @RequestMapping("/addfeedback")

    public String add(int score,String text){
        Feedback d=new Feedback(text,score);
        feedbackRepository.save(d);
        return "feedback";
    }

    @RequestMapping("/admin/feedback")
    @ResponseBody
    public Message users(@RequestParam(required = false) String userName, @RequestParam("pn")Integer pageNum){
        Integer pageSize = 4;
        PageInfo<Feedback> users = feedbackService.allUser(userName,pageNum,pageSize);
        return Message.success().add("pageInfo",users);
    }
}
