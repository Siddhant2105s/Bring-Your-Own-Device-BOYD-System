CREATE DATABASE Li_BOYD; 
USE Li_BOYD;

-- CREATE TABLES
CREATE TABLE Department (
    department_code INT PRIMARY KEY,	
    department_name VARCHAR(80),
    mailbox_number VARCHAR(50),
    phone_number VARCHAR(50)
);

CREATE TABLE Employee (
    employee_number INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_initial VARCHAR(6),
    email VARCHAR(80),
    title VARCHAR(50),
    department_code INT,
    FOREIGN KEY (department_code) REFERENCES Department(department_code)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    description VARCHAR(300),
    start_date DATE,
    end_date DATE
);

CREATE TABLE Project_Team (
    project_id INT,
    department_code INT,
    employee_number INT,
    PRIMARY KEY (project_id, department_code, employee_number),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (department_code) REFERENCES Department(department_code),
    FOREIGN KEY (employee_number) REFERENCES Employee(employee_number)
);

CREATE TABLE Device (
    device_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    value_eur INT,
    os VARCHAR(50),
    os_version INT,
    device_type VARCHAR(50),
    registration_date DATE,
    activation_date DATE,
    mac_address VARCHAR(50),
    windows_sid VARCHAR(50),
    serial_number VARCHAR(50),
    screen_lock_enabled BOOLEAN,
    bitlocker_enabled BOOLEAN
);

CREATE TABLE IT_Device_Registration (
    device_id INT,
    registration_date DATE,
    PRIMARY KEY (device_id),
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
);

CREATE TABLE IT_BYOD_Approval (
    device_id INT,
    approval_date DATE,
    supervisor_id INT,
    PRIMARY KEY (device_id),
    FOREIGN KEY (device_id) REFERENCES Device(device_id),
    FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_number)
);

CREATE TABLE IT_BYOD_Activation (
    device_id INT,
    activation_date DATE,
    admin_id INT,
    PRIMARY KEY (device_id),
    FOREIGN KEY (device_id) REFERENCES Device(device_id),
    FOREIGN KEY (admin_id) REFERENCES Employee(employee_number)
);

CREATE TABLE Corporate_Account (
    account_id INT PRIMARY KEY,
    device_id INT,
    user_name VARCHAR(50),
    password VARCHAR(20),
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
);

CREATE TABLE Software_Installation (
    installation_id INT PRIMARY KEY,
    device_id INT,
    software_name VARCHAR(50),
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
);

CREATE TABLE Department_Group_Policy (
    policy_id INT PRIMARY KEY,
    department_code INT,
    policy_description VARCHAR(300),
    FOREIGN KEY (department_code) REFERENCES Department(department_code)
);

CREATE TABLE Service (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(300),
    access_date DATE
);

CREATE TABLE Employee_Service_Permission (
    employee_number INT,
    service_id INT,
    permission_date DATE,
    PRIMARY KEY (employee_number, service_id),
    FOREIGN KEY (employee_number) REFERENCES Employee(employee_number),
    FOREIGN KEY (service_id) REFERENCES Service(service_id)
);

CREATE TABLE Wifi_Access_Point (
    mac_address VARCHAR(50) PRIMARY KEY,
    two_factor_authentication_required BOOLEAN
);

CREATE TABLE Desktop_Device (
    device_id INT PRIMARY KEY,
    static_ip_address VARCHAR(50),
    building_name VARCHAR(80),
    office_number INT,
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
);

CREATE TABLE Mobile_Device (
    device_id INT PRIMARY KEY,
    temporary_ip_address VARCHAR(50),
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
);

CREATE TABLE DMZ_Access (
    device_id INT,
    access_date DATE,
    PRIMARY KEY (device_id),
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
);

ALTER TABLE Wifi_Access_Point
ADD COLUMN device_id INT;

ALTER TABLE Wifi_Access_Point
ADD CONSTRAINT fk_wifi_device
FOREIGN KEY (device_id) REFERENCES Device(device_id);

--------------------------------------------------------------------------------------------------------------------------

-- INSERT DATA INTO THE TABLES

INSERT INTO Department (department_code, department_name, mailbox_number, phone_number)
VALUES 
    (101, 'Human Resources', 'HR123', '123-456-7890'),
    (102, 'Finance', 'FIN456', '234-567-8901'),
    (103, 'Marketing', 'MKT789', '345-678-9012'),
    (104, 'IT', 'IT123', '456-789-0123');

