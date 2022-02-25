package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.Repository.UserRepository;
import com.training.restaurant.Service.Role;
import com.training.restaurant.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private DeskRepository deskRepository;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model){
        User userFromDB = userRepository.findByUsername(user.getUsername());
        if(userFromDB!=null){
            model.addAttribute("message", "Пользователь существует");
            return "registration";
        }
        user.setActive(true);
        //Админ пока создается в ручную
        user.setRoles(Collections.singleton(Role.ADMIN));
        userRepository.save(user);
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
