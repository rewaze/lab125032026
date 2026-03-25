INSERT INTO city (city_id, display_name, created_at) VALUES
                                                         ('c1', 'Kyiv', NOW()),
                                                         ('c2', 'Odesa', NOW()),
                                                         ('c3', 'Warsaw', NOW());

INSERT INTO user_profile (user_profile_id, first_name, last_name, username, password, created_at) VALUES
    ('u1', 'Andrii', 'Kovalzhi', 'andrii_dev', 'secret', NOW());

INSERT INTO flight (flight_id, departure_city_id, arrival_city_id, departure_time, arrival_time, flight_number, price, created_at) VALUES
                                                                                                                                       ('f1', 'c2', 'c3', '2026-05-08 10:00:00+02', '2026-05-08 13:00:00+02', 'PS69', '150.0', NOW()),
                                                                                                                                       ('f2', 'c3', 'c2', '2026-05-14 18:00:00+02', '2026-05-14 21:00:00+02', 'PS70', '120.0', NOW());

INSERT INTO ticket (ticket_id, flight_id, user_profile_id, pnr, created_at) VALUES
    ('t1', 'f1', 'u1', 'PNR12345', NOW());