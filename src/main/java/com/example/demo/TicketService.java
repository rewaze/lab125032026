package com.example.demo;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TicketService {
    private final TicketRepository ticketRepository;

    public TicketService(TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }

    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    public List<Ticket> getTicketsByUserId(String userId) {
        return ticketRepository.findByUserProfileId(userId);
    }

    public Ticket createTicket(Ticket ticket) {
        return ticketRepository.save(ticket);
    }
}