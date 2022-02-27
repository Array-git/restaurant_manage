package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.Service.UserService;
import com.training.restaurant.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;
    @Autowired
    private DeskRepository deskRepository;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model){
        if(!userService.adduser(user)){
            model.addAttribute("message", "Пользователь существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/")
    public String getStart() {return "start";}

    @RequestMapping("/desk")
    public String getDesk(Model model){
        model.addAttribute("desks", deskRepository.findAll());
        return "desk";
    }
}
