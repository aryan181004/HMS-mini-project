CREATE DATABASE IF NOT EXISTS DBMSL_MINI_PROJECT;

USE DBMSL_MINI_PROJECT;

CREATE TABLE Patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  address VARCHAR(255),
  phone_number VARCHAR(20),
  medical_history_id INT UNIQUE
);

CREATE TABLE Medical_History (
  history_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT UNIQUE,
  medical_history LONGTEXT,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Doctor_Schedule (
  schedule_id INT PRIMARY KEY AUTO_INCREMENT,
  doctor_id INT UNIQUE,
  schedule VARCHAR(255)
);

CREATE TABLE Doctors (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  specialization VARCHAR(100),
  schedule_id INT UNIQUE,
  FOREIGN KEY (schedule_id) REFERENCES Doctor_Schedule(schedule_id)
);

CREATE TABLE Appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  date DATE NOT NULL,
  time TIME NOT NULL,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  appointment_type VARCHAR(50),
  reason_for_visit TEXT,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Patients (name, date_of_birth, address, phone_number, medical_history_id) VALUES
('John Doe', '1990-05-15', '123 Main St, Cityville', '555-1234', 1),
('Jane Smith', '1985-09-20', '456 Elm St, Townburg', '555-5678', 2),
('Michael Johnson', '1978-12-10', '789 Oak St, Villageton', '555-9012', 3),
('Emily Davis', '1995-03-25', '321 Pine St, Hamletown', '555-3456', 4),
('David Brown', '1980-07-18', '654 Cedar St, Borough City', '555-7890', 5),
('Sarah Wilson', '1992-11-30', '987 Maple St, Suburbia', '555-2345', 6),
('Jessica Taylor', '1975-08-05', '159 Birch St, Countryside', '555-6789', 7),
('Matthew Martinez', '1988-02-12', '852 Walnut St, Metroville', '555-0123', 8),
('Amanda White', '1998-06-28', '753 Spruce St, Uptown', '555-4567', 9),
('Christopher Lee', '1970-04-07', '369 Ash St, Downtown', '555-8901', 10);

INSERT INTO Medical_History (patient_id, medical_history) VALUES
(1, 'Allergic to penicillin. No major surgeries.'),
(2, 'High blood pressure. Appendectomy in 2005.'),
(3, 'Type 2 diabetes. History of heart disease.'),
(4, 'Asthma. No significant medical history.'),
(5, 'Chronic back pain. Previous knee surgery.'),
(6, 'Seasonal allergies. No surgeries.'),
(7, 'History of depression. No major health issues.'),
(8, 'None. Generally healthy.'),
(9, 'Anxiety disorder. No surgeries.'),
(10, 'Hypothyroidism. Gallbladder removal in 2010.');

INSERT INTO Doctor_Schedule (doctor_id, schedule) VALUES
(1, 'Monday, Wednesday, Friday - 9:00 AM to 1:00 PM'),
(2, 'Tuesday, Thursday - 10:00 AM to 3:00 PM'),
(3, 'Monday, Wednesday, Friday - 2:00 PM to 6:00 PM'),
(4, 'Tuesday, Thursday - 9:00 AM to 12:00 PM'),
(5, 'Monday to Friday - 8:00 AM to 5:00 PM');

INSERT INTO Doctors (name, specialization, schedule_id) VALUES
('Dr. Smith', 'Cardiologist', 1),
('Dr. Johnson', 'Orthopedic Surgeon', 2),
('Dr. Williams', 'Endocrinologist', 3),
('Dr. Brown', 'Dermatologist', 4),
('Dr. Davis', 'Pediatrician', 5);

INSERT INTO Appointments (date, time, patient_id, doctor_id, appointment_type, reason_for_visit) VALUES
('2024-04-23', '09:00:00', 1, 1, 'Routine Checkup', 'Annual physical examination.'),
('2024-04-25', '11:00:00', 2, 2, 'Follow-up', 'Monitoring blood pressure.'),
('2024-04-26', '14:00:00', 3, 3, 'Consultation', 'Discussing insulin dosage.'),
('2024-04-24', '10:30:00', 4, 4, 'Dermatology', 'Skin rash diagnosis.'),
('2024-04-25', '08:30:00', 5, 5, 'Pediatrics', 'Childhood vaccinations.'),
('2024-04-27', '15:30:00', 6, 1, 'Follow-up', 'Adjusting medication dosage.'),
('2024-04-23', '11:30:00', 7, 2, 'Consultation', 'Discussing treatment options for depression.'),
('2024-04-26', '09:30:00', 8, 3, 'Follow-up', 'Reviewing blood test results.'),
('2024-04-24', '13:00:00', 9, 4, 'Dermatology', 'Mole examination.'),
('2024-04-27', '12:00:00', 10, 5, 'Consultation', 'Thyroid medication adjustment.');