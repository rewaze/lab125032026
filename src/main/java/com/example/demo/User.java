package com.example.demo;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "user_profile") // Связываем с твоей таблицей в БД
public class User {

    @Id
    @Column(name = "user_profile_id")
    private String userProfileId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "created_at")
    private OffsetDateTime createdAt;

    public User() {}

    // Геттеры и сеттеры
    public String getUserProfileId() { return userProfileId; }
    public void setUserProfileId(String userProfileId) { this.userProfileId = userProfileId; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public OffsetDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(OffsetDateTime createdAt) { this.createdAt = createdAt; }
}