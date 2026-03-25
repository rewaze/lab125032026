CREATE TABLE city (
                      city_id TEXT PRIMARY KEY,
                      display_name TEXT,
                      created_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE user_profile (
                              user_profile_id TEXT PRIMARY KEY,
                              first_name TEXT,
                              last_name TEXT,
                              username TEXT,
                              password TEXT,
                              created_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE flight (
                        flight_id TEXT PRIMARY KEY,
                        departure_city_id TEXT REFERENCES city(city_id),
                        arrival_city_id TEXT REFERENCES city(city_id),
                        departure_time TIMESTAMP WITH TIME ZONE,
                        arrival_time TIMESTAMP WITH TIME ZONE,
                        flight_number TEXT,
                        price TEXT,
                        created_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE ticket (
                        ticket_id TEXT PRIMARY KEY,
                        flight_id TEXT REFERENCES flight(flight_id),
                        user_profile_id TEXT REFERENCES user_profile(user_profile_id),
                        pnr TEXT,
                        created_at TIMESTAMP WITH TIME ZONE
);