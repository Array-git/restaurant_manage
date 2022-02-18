package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.entity.Desk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
//@RequestMapping(path = "/start")
public class DeskController {
    @Autowired
    private DeskRepository deskRepository;

    @GetMapping("/")
    public String getStart(){
        return "start";
    }

    @RequestMapping("/desk")
    public String getDesk(Model model){
        //List<Desk> allDesk = (List<Desk>) deskRepository.findAll();
        model.addAttribute("desks", deskRepository.findAll());
        return "desk";
    }

    @RequestMapping("/managedesk")
    public String addDesk(Model model){
        model.addAttribute("newDesk",new Desk());
        model.addAttribute("desks", deskRepository.findAll());
        return "managedesk";
    }

    @RequestMapping("/newdesk")
    public String addDesks(@ModelAttribute("newdesk") Desk desk){
        deskRepository.save(desk);
        return "redirect:managedesk";
    }

    @RequestMapping("/updateDesk")
    public String updateDesk(@RequestParam("deskId") int id, Model model){
        Desk desk = deskRepository.findById(id).get();
        model.addAttribute("desk", desk);
        return "editdesk";
    }

    @RequestMapping("/deleteDesk")
    public String deleteDesk(@RequestParam("deskId") int id, Model model){
        Desk desk = deskRepository.findById(id).get();
        deskRepository.delete(desk);
        return "redirect:managedesk";
    }
}
