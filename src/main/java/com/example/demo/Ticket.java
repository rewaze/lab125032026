package com.example.demo;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "ticket")
public class Ticket {

    @Id
    @Column(name = "ticket_id")
    private String ticketId;

    @Column(name = "flight_id")
    private String flightId;

    @Column(name = "user_profile_id")
    private String userProfileId;

    @Column(name = "pnr")
    private String pnr;

    @Column(name = "created_at")
    private OffsetDateTime createdAt;

    public Ticket() {}

    public String getTicketId() { return ticketId; }
    public void setTicketId(String ticketId) { this.ticketId = ticketId; }

    public String getFlightId() { return flightId; }
    public void setFlightId(String flightId) { this.flightId = flightId; }

    public String getUserProfileId() { return userProfileId; }
    public void setUserProfileId(String userProfileId) { this.userProfileId = userProfileId; }

    public String getPnr() { return pnr; }
    public void setPnr(String pnr) { this.pnr = pnr; }

    public OffsetDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(OffsetDateTime createdAt) { this.createdAt = createdAt; }
}