package com.onlineshop.controller;

import com.onlineshop.model.User;
import com.onlineshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;
    
    @GetMapping("/registration")
    public String showRegistrationForm(Model model) {
        model.addAttribute("userForm",
                           new User()
                          );
        return "registration";
    }
    
    @PostMapping("/registration")
    public String registerUserAccount(@ModelAttribute("userForm") @Valid User userForm, Model model,
                                      BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        if (!userService.save(userForm)) {
            model.addAttribute("usernameError",
                               "Пользователь с таким именем уже существует"
                              );
            return "registration";
        }
        
        return "redirect:/";
    }
}
