package com.spikart.sweater.service;

import com.spikart.sweater.domain.Role;
import com.spikart.sweater.domain.User;
import com.spikart.sweater.repository.UserRepository;
import freemarker.template.utility.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User userDetails = userRepository.findByUsername(userName);
        if (userDetails == null) {
            throw new UsernameNotFoundException("The user is not found!");
        }
        return userRepository.findByUsername(userName);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepository.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format("Hello ! %s ! \n Welcome to Sweater. Here is your activation code.\n"
                    + "Please visit the http://localhost:8080/activate/%s",
                    user.getUsername(), user.getActivationCode());
            mailSender.sendMail(user.getEmail(), "Activation Code", message);
        }
        userRepository.save(user);

        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if(user == null) {
            return false;
        }
        user.setActivationCode(null);
        userRepository.save(user);

        return false;
    }
}
