-- ====================
-- 1. WRITING DATA
-- ====================

-- Inserting patients
INSERT INTO "patients" (
    "first_name",
    "last_name",
    "birthday",
    "medical_record_number"
)
VALUES
    ('Amelia', 'Earhart', '1984-07-24', 'MRN-1001'),
    ('Denny', 'Duquette', '1975-02-14', 'MRN-1002'),
    ('Henry', 'Burton', '1972-09-18', 'MRN-1003'),
    ('Beth', 'Monroe', '1988-06-07', 'MRN-1004'),
    ('Katie', 'Bryce', '1991-11-12', 'MRN-1005'),
    ('Allison', 'Clark', '1983-03-21', 'MRN-1006'),
    ('Jennifer', 'Evans', '1995-08-30', 'MRN-1007'),
    ('Samuel', 'Avery', '2018-05-10', 'MRN-1008'),
    ('Sophia', 'Davis', '2001-12-05', 'MRN-1009'),
    ('Ethan', 'Walker', '1981-10-27', 'MRN-1010');

-- Inserting procedures
INSERT INTO "procedures" ("name", "expected_time_min", "type")
VALUES
    ('Appendectomy', 90, 'Emergency'),
    ('Cholecystectomy', 120, 'Elective'),
    ('Coronary Artery Bypass', 300, 'Elective'),
    ('Craniotomy', 360, 'Emergency'),
    ('Hip Replacement', 180, 'Elective'),
    ('Cataract Surgery', 60, 'Elective'),
    ('Trauma Surgery', 240, 'Emergency'),
    ('Liver Transplant', 480, 'Elective'),
    ('Kidney Transplant', 330, 'Elective'),
    ('Heart Transplant', 480, 'Emergency');

-- Inserting operating rooms
INSERT INTO "operating_rooms" ("floor", "room_number", "status")
VALUES
    (2, 1, 'Available'),
    (2, 2, 'Available'),
    (2, 3, 'Available'),
    (2, 4, 'Maintenance'),
    (2, 5, 'Available'),
    (3, 1, 'Available'),
    (3, 2, 'In Surgery'),
    (3, 3, 'Available'),
    (3, 4, 'Out of Service'),
    (3, 5, 'Available');

-- Insering the medical staff
INSERT INTO "medical_staff" (
    "first_name",
    "last_name",
    "professional_role",
    "professional_license_number",
    "status"
)
VALUES
    ('Meredith', 'Grey', 'General Surgeon', 'SUR-1001', 'Active'),
    ('Derek', 'Shepherd', 'Neurosurgeon', 'SUR-1002', 'Active'),
    ('Cristina', 'Yang', 'Cardiothoracic Surgeon', 'SUR-1003', 'Active'),
    ('Preston', 'Burke', 'Cardiothoracic Surgeon', 'SUR-1004', 'Active'),
    ('Miranda', 'Bailey', 'General Surgeon', 'SUR-1005', 'Active'),
    ('Richard', 'Webber', 'General Surgeon', 'SUR-1006', 'Active'),
    ('Alex', 'Karev', 'Pediatric Surgeon', 'SUR-1007', 'Active'),
    ('Arizona', 'Robbins', 'Pediatric Surgeon', 'SUR-1008', 'Active'),
    ('Callie', 'Torres', 'Orthopedic Surgeon', 'SUR-1009', 'Active'),
    ('Owen', 'Hunt', 'Trauma Surgeon', 'SUR-1010', 'Active'),
    ('Teddy', 'Altman', 'Cardiothoracic Surgeon', 'SUR-1011', 'Active'),
    ('Jackson', 'Avery', 'Plastic Surgeon', 'SUR-1012', 'Active'),
    ('April', 'Kepner', 'Trauma Surgeon', 'SUR-1013', 'Active'),
    ('Ben', 'Warren', 'Anesthesiologist', 'AN-2001', 'Active'),
    ('Levi', 'Schmitt', 'General Surgeon', 'SUR-1014', 'On Leave'),
    ('Jo', 'Wilson', 'General Surgeon', 'SUR-1015', 'Active');