INSERT INTO Employee (employee_number, first_name, last_name, middle_initial, email, title, department_code)
VALUES 
    (1001, 'John', 'Doe', 'A', 'john.doe@example.com', 'HR Manager', 101),
    (1002, 'Jane', 'Smith', 'B', 'jane.smith@example.com', 'Finance Manager', 102),
    (1003, 'David', 'Johnson', 'C', 'david.johnson@example.com', 'Marketing Manager', 103),
    (1004, 'Michael', 'Williams', 'D', 'michael.williams@example.com', 'IT Manager', 104),
    (1005, 'Emily', 'Brown', 'E', 'emily.brown@example.com', 'HR Assistant', 101),
    (1006, 'James', 'Jones', 'F', 'james.jones@example.com', 'Financial Analyst', 102),
    (1007, 'Sarah', 'Garcia', 'G', 'sarah.garcia@example.com', 'Marketing Coordinator', 103),
    (1008, 'Robert', 'Martinez', 'H', 'robert.martinez@example.com', 'IT Technician', 104);

INSERT INTO Project (project_id, project_name, description, start_date, end_date)
VALUES 
    (201, 'Website Redesign', 'Redesign company website for better user experience.', '2024-01-01', '2024-06-30'),
    (202, 'Financial Report Automation', 'Automate financial reporting process for efficiency.', '2024-02-01', '2024-08-31'),
    (203, 'Product Launch Campaign', 'Plan and execute marketing campaign for new product launch.', '2024-03-01', '2024-09-30'),
    (204, 'IT System Upgrade', 'Upgrade company IT infrastructure for improved performance.', '2024-04-01', '2024-10-31');

INSERT INTO Project_Team (project_id, department_code, employee_number)
VALUES 
    (201, 101, 1001),
    (201, 102, 1002),
    (202, 102, 1002),
    (202, 104, 1004),
    (203, 103, 1003),
    (203, 103, 1007),
    (204, 104, 1004),
    (204, 104, 1008);

INSERT INTO Device (device_id, brand, model, value_eur, os, os_version, device_type, registration_date, activation_date, mac_address, windows_sid, serial_number, screen_lock_enabled, bitlocker_enabled)
VALUES 
    (301, 'Dell', 'Latitude 7400', 1200, 'Windows', 10, 'Laptop', '2023-01-15', '2023-01-20', '00-15-5D-01-3B-6C', 'S-1-5-21-397955417-626881126-188441444-1003', 'A123456', true, true),
    (302, 'Apple', 'iPhone 12', 1000, 'iOS', 14, 'Mobile', '2023-02-10', '2023-02-15', 'A1-B2-C3-D4-E5-F6', NULL, 'B234567', true, false),
    (303, 'HP', 'EliteDesk 800 G5', 1500, 'Windows', 10, 'Desktop', '2023-03-05', '2023-03-10', '00-15-5D-01-3B-6D', 'S-1-5-21-397955417-626881126-188441444-1004', 'C345678', true, true),
    (304, 'Samsung', 'Galaxy Tab S7', 800, 'Android', 11, 'Tablet', '2023-04-20', '2023-04-25', 'A2-B3-C4-D5-E6-F7', NULL, 'D456789', true, false);

INSERT INTO IT_Device_Registration (device_id, registration_date)
VALUES 
    (301, '2023-01-20'),
    (302, '2023-02-15'),
    (303, '2023-03-10'),
    (304, '2023-04-25');

INSERT INTO IT_BYOD_Approval (device_id, approval_date, supervisor_id)
VALUES 
    (302, '2023-02-15', 1002),
    (304, '2023-04-25', 1004);

INSERT INTO IT_BYOD_Activation (device_id, activation_date, admin_id)
VALUES 
    (302, '2023-02-15', 1004),
    (304, '2023-04-25', 1004);

INSERT INTO Corporate_Account (account_id, device_id, user_name, password)
VALUES 
    (401, 301, 'john.doe', 'password123'),
    (402, 303, 'michael.williams', 'securepassword');

INSERT INTO Software_Installation (installation_id, device_id, software_name)
VALUES 
    (501, 301, 'Microsoft Office'),
    (502, 303, 'Adobe Photoshop');

INSERT INTO Department_Group_Policy (policy_id, department_code, policy_description)
VALUES 
    (601, 101, 'HR department group policy'),
    (602, 102, 'Finance department group policy'),
    (603, 103, 'Marketing department group policy'),
    (604, 104, 'IT department group policy');

INSERT INTO Service (service_id, service_name, access_date)
VALUES 
    (701, 'Email', '2023-01-01'),
    (702, 'VPN', '2023-01-01'),
    (703, 'Intranet', '2023-01-01');

