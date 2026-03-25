package com.example.demo;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FlightService {
    private final FlightRepository flightRepository;

    public FlightService(FlightRepository flightRepository) {
        this.flightRepository = flightRepository;
    }

    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

    public List<Flight> getFlightsByNumber(String flightNumber) {
        return flightRepository.findAll().stream()
                .filter(f -> f.getFlightNumber().equals(flightNumber))
                .toList();
    }

    public Flight createFlight(Flight flight) {
        return flightRepository.save(flight);
    }
}