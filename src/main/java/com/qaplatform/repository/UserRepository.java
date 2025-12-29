package com.qaplatform.repository;

import com.qaplatform.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    // 通过用户名查找用户
    Optional<User> findByUsername(String username);

    // 验证用户
    @Query("SELECT COUNT(u) > 0 FROM User u WHERE u.username = :username AND u.password = :password")
    boolean validateUser(@Param("username") String username, @Param("password") String password);

    // 检查用户名是否存在
    boolean existsByUsername(String username);
}