-- Insering equipments
INSERT INTO "equipment" ("name", "category", "status")
VALUES
    ('Operating Table', 'Furniture', 'Available'),
    ('Surgical Lights', 'Lighting', 'Available'),
    ('Anesthesia Machine', 'Anesthesia', 'Available'),
    ('Ventilator', 'Respiratory', 'Available'),
    ('Cardiac Monitor', 'Monitoring', 'Available'),
    ('Defibrillator', 'Emergency', 'Available'),
    ('Infusion Pump', 'Infusion', 'Available'),
    ('Electrosurgical Unit', 'Surgical', 'Available'),
    ('Surgical Drill', 'Orthopedic', 'Available'),
    ('C-Arm', 'Imaging', 'Available'),
    ('Heart-Lung Machine', 'Cardiac', 'Available'),
    ('Ultrasound Machine', 'Imaging', 'Maintenance'),
    ('Suction Unit', 'Surgical', 'Available'),
    ('Endoscopy Tower', 'Endoscopy', 'Available'),
    ('Surgical Microscope', 'Neurosurgery', 'In Use');

-- Inserting surgeries
INSERT INTO "surgeries"
(
    "patient_id",
    "procedure_id",
    "operating_room_id",
    "date",
    "scheduled_start",
    "scheduled_end",
    "status"
)
VALUES
    (1, 1, 1, '2026-08-05', '08:00', '09:30', 'Completed'),
    (2, 3, 2, '2026-08-05', '09:00', '14:00', 'Completed'),
    (3, 4, 6, '2026-08-05', '10:00', '16:00', 'In Progress'),
    (4, 5, 3, '2026-08-05', '11:00', '14:00', 'Scheduled'),
    (5, 2, 5, '2026-08-05', '13:00', '15:00', 'Scheduled'),
    (6, 7, 7, '2026-08-05', '15:00', '19:00', 'Scheduled'),
    (7,10, 8, '2026-08-06', '07:30', '15:30', 'Scheduled'),
    (8, 8,10, '2026-08-06', '08:00', '16:00', 'Cancelled'),
    (9, 6, 1, '2026-08-06', '09:00', '10:00', 'Scheduled'),
    (10,9, 2, '2026-08-06', '11:00', '16:30', 'Scheduled');

-- Insering surgery staff
INSERT INTO "surgery_staff"
("surgery_id", "staff_id", "professional_role")
VALUES
    -- Surgery 1 - Appendectomy
    (1, 1, 'Lead Surgeon'),
    (1, 5, 'Assistant Surgeon'),
    (1, 14, 'Anesthesiologist'),

    -- Surgery 2 - Coronary Artery Bypass
    (2, 3, 'Lead Surgeon'),
    (2, 4, 'Assistant Surgeon'),
    (2, 11, 'Consulting Surgeon'),
    (2, 14, 'Anesthesiologist'),

    -- Surgery 3 - Craniotomy
    (3, 2, 'Lead Surgeon'),
    (3, 5, 'Assistant Surgeon'),
    (3, 14, 'Anesthesiologist'),

    -- Surgery 4 - Hip Replacement
    (4, 9, 'Lead Surgeon'),
    (4, 14, 'Anesthesiologist'),

    -- Surgery 5 - Cholecystectomy
    (5, 16, 'Lead Surgeon'),
    (5, 6, 'Assistant Surgeon'),
    (5, 14, 'Anesthesiologist'),

    -- Surgery 6 - Trauma Surgery
    (6, 10, 'Lead Surgeon'),
    (6, 13, 'Assistant Surgeon'),
    (6, 14, 'Anesthesiologist'),

    -- Surgery 7 - Heart Transplant
    (7, 3, 'Lead Surgeon'),
    (7, 11, 'Assistant Surgeon'),
    (7, 4, 'Consulting Surgeon'),
    (7, 14, 'Anesthesiologist'),

    -- Surgery 8 - Liver Transplant
    (8, 6, 'Lead Surgeon'),
    (8, 1, 'Assistant Surgeon'),
    (8, 14, 'Anesthesiologist'),

    -- Surgery 9 - Cataract Surgery
    (9, 15, 'Lead Surgeon'),
    (9, 14, 'Anesthesiologist'),

    -- Surgery 10 - Kidney Transplant
    (10, 6, 'Lead Surgeon'),
    (10, 1, 'Assistant Surgeon'),
    (10, 14, 'Anesthesiologist');

