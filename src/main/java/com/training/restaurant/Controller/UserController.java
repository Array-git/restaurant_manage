package com.training.restaurant.Controller;

import com.training.restaurant.Service.Role;
import com.training.restaurant.Service.UserService;
import com.training.restaurant.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasRole('ADMIN')")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    public String userList(Model model){
        model.addAttribute("users", userService.findAll());
        return "userlist";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "useredit";
    }

    @PostMapping("/update")
    public String userSave(@RequestParam("userId") User user, @RequestParam Map<String, String> form, @RequestParam String username){
        userService.saveUser(user, username, form);
        return "redirect:/user";
    }

    @RequestMapping("/delete")
    public String userDelete(@RequestParam("userDelId") int id){
        userService.deleteUser(id);
        return "redirect:/user";
    }
}
