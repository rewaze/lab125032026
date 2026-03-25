package com.example.demo;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/flights")
public class FlightController {
    private final FlightService flightService;

    public FlightController(FlightService flightService) {
        this.flightService = flightService;
    }

    @GetMapping
    public List<Flight> getAllFlights() {
        return flightService.getAllFlights();
    }

    @GetMapping("/number/{flightNumber}")
    public List<Flight> getFlightsByNumber(@PathVariable String flightNumber) {
        return flightService.getFlightsByNumber(flightNumber);
    }

    @PostMapping
    public ResponseEntity<Flight> createFlight(@RequestBody Flight flight) {
        Flight savedFlight = flightService.createFlight(flight);
        return new ResponseEntity<>(savedFlight, HttpStatus.CREATED);
    }
}