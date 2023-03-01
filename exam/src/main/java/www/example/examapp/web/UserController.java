package www.example.examapp.web;


import com.github.pagehelper.PageInfo;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import www.example.examapp.model.Admin;
import www.example.examapp.model.Exam;
import www.example.examapp.repository.ExamRepository;
import www.example.examapp.service.AdminService;
import www.example.examapp.validator.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import www.example.examapp.model.User;
import www.example.examapp.service.UserService;
import www.example.examapp.validator.UserValidator;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ExamRepository examRepository;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        List<Exam> all = examRepository.findAll();
        model.addAttribute("list", all);

        return "welcome";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        String pwd = userForm.getPassword();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        userForm.setPassword(encoder.encode(pwd));
        userService.add(userForm);

        return "redirect:/welcome";
    }

    @RequestMapping("/user/findById")
    @ResponseBody
    public Message findById(Long id) {
        User byId = userService.findById(id);
        return Message.success().add("user", byId);
    }

    @RequestMapping("/user/delete")
    @ResponseBody
    public Message del(Integer id) {
        userService.del(id);

        return Message.success();

    }

    @RequestMapping("/user/update")
    @ResponseBody
    public Message update(User admins) {
        System.out.println("admin     " + admins);
        userService.update(admins);

        return Message.success();

    }

    @PostMapping("/user/new")
    @ResponseBody
    public Message createUser(@RequestParam String username, @RequestParam String password) {
        User user = new User();
        user.setPassword(username);
        user.setPassword(password);
        userService.add(user);
        return Message.success();

    }

    @RequestMapping("/user/create")
    @ResponseBody
    public Message add(User admins, MultipartFile file) {

        userService.add(admins);

        return Message.success();

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/exam"}, method = RequestMethod.GET)
    public String exam(Model model) {
        return "exam";
    }

    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        return "contact";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String doLogin(HttpSession session, String name, String password) {
        // System.out.println(1111);
        Admin login = adminService.login(name, password);
        System.out.println("1++++++++++++++++++++++++++++++++++++++++++1");
        System.out.println("222" + login);
        if (login == null) {
            session.setAttribute("msg", "wrong password username！");
            return "adminlogin";
        }
        session.setAttribute("admin", login);
        return "user";
    }


    @GetMapping("/user")
    @ResponseBody
    public Message user(@RequestParam(required = false) String userName) {
        PageInfo<User> users = userService.allUser(userName, 1, 100);
        return Message.success().add("pageInfo", users);
    }

    @RequestMapping("/users")
    @ResponseBody
    public Message users(@RequestParam(required = false) String userName, @RequestParam("pn") Integer pageNum) {
        Integer pageSize = 4;
        PageInfo<User> users = userService.allUser(userName, pageNum, pageSize);
        return Message.success().add("pageInfo", users);
    }

    @RequestMapping("/adminlogin")
    public String login() {
        return "adminlogin";
    }

    @RequestMapping("/adminuser")
    public String admin() {
        return "user";
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Message logout(HttpSession session) {
        session.invalidate();
        return Message.success();
    }

}
