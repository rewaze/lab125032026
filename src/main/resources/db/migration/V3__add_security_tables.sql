-- 1. Таблица ролей
CREATE TABLE IF NOT EXISTS roles (
                                     id      BIGSERIAL PRIMARY KEY,
                                     name    VARCHAR(255) NOT NULL UNIQUE
);

-- 2. Добавляем поля в user_profile (без изменения типа id)
ALTER TABLE user_profile
    ADD COLUMN IF NOT EXISTS email    VARCHAR(255),
    ADD COLUMN IF NOT EXISTS name     VARCHAR(255);

-- 3. Таблица связи users_roles
CREATE TABLE IF NOT EXISTS users_roles (
                                           user_id VARCHAR(255) NOT NULL REFERENCES user_profile(user_profile_id) ON DELETE CASCADE,
                                           role_id BIGINT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
                                           PRIMARY KEY (user_id, role_id)
);

-- 4. Данные
INSERT INTO roles (name) VALUES ('ROLE_ADMIN') ON CONFLICT (name) DO NOTHING;
INSERT INTO roles (name) VALUES ('ROLE_USER')  ON CONFLICT (name) DO NOTHING;

-- admin / admin123
-- user1 / user123
INSERT INTO user_profile (user_profile_id, username, password, first_name, last_name, email, name, created_at)
VALUES
    ('admin_1', 'admin', '$2a$10$UU/ajZ2eGYGqz7GovCe7y.YQN3ZJykygT.gyU2FlmnJNS1nxQg5.a', 'Admin', 'User', 'admin@demo.com', 'Administrator', NOW()),
    ('user_1',  'user1', '$2a$10$Y6hIfVoupVJsGgpc1IKcAusl5039nhiP.qUWx2d4w/F4RkKXdU0fK', 'Ivan', 'Kovalenko', 'user1@demo.com', 'Ivan Kovalenko', NOW())
ON CONFLICT DO NOTHING;

-- admin -> ROLE_ADMIN
INSERT INTO users_roles (user_id, role_id)
SELECT u.user_profile_id, r.id FROM user_profile u, roles r
WHERE u.username = 'admin' AND r.name = 'ROLE_ADMIN' ON CONFLICT DO NOTHING;

-- user1 -> ROLE_USER
INSERT INTO users_roles (user_id, role_id)
SELECT u.user_profile_id, r.id FROM user_profile u, roles r
WHERE u.username = 'user1' AND r.name = 'ROLE_USER' ON CONFLICT DO NOTHING;