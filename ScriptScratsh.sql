-- Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Patient', 'Doctor'))
);

-- Patients
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    full_name VARCHAR(255) NOT NULL,
    diabetes_type INTEGER,
    phone VARCHAR(20)
);

-- Doctors
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    full_name VARCHAR(255) NOT NULL,
    specialty INTEGER,
    license_number VARCHAR(50)
);

-- Patient - Doctor relationship
CREATE TABLE patient_doctor (
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    PRIMARY KEY (patient_id, doctor_id)
);

-- Glucose Records
CREATE TABLE glucose_records (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    value_mgdl NUMERIC(6,2) NOT NULL,
    recorded_at VARCHAR(30) NOT NULL
);

-- Symptoms
CREATE TABLE symptoms (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    description TEXT,
    severity VARCHAR(20),
    recorded_at VARCHAR(30)
);

-- Medical History
CREATE TABLE medical_history (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    condition VARCHAR(255),
    diagnosed_at VARCHAR(30),
    notes TEXT
);

-- Treatments
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    description TEXT,
    start_date VARCHAR(30),
    end_date VARCHAR(30),
    status VARCHAR(20) DEFAULT 'Active'
);

-- Medications
CREATE TABLE medications (
    id SERIAL PRIMARY KEY,
    treatment_id INTEGER NOT NULL REFERENCES treatments(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    dose VARCHAR(50),
    frequency VARCHAR(50),
    schedule_time VARCHAR(10)
);

-- Medication Intakes
CREATE TABLE medication_intakes (
    id SERIAL PRIMARY KEY,
    medication_id INTEGER NOT NULL REFERENCES medications(id) ON DELETE CASCADE,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    taken_at VARCHAR(30),
    confirmed BOOLEAN DEFAULT FALSE
);

-- Adverse Effects
CREATE TABLE adverse_effects (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    medication_id INTEGER NOT NULL REFERENCES medications(id) ON DELETE CASCADE,
    description TEXT,
    severity VARCHAR(20),
    reported_at VARCHAR(30)
);

-- Alerts
CREATE TABLE alerts (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    type VARCHAR(50),
    glucose_value NUMERIC(6,2),
    triggered_at VARCHAR(30),
    read BOOLEAN DEFAULT FALSE
);

-- Glucose Ranges
CREATE TABLE glucose_ranges (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    min_value NUMERIC(6,2),
    max_value NUMERIC(6,2)
);

-- Clinical Observations
CREATE TABLE clinical_observations (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    note TEXT,
    created_at VARCHAR(30)
);

-- Diagnoses
CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    description TEXT,
    diagnosed_at VARCHAR(30)
);

-- Clinical Reports
CREATE TABLE clinical_reports (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    summary TEXT,
    generated_at VARCHAR(30)
);

-- Appointments
CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    scheduled_at VARCHAR(30),
    status VARCHAR(20) DEFAULT 'confirmed',
    notes TEXT
);

INSERT INTO users (id, email, username, password, role) VALUES
(1, 'jeansuser@gmail.com', 'jeansusername', 'wO19351WD49DM', 'Patient'),
(2, 'shecciduser@gmail.com', 'sheccidusername', 'wAm0r13.02.2024', 'Doctor'),
(3, 'carlos.patient@gmail.com', 'carlospatient', 'Pass1234!', 'Patient'),
(4, 'maria.patient@gmail.com', 'mariapatient', 'Pass5678!', 'Patient'),
(5, 'luis.patient@gmail.com', 'luispatient', 'Pass9012!', 'Patient'),
(6, 'ana.doctor@gmail.com', 'anadoctor', 'Doc1234!', 'Doctor'),
(7, 'pedro.doctor@gmail.com', 'pedrodoc', 'Doc5678!', 'Doctor'),
(8, 'sofia.doctor@gmail.com', 'sofiadoc', 'Doc9012!', 'Doctor');

INSERT INTO patients (id, user_id, full_name, diabetes_type, phone) VALUES
(1, 1, 'Jean Arias', 2, '+51924242424'),
(2, 3, 'Carlos Mendoza', 1, '+51911111111'),
(3, 4, 'Maria Torres', 2, '+51922222222'),
(4, 5, 'Luis Ramirez', 2, '+51933333333');

INSERT INTO doctors (id, user_id, full_name, specialty, license_number) VALUES
(1, 2, 'Sheccid Villar', 2, '24052007'),
(2, 6, 'Ana Gutierrez', 1, '30011990'),
(3, 7, 'Pedro Castillo', 3, '15071985'),
(4, 8, 'Sofia Herrera', 2, '22081992');

