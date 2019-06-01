package com.spikart.sweater.controller;

import com.spikart.sweater.domain.Role;
import com.spikart.sweater.domain.User;
import com.spikart.sweater.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping
    public String userList(Model model) {
        List<User> users = userRepository.findAll();
        System.out.println("user size = " + users.size());
        model.addAttribute("users", users);
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        System.out.println("user = " + user.getId() + " name = " + user.getUsername() + " roleSize = " + user.getRoles().size());
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam("userId") User user,
            @RequestParam Map<String, String> form,
            @RequestParam String username
    ) {
        System.out.println("userSave");
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            System.out.println("the key = " + key);
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
        return "redirect:/user";
    }
}