-- Inserting surgery equipment
INSERT INTO "surgery_equipment"
("surgery_id", "equipment_id", "quantity")
VALUES
    -- Surgery 1 - Appendectomy
    (1, 1, 1),  -- Operating Table
    (1, 2, 1),  -- Surgical Lights
    (1, 3, 1),  -- Anesthesia Machine
    (1, 8, 1),  -- Electrosurgical Unit

    -- Surgery 2 - Coronary Artery Bypass
    (2, 1, 1),  -- Operating Table
    (2, 5, 1),  -- Cardiac Monitor
    (2, 6, 1),  -- Defibrillator
    (2, 11, 1), -- Heart-Lung Machine
    (2, 3, 1),  -- Anesthesia Machine

    -- Surgery 3 - Craniotomy
    (3, 1, 1),  -- Operating Table
    (3, 15, 1), -- Surgical Microscope
    (3, 5, 1),  -- Cardiac Monitor
    (3, 3, 1),  -- Anesthesia Machine

    -- Surgery 4 - Hip Replacement
    (4, 1, 1),
    (4, 9, 1),  -- Surgical Drill
    (4, 10, 1), -- C-Arm
    (4, 3, 1),

    -- Surgery 5 - Cholecystectomy
    (5, 1, 1),
    (5, 8, 1),
    (5, 3, 1),
    (5, 13, 1), -- Suction Unit

    -- Surgery 6 - Trauma Surgery
    (6, 1, 1),
    (6, 4, 1),  -- Ventilator
    (6, 6, 1),  -- Defibrillator
    (6, 13, 1),

    -- Surgery 7 - Heart Transplant
    (7, 1, 1),
    (7, 5, 1),
    (7, 6, 1),
    (7, 11, 1),
    (7, 3, 1),

    -- Surgery 8 - Liver Transplant
    (8, 1, 1),
    (8, 5, 1),
    (8, 4, 1),
    (8, 7, 2),  -- Infusion Pump

    -- Surgery 9 - Cataract Surgery
    (9, 1, 1),
    (9, 15, 1),
    (9, 2, 1),

    -- Surgery 10 - Kidney Transplant
    (10, 1, 1),
    (10, 5, 1),
    (10, 4, 1),
    (10, 7, 2);

-- Inserting room's equipment
INSERT INTO "room_equipment"
("operating_room_id", "equipment_id", "quantity")
VALUES
    -- Floor 2 - Room 1 (General Surgery Room)
    (1, 1, 1),   -- Operating Table
    (1, 2, 2),   -- Surgical Lights
    (1, 3, 1),   -- Anesthesia Machine
    (1, 5, 1),   -- Cardiac Monitor
    (1, 8, 1),   -- Electrosurgical Unit
    (1, 13, 1),  -- Suction Unit

    -- Floor 2 - Room 2 (Cardiac Surgery Room)
    (2, 1, 1),
    (2, 2, 2),
    (2, 3, 1),
    (2, 5, 2),
    (2, 6, 1),
    (2, 11, 1),

    -- Floor 2 - Room 3 (Orthopedic Room)
    (3, 1, 1),
    (3, 2, 2),
    (3, 3, 1),
    (3, 9, 1),
    (3, 10, 1),

    -- Floor 2 - Room 4 (Maintenance - limited equipment)
    (4, 1, 1),
    (4, 2, 1),

    -- Floor 2 - Room 5 (General Surgery Room)
    (5, 1, 1),
    (5, 3, 1),
    (5, 8, 1),
    (5, 14, 1),

    -- Floor 3 - Room 1 (Neurosurgery Room)
    (6, 1, 1),
    (6, 2, 2),
    (6, 3, 1),
    (6, 15, 1),
    (6, 5, 1),

    -- Floor 3 - Room 2 (Transplant Room)
    (7, 1, 1),
    (7, 3, 1),
    (7, 4, 1),
    (7, 5, 1),
    (7, 6, 1),
    (7, 11, 1),

    -- Floor 3 - Room 3 (Trauma Room)
    (8, 1, 1),
    (8, 3, 1),
    (8, 4, 2),
    (8, 5, 1),
    (8, 6, 1),
    (8, 13, 1),

    -- Floor 3 - Room 4 (Out of Service)
    (9, 1, 1),

    -- Floor 3 - Room 5 (Ophthalmology Room)
    (10, 1, 1),
    (10, 2, 1),
    (10, 15, 1);

-- ====================
-- 2. QUERYING DATA - TESTING
-- ====================
-- a. List all scheduled surgeries.
SELECT * FROM "surgical_schedule"
WHERE "status" = 'Scheduled'
ORDER BY "data", "scheduled_start";

-- b.Display the daily surgical schedule by operating room.
SELECT *
FROM "surgical_schedule"
ORDER BY
    "data",
    "floor",
    "room_number",
    "scheduled_start";

--  c. Find all surgeries for a particular patient.
SELECT * FROM "surgical_schedule"
WHERE "patient_first_name" = 'Denny' AND "patient_last_name" = 'Duquette'
ORDER BY "data", "scheduled_start";

