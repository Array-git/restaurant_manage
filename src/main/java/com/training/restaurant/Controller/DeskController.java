package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.entity.Desk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
//@RequestMapping(path = "/start")
public class DeskController {
    @Autowired
    private DeskRepository deskRepository;

    @GetMapping("/")
    public String getStart(Model model){
        Iterable<Desk> allDesk = deskRepository.findAll();
        model.addAttribute("text", "POGRALI!");
        return "start";
    }
}
