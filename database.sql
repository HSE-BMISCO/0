-- ایجاد پایگاه داده
CREATE DATABASE contractor_hse_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE contractor_hse_db;

-- جدول کاربران
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin','viewer') DEFAULT 'viewer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (username, password, role) VALUES
('admin', SHA2('admin123', 256), 'admin');

-- جدول شرکت‌ها
CREATE TABLE companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    registration_number VARCHAR(100),
    manager_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- جدول پروژه‌ها
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);

-- جدول حوادث
CREATE TABLE incidents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    incident_date DATE NOT NULL,
    description TEXT,
    severity ENUM('low','medium','high') DEFAULT 'low',
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);

-- جدول بیمه‌ها
CREATE TABLE insurances (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    insurance_number VARCHAR(100),
    expiry_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);
