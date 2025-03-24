# Bring Your Own Device(BOYD) System

This repository contains the design, implementation, and documentation for the Life Insurance Co. Li-BYOD System, a database solution to manage the "Bring Your Own Device" (BYOD) policy introduced by Life Insurance Co. as part of their post-COVID "Work from Home" strategy. The system ensures that all devices connecting to the company network comply with IT cybersecurity policies and controls

## Requirements and Business Rules
The system is designed to meet the following requirements:
1.	Employee and Department Management:
   
 •	Each employee belongs to a department, which has a unique department code, name, mailbox number, and phone number.

 •	Employee details include employee number, name, email, title, and department code.
 
3.	Project Management:

 •	Projects are created to address specific business issues, with project teams consisting of members from one or more departments.
 
 •	Project details include project ID, name, description, start date, and end date.

4.	Device Registration and Management:

 •	All devices (desktop, laptop, smartphone, tablet) must be registered with the IT department.
 
 •	Device details include brand, model, value, operating system, registration date, activation date, MAC address, and security features (e.g., screen lock, BitLocker).

5.	BYOD Approval and Activation:

 •	Devices must be approved by an IT supervisor and activated by a systems administrator.

 •	Approval and activation dates are recorded.

6.	Corporate Accounts and Software Installation:
 
 •	Corporate accounts are created for BYOD devices, with Microsoft 365, OneDrive, and other business applications installed.
 
 •	Software installations are tracked for each device.

7.	Service Access and Permissions:

 •	Employees are granted access to shared services (e.g., HR, Payroll) based on their role and department.

 •	Two-factor authentication is required for accessing services.
 
8.	Network Access and Security:

 •	Devices are authenticated using MAC addresses, and two-factor authentication is required for Wi-Fi access.

 •	Desktop devices have static IP addresses, while mobile devices receive temporary IP addresses.

## Database Design
Entity-Relationship Diagram (ERD)
The ERD provides a visual representation of the database schema, showing the relationships between entities such as Employee, Department, Device, Project, and Service.

![BYOD_ERD](https://github.com/user-attachments/assets/cac55c4e-b6de-4c7d-a2fa-adbe9ba539c1)

Enhanced Entity-Relationship (EER) Model
The EER model, generated by reverse-engineering the database, ensures that the schema adheres to the principles of normalization.

![BYOD_EER](https://github.com/user-attachments/assets/ffe020c6-0dab-4964-b77e-9c53c5ec08cf)

Normalization
The database is normalized to the Third Normal Form (3NF):
•	First Normal Form (1NF): Each table has a primary key, and there are no repeating groups.

•	Second Normal Form (2NF): All attributes are fully dependent on the primary key.

•	Third Normal Form (3NF): There are no transitive dependencies.

## Database Implementation
1. SQL Script
The database is implemented using MySQL. The SQL script includes:

 •	Table creation (CREATE TABLE statements).

 •	Foreign key constraints to enforce relationships between tables.

 •	Data insertion scripts to populate the database with mock data.

3. Mock Data
The database is populated with mock data to demonstrate its functionality. Example data includes:

 •	Departments: Human Resources, Finance, IT, etc.

 •	Employees: John Doe, Jane Smith, etc.

 •	Devices: Dell Latitude, Apple iPhone, etc.

 •	Projects: Website Redesign, Financial Report Automation, etc.

## SQL Queries for IT Management
The following SQL queries provide valuable insights for IT management:
1.	Breakdown of BYOD Devices:

![image](https://github.com/user-attachments/assets/1bff6226-c8da-43d2-9ca5-d8f41e56309a)

2.	Total Cost of BYOD Devices:

![image](https://github.com/user-attachments/assets/c1e1bbde-76ee-4470-afcc-643e7f5a6499)

3.	Average Cost by Device Type:

![image](https://github.com/user-attachments/assets/93497413-dbbc-4328-b5ec-6529a79acf3b)

4.	Average Time for Device Activation:

![image](https://github.com/user-attachments/assets/fe9f02d0-46d2-41d9-8b05-8c185c5a8ddc)

5.	Device with Longest Activation Time:

![image](https://github.com/user-attachments/assets/7076a32e-69d6-4b7e-81ac-118df1faf80f)

6.	Minimum and Maximum Activation Times:

![image](https://github.com/user-attachments/assets/19d15e17-608a-43f4-9cfa-2d4884a6ca7c)


## Conclusion
The Life Insurance Co. Li-BYOD System provides a comprehensive solution for managing BYOD devices, ensuring compliance with IT policies, and enabling efficient monitoring of device usage. The database design adheres to normalization principles, and the SQL queries offer valuable insights for IT management.
For further details, refer to the SQL scripts, ERD, and EER models included in this repository.
________________________________________

