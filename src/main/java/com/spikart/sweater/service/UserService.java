package com.spikart.sweater.service;

import com.spikart.sweater.domain.User;
import com.spikart.sweater.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User userDetails = userRepository.findByUsername(userName);
        if (userDetails == null) {
           throw new UsernameNotFoundException("The user is not found!");
        }
        return userRepository.findByUsername(userName);
    }
}