INSERT INTO Employee_Service_Permission (employee_number, service_id, permission_date)
VALUES 
    (1001, 701, '2023-01-01'),
    (1001, 702, '2023-01-01'),
    (1001, 703, '2023-01-01'),
    (1002, 701, '2023-01-01'),
    (1002, 702, '2023-01-01'),
    (1002, 703, '2023-01-01'),
    (1003, 701, '2023-01-01'),
    (1003, 702, '2023-01-01'),
    (1003, 703, '2023-01-01'),
    (1004, 701, '2023-01-01'),
    (1004, 702, '2023-01-01'),
    (1004, 703, '2023-01-01');

INSERT INTO Wifi_Access_Point (mac_address, two_factor_authentication_required, device_id)
VALUES 
    ('00-1A-2B-3C-4D-5E', true, 301),
    ('00-1A-2B-3C-4D-5F', false, 303),
    ('00-1A-2B-3C-4D-5G', true, 304);

INSERT INTO Desktop_Device (device_id, static_ip_address, building_name, office_number)
VALUES 
    (303, '192.168.1.10', 'Headquarters', 101),
    (304, '192.168.1.11', 'Headquarters', 102);

INSERT INTO Mobile_Device (device_id, temporary_ip_address)
VALUES 
    (302, '192.168.1.20'),
    (304, '192.168.1.21');

INSERT INTO DMZ_Access (device_id, access_date)
VALUES 
    (301, '2023-01-20'),
    (304, '2023-04-25');
    
------------------------------------------------------------------------------------------------------------------------

-- SOLUTIONS TO THE GIVEN QUESTIONS  
-- Q1. Provide a breakdown of the number of BYOD devices by type, make, model, and operating system.
SELECT 
    device_type, brand, model, os,
    COUNT(*) AS count
FROM Device
WHERE device_id IN (SELECT device_id FROM IT_BYOD_Activation)
GROUP BY device_type, brand, model, os;

-- Q2. What is the total cost of all BYODs in use and a cost breakdown of types and models.
SELECT device_type, brand, model,
    SUM(value_eur) AS total_cost
FROM Device
WHERE device_id IN (SELECT device_id FROM IT_BYOD_Activation)
GROUP BY device_type, brand, model;

-- Q3. What us the average cost each type of BOYD device?
SELECT device_type,
    AVG(value_eur) AS avg_cost
FROM Device
WHERE device_id IN (SELECT device_id FROM IT_BYOD_Activation)
GROUP BY device_type;

-- Q4. What are the average times between registration and approval, approval to activation and average time from registration to device?
SELECT 
    IFNULL(AVG(DATEDIFF(IT_BYOD_Approval.approval_date, IT_Device_Registration.registration_date)), 0) AS avg_reg_approval,
    IFNULL(AVG(DATEDIFF(IT_BYOD_Activation.activation_date, IT_BYOD_Approval.approval_date)), 0) AS avg_approval_activation,
    IFNULL(AVG(DATEDIFF(IT_BYOD_Activation.activation_date, IT_Device_Registration.registration_date)), 0) AS avg_reg_activation
FROM IT_Device_Registration
INNER JOIN IT_BYOD_Approval ON IT_Device_Registration.device_id = IT_BYOD_Approval.device_id
INNER JOIN IT_BYOD_Activation ON IT_Device_Registration.device_id = IT_BYOD_Activation.device_id;


-- Q5. What type of device and operating system took longest in days to be activated?
SELECT device_type, os,
    DATEDIFF(MAX(IT_BYOD_Activation.activation_date), MIN(IT_Device_Registration.registration_date)) AS activation_time
FROM IT_Device_Registration
INNER JOIN IT_BYOD_Activation ON IT_Device_Registration.device_id = IT_BYOD_Activation.device_id
INNER JOIN Device ON IT_Device_Registration.device_id = Device.device_id
WHERE Device.device_id IN (SELECT device_id FROM IT_BYOD_Activation)
GROUP BY device_type, os
ORDER BY activation_time DESC
LIMIT 1;

-- Q6. What are the minimum and maximum times for service delivery to activation?
SELECT 
    MIN(DATEDIFF(IT_BYOD_Activation.activation_date, IT_Device_Registration.registration_date)) AS min_reg_activation,
    MAX(DATEDIFF(IT_BYOD_Activation.activation_date, IT_Device_Registration.registration_date)) AS max_reg_activation
FROM IT_Device_Registration
INNER JOIN IT_BYOD_Activation ON IT_Device_Registration.device_id = IT_BYOD_Activation.device_id;
