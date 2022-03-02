package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.entity.Desk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;


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
    public String saveDesks(@Valid @ModelAttribute("desk") Desk desk, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("desks", deskRepository.findAll());
            return "manage";
        }
        deskRepository.save(desk);
        return "redirect:manage";
    }

    @RequestMapping("/editDesk")
    public String editDesk(@RequestParam("deskId") int id, Model model){
        model.addAttribute("desk", deskRepository.findById(id).get());
        return "editdesk";
    }

    @RequestMapping("/updateDesk")
    public String updateDesk(@Valid @ModelAttribute("desk") Desk desk, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("desks", deskRepository.findAll());
            return "editdesk";
        }
        deskRepository.save(desk);
        return "redirect:manage";
    }

    @RequestMapping("/deleteDesk")
    public String deleteDesk(@RequestParam("deskId") int id){
        Desk desk = deskRepository.findById(id).get();
        deskRepository.delete(desk);
        return "redirect:manage";
    }
}
