package www.example.examapp.web;

import com.github.pagehelper.PageInfo;
import www.example.examapp.model.Question;
import www.example.examapp.repository.SubjectRepository;
import www.example.examapp.service.SubjectService;
import www.example.examapp.validator.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SubjectController {

    @Autowired
    private SubjectRepository subjectRepository;
@Autowired
private SubjectService service;

    @RequestMapping("/subject")
    public String subjectList(){
        return "subject";
    }

    @RequestMapping("/admin/subject")
    @ResponseBody
    public Message users(@RequestParam(required = false) String userName, @RequestParam("pn")Integer pageNum){
        Integer pageSize = 4;
        PageInfo<Question> users = service.allUser(userName,1,pageSize);
        return Message.success().add("pageInfo",users);
    }
    @RequestMapping("subject/findById")
    @ResponseBody
    public Message findById(Integer id){
        Question byId = service.findById(id);

        return Message.success().add("user",byId);
    }


    @RequestMapping("/subject/create")
    @ResponseBody
    public Message add(Question user){
        int add = service.add(user);
        if(add>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }



    @RequestMapping("/subject/delete")
    @ResponseBody
    public Message del(Integer id){
        int del = service.del(id);
        if(del>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/subjectupdate")
    @ResponseBody
    public Message updatePic(Question s ){

        System.out.println("s   "+s);

        Integer update = service.updates(s);
        if (update > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }
}
