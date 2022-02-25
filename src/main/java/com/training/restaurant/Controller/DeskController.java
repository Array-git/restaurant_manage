package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.entity.Desk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping(path = "/admin")
public class DeskController {
    @Autowired
    private DeskRepository deskRepository;

    @GetMapping("/manage")
    public String addDesk(Model model){
        model.addAttribute("desk",new Desk());
        model.addAttribute("desks", deskRepository.findAll());
        return "manage";
    }

    @RequestMapping("/saveDesk")
    public String saveDesks(@ModelAttribute("desk") Desk desk){
        System.out.println(desk.getPlaces());
        System.out.println(desk.getDescription());
        deskRepository.save(desk);
        return "redirect:manage";
    }

    @RequestMapping("/updateDesk")
    public String updateDesk(@RequestParam("deskId") int id, Model model){
        Desk desk = deskRepository.findById(id).get();
        model.addAttribute("desk", desk);
        return "editdesk";
    }

    @RequestMapping("/deleteDesk")
    public String deleteDesk(@RequestParam("deskId") int id){
        Desk desk = deskRepository.findById(id).get();
        deskRepository.delete(desk);
        return "redirect:manage";
    }
}