INSERT INTO patient_doctor (patient_id, doctor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO glucose_records (patient_id, value_mgdl, recorded_at) VALUES
-- Jean (patient 1)
(1, 86.03,  '28/05/2026'), (1, 210.50, '29/05/2026'), (1, 68.00,  '30/05/2026'),
(1, 145.20, '31/05/2026'), (1, 55.80,  '01/06/2026'), (1, 178.90, '02/06/2026'),
(1, 95.40,  '03/06/2026'),
-- Carlos (patient 2)
(2, 220.10, '28/05/2026'), (2, 72.30,  '29/05/2026'), (2, 190.80, '30/05/2026'),
(2, 60.50,  '31/05/2026'), (2, 155.60, '01/06/2026'), (2, 88.20,  '02/06/2026'),
(2, 230.40, '03/06/2026'),
-- Maria (patient 3)
(3, 110.00, '28/05/2026'), (3, 58.70,  '29/05/2026'), (3, 200.30, '30/05/2026'),
(3, 78.90,  '31/05/2026'), (3, 165.40, '01/06/2026'), (3, 52.10,  '02/06/2026'),
(3, 188.60, '03/06/2026'),
-- Luis (patient 4)
(4, 175.20, '28/05/2026'), (4, 63.40,  '29/05/2026'), (4, 140.80, '30/05/2026'),
(4, 215.90, '31/05/2026'), (4, 70.20,  '01/06/2026'), (4, 198.50, '02/06/2026'),
(4, 57.30,  '03/06/2026');

INSERT INTO symptoms (patient_id, description, severity, recorded_at) VALUES
(1, 'Migraña leve por algunos minutos', 'Low', '13/03/2026'),
(1, 'Fatiga después de comer', 'Medium', '20/03/2026'),
(2, 'Visión borrosa al despertar', 'Medium', '01/04/2026'),
(2, 'Hormigueo en pies', 'High', '15/04/2026'),
(3, 'Sed excesiva durante el día', 'Medium', '05/04/2026'),
(3, 'Mareos al levantarse', 'Low', '18/04/2026'),
(4, 'Sudoración nocturna', 'High', '10/04/2026'),
(4, 'Dolor de cabeza recurrente', 'Medium', '22/04/2026');

INSERT INTO medical_history (patient_id, condition, diagnosed_at, notes) VALUES
(1, 'Diabetes Mellitus Tipo 2', '02/02/2024', 'Control glucémico en seguimiento'),
(2, 'Diabetes Mellitus Tipo 1', '15/06/2018', 'Insulino-dependiente desde diagnóstico'),
(3, 'Diabetes Mellitus Tipo 2 con hipertensión', '10/11/2021', 'Medicación combinada'),
(4, 'Diabetes Mellitus Tipo 2', '03/08/2022', 'Sobrepeso asociado, dieta indicada');

INSERT INTO treatments (id, patient_id, doctor_id, description, start_date, end_date, status) VALUES
(1,  1, 1, 'Control glucémico con Metformina',         '15/03/2026', '15/09/2026', 'Active'),
(2,  1, 1, 'Plan nutricional bajo en carbohidratos',   '01/04/2026', '01/07/2026', 'Active'),
(3,  1, 1, 'Seguimiento HbA1c trimestral',             '01/03/2026', '01/12/2026', 'Active'),
(4,  2, 2, 'Insulinoterapia basal-bolo',               '01/01/2026', '01/07/2026', 'Active'),
(5,  2, 2, 'Monitoreo continuo de glucosa',            '15/02/2026', '15/08/2026', 'Active'),
(6,  2, 2, 'Ajuste de dosis por actividad física',     '01/03/2026', '01/06/2026', 'Active'),
(7,  3, 3, 'Metformina + Amlodipino para HTA',         '10/01/2026', '10/07/2026', 'Active'),
(8,  3, 3, 'Dieta DASH y ejercicio aeróbico',          '01/02/2026', '01/08/2026', 'Active'),
(9,  3, 3, 'Control de presión y glucosa mensual',     '01/03/2026', '01/09/2026', 'Active'),
(10, 4, 4, 'Metformina dosis estándar',                '20/02/2026', '20/08/2026', 'Active'),
(11, 4, 4, 'Plan de reducción de peso',                '01/03/2026', '01/09/2026', 'Active'),
(12, 4, 4, 'Control glucémico mensual',                '15/03/2026', '15/09/2026', 'Active');

INSERT INTO medications (treatment_id, name, dose, frequency, schedule_time) VALUES
(1,  'Metformina',   '850mg',  'Daily',   '08:00'),
(2,  'Vitamina D',   '1000IU', 'Daily',   '12:00'),
(3,  'Ácido fólico', '5mg',    'Weekly',  '09:00'),
(4,  'Insulina Glargina',  '20U',   'Daily',   '22:00'),
(5,  'Insulina Lispro',    '10U',   '3x Daily','07:00'),
(6,  'Glucagón',           '1mg',   'On demand','00:00'),
(7,  'Metformina',   '1000mg', 'Daily',   '08:00'),
(8,  'Amlodipino',   '5mg',    'Daily',   '20:00'),
(9,  'Atorvastatina','20mg',   'Daily',   '21:00'),
(10, 'Metformina',   '850mg',  'Daily',   '08:00'),
(11, 'Orlistat',     '120mg',  '3x Daily','13:00'),
(12, 'Vitamina B12', '500mcg', 'Daily',   '08:00');

INSERT INTO medication_intakes (medication_id, patient_id, taken_at, confirmed) VALUES
(1,  1, '01/06/2026 08:05', true),
(1,  1, '02/06/2026 08:10', true),
(4,  2, '01/06/2026 22:00', true),
(4,  2, '02/06/2026 22:05', true),
(7,  3, '01/06/2026 08:00', true),
(7,  3, '02/06/2026 08:15', false),
(10, 4, '01/06/2026 08:00', true),
(10, 4, '02/06/2026 08:00', false);

INSERT INTO adverse_effects (patient_id, medication_id, description, severity, reported_at) VALUES
(1, 1,  'Náuseas leves después de la ingesta',        'Mild',     '20/03/2026'),
(1, 2,  'Leve malestar estomacal',                    'Mild',     '05/04/2026'),
(2, 4,  'Hipoglucemia nocturna leve',                 'Moderate', '10/03/2026'),
(2, 5,  'Enrojecimiento en zona de inyección',        'Mild',     '25/03/2026'),
(3, 7,  'Diarrea en primeros días de uso',            'Mild',     '15/01/2026'),
(3, 8,  'Edema leve en tobillos',                     'Moderate', '01/02/2026'),
(4, 10, 'Náuseas matutinas',                          'Mild',     '25/02/2026'),
(4, 11, 'Dolor abdominal leve',                       'Mild',     '10/03/2026');

INSERT INTO alerts (patient_id, type, glucose_value, triggered_at, read) VALUES
(1, 'hypo',  65.00,  '10/05/2026 03:00', true),
(1, 'hyper', 215.50, '29/05/2026 14:30', false),
(1, 'hypo',  55.80,  '01/06/2026 06:00', false),
(2, 'hyper', 220.10, '28/05/2026 08:00', true),
(2, 'hypo',  60.50,  '31/05/2026 02:00', false),
(2, 'hyper', 230.40, '03/06/2026 15:00', false),
(3, 'hypo',  58.70,  '29/05/2026 07:00', true),
(3, 'hyper', 200.30, '30/05/2026 13:00', false),
(3, 'hypo',  52.10,  '02/06/2026 05:00', false),
(4, 'hyper', 215.90, '31/05/2026 10:00', true),
(4, 'hypo',  63.40,  '29/05/2026 03:00', false),
(4, 'hypo',  57.30,  '03/06/2026 04:00', false);

INSERT INTO glucose_ranges (patient_id, min_value, max_value) VALUES
(1, 70.00, 130.00),
(2, 70.00, 140.00),
(3, 70.00, 130.00),
(4, 70.00, 135.00);

INSERT INTO clinical_observations (patient_id, doctor_id, note, created_at) VALUES
(1, 1, 'El paciente muestra buena adherencia al tratamiento farmacológico.', '05/04/2026'),
(2, 2, 'Ajuste de insulina requerido por actividad física aumentada.',       '10/04/2026'),
(3, 3, 'Presión arterial estable, glucosa en rango aceptable.',              '12/04/2026'),
(4, 4, 'Paciente con progreso en reducción de peso, glucosa mejorando.',     '15/04/2026');

INSERT INTO diagnoses (patient_id, doctor_id, description, diagnosed_at) VALUES
(1, 1, 'Diabetes Mellitus Tipo 2 no insulinodependiente',          '02/02/2024'),
(2, 2, 'Diabetes Mellitus Tipo 1 insulinodependiente',             '15/06/2018'),
(3, 3, 'Diabetes Mellitus Tipo 2 con hipertensión arterial',       '10/11/2021'),
(4, 4, 'Diabetes Mellitus Tipo 2 asociada a obesidad',             '03/08/2022');

INSERT INTO clinical_reports (patient_id, doctor_id, summary, generated_at) VALUES
(1, 1, 'Reporte trimestral: Estabilidad en niveles de glucosa basal.',            '01/05/2026'),
(2, 2, 'Reporte mensual: Episodios hipoglucémicos nocturnos en revisión.',        '01/05/2026'),
(3, 3, 'Reporte trimestral: Mejora en control glucémico y presión arterial.',     '01/05/2026'),
(4, 4, 'Reporte trimestral: Reducción de peso positiva, ajuste de dosis sugerido.','01/05/2026');

INSERT INTO appointments (patient_id, doctor_id, scheduled_at, status, notes) VALUES
(1, 1, '20/05/2026 10:30', 'confirmed', 'Revisión de resultados de laboratorio'),
(2, 2, '22/05/2026 09:00', 'confirmed', 'Ajuste de dosis de insulina'),
(3, 3, '23/05/2026 11:00', 'confirmed', 'Control mensual presión y glucosa'),
(4, 4, '24/05/2026 08:30', 'confirmed', 'Seguimiento plan de reducción de peso');