-- d. Find all staff members assigned to a surgery.
SELECT * FROM "staff_schedule"
ORDER BY "date", "scheduled_start";

-- e. Find all surgeries assigned to a particular staff member.
SELECT * FROM "staff_schedule"
WHERE "last_name" = 'Grey'
ORDER BY "date", "scheduled_start";

-- f. Find all equipment required by a surgery.
SELECT e."name",
        e."category",
        se."quantity"
FROM "surgery_equipment" AS se
JOIN "equipment" AS e
    ON se."equipment_id" = e."id"
WHERE se."surgery_id" = 1;

-- g. List all equipment available in an operating room.
SELECT e."name",
        e."category",
        re."quantity"
FROM "equipment" AS e
JOIN "room_equipment" AS re
ON e."id" = re."equipment_id"
WHERE re."operating_room_id" = 2
AND s."status" = 'Available';

-- h. List currently available operating rooms.
SELECT
    "floor",
    "room_number"
FROM "operating_rooms"
WHERE "status" = 'Available'
ORDER BY
    "floor",
    "room_number";

-- i. Identify the next scheduled surgery for each operating room.
SELECT * FROM "operating_room_status";

-- j. Count surgeries by operating room and total scheduled time per operation room
SELECT * FROM "room_utilization";

-- k. Identify the most utilized operating rooms.
SELECT *
FROM "room_utilization"
ORDER BY
    "Total Surgeries" DESC,
    "Total Scheduled Minutes" DESC
LIMIT 1;

-- l. Count surgeries by status.
SELECT COUNT(*) AS "total_surgeries", "status"
FROM "surgical_schedule"
GROUP BY "status"
ORDER BY "total_surgeries" DESC;

-- m. List cancelled surgeries.
SELECT * FROM "surgical_schedule"
WHERE "status" = 'Cancelled';

-- n. List completed surgeries.
SELECT * FROM "surgical_schedule"
WHERE "status" = 'Completed';

-- o. Identify procedures with the highest number of scheduled surgeries.
SELECT "procedure_name",
    COUNT(*) AS "total_surgeries"
FROM "surgical_schedule"
WHERE "status" = 'Scheduled'
GROUP BY "procedure_name"
ORDER BY "total_surgeries" DESC;

-- p. Search for patients by name.
SELECT * FROM "patients"
WHERE "last_name" = 'Avery';

-- q. Search for medical staff by name.
SELECT * FROM "medical_staff"
WHERE "last_name" = 'Bailey';

-- r. Identify staff members assigned to overlapping surgeries -- TRIGGER CREATED IB SCHEMA
SELECT
    s1."first_name",
    s1."last_name",
    s1."date",
    s1."surgery_id" AS "surgery_1",
    s2."surgery_id" AS "surgery_2",
    s1."scheduled_start" AS "surgery_1_start",
    s1."scheduled_end" AS "surgery_1_end",
    s2."scheduled_start" AS "surgery_2_start",
    s2."scheduled_end" AS "surgery_2_end"
FROM "staff_schedule" AS s1
JOIN "staff_schedule" AS s2
    ON s1."staff_id" = s2."staff_id"
    AND s1."date" = s2."date"
    AND s1."surgery_id" < s2."surgery_id"
    AND s1."scheduled_start" < s2."scheduled_end"
    AND s1."scheduled_end" > s2."scheduled_start"
ORDER BY
    s1."last_name",
    s1."first_name",
    s1."date",
    s1."scheduled_start";

-- s. Identify scheduling conflicts between surgeries in the same operating room -- TRIGGER CREATED ON SCHEMA
SELECT
    s1."operating_room_id" AS "room_id",
    s1."id" AS "surgery_1",
    s2."id" AS "surgery_2",
    s1."date",
    s1."scheduled_start" AS "surgery_1_start",
    s1."scheduled_end" AS "surgery_1_end",
    s2."scheduled_start" AS "surgery_2_start",
    s2."scheduled_end" AS "surgery_2_end"
FROM "surgeries" AS s1
JOIN "surgeries" AS s2
    ON s1."operating_room_id" = s2."operating_room_id"
    AND s1."date" = s2."date"
    AND s1."id" < s2."id"
    AND s1."scheduled_start" < s2."scheduled_end"
    AND s1."scheduled_end" > s2."scheduled_start"
ORDER BY
    s1."operating_room_id",
    s1."date",
    s1."scheduled_start";
