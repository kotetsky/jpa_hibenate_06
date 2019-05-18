package com.spikart.sweater.repository;

import com.spikart.sweater.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername (String username);

}
