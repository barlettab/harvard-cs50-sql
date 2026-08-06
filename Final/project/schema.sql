-- 1. DESIGNING PART
-- Creating patients table
CREATE TABLE "patients" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "birthday" TEXT NOT NULL,
    "medical_record_number" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

-- Creating procedures table
CREATE TABLE "procedures" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "expected_time_min" INTEGER NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ('Emergency', 'Elective', 'Diagnostic')),
    PRIMARY KEY ("id")
);

-- Creating OR's table
CREATE TABLE "operating_rooms" (
    "id" INTEGER,
    "floor" INTEGER NOT NULL,
    "room_number" INTEGER NOT NULL,
    "status" TEXT NOT NULL CHECK("status" IN ('Available', 'In Surgery', 'Maintenance', 'Out of Service')),
    PRIMARY KEY ("id"),
    UNIQUE ("floor", "room_number")
);

-- Creating Medical Staff's table
CREATE TABLE "medical_staff" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "professional_role" TEXT NOT NULL,
    "professional_license_number" TEXT NOT NULL UNIQUE,
    "status" TEXT NOT NULL CHECK("status" IN ('Active', 'Inactive', 'On Leave', 'Terminated')),
    PRIMARY KEY ("id")
);

-- Creating Equipment table
CREATE TABLE "equipment" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "status" TEXT NOT NULL CHECK("status" IN ('Available', 'In Use', 'Maintenance', 'Out of Service')),
    PRIMARY KEY ("id")
);

-- Creating Surgeries table
CREATE TABLE "surgeries" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "procedure_id" INTEGER,
    "operating_room_id" INTEGER,
    "date" TEXT NOT NULL,
    "scheduled_start" TEXT NOT NULL,
    "scheduled_end" TEXT NOT NULL,
    "status" TEXT NOT NULL CHECK("status" IN ('Scheduled', 'In Progress', 'Completed', 'Cancelled')),
    PRIMARY KEY("id"),
    FOREIGN KEY ("patient_id") REFERENCES "patients"("id"),
    FOREIGN KEY ("procedure_id") REFERENCES "procedures"("id"),
    FOREIGN KEY ("operating_room_id") REFERENCES "operating_rooms"("id")
);

-- Creating Surgery Staff associated table
CREATE TABLE "surgery_staff" (
    "surgery_id" INTEGER,
    "staff_id" INTEGER,
    "professional_role" TEXT NOT NULL,
    PRIMARY KEY ("surgery_id", "staff_id"),
    FOREIGN KEY ("surgery_id") REFERENCES "surgeries"("id"),
    FOREIGN KEY ("staff_id") REFERENCES "medical_staff"("id")
);

-- Creating Surgery Equipment associated table
CREATE TABLE "surgery_equipment" (
    "surgery_id" INTEGER,
    "equipment_id" INTEGER,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    PRIMARY KEY ("surgery_id", "equipment_id"),
    FOREIGN KEY ("surgery_id") REFERENCES "surgeries"("id"),
    FOREIGN KEY ("equipment_id") REFERENCES "equipment"("id")
);

-- Creating Room Equipment associated table
CREATE TABLE "room_equipment" (
    "operating_room_id" INTEGER,
    "equipment_id" INTEGER,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    PRIMARY KEY ("operating_room_id", "equipment_id"),
    FOREIGN KEY ("operating_room_id") REFERENCES "operating_rooms"("id"),
    FOREIGN KEY ("equipment_id") REFERENCES "equipment"("id")
);


-- =========================
-- 2. OPTIMIZATION PART
-- =========================

-- Index: Optimize searching patients by name
CREATE INDEX "idx_patients_name"
ON "patients" ("last_name", "first_name");

-- Index: Optimize searching medical staff by name
CREATE INDEX "idx_medical_staff_name"
ON "medical_staff" ("last_name", "first_name");

-- Index: Optimize filtering medical staff by employment status
CREATE INDEX "idx_medical_staff_status"
ON "medical_staff" ("status");

-- Index: Optimize filtering and sorting surgeries by scheduled date
CREATE INDEX "idx_surgeries_date"
ON "surgeries" ("date");

-- Index: Optimize searching surgeries assigned to an operating room
CREATE INDEX "idx_surgeries_room"
ON "surgeries" ("operating_room_id");

-- Index: Optimize searching surgeries by patient
CREATE INDEX "idx_surgeries_patient"
ON "surgeries" ("patient_id");

-- Index: Optimize filtering surgeries by status
CREATE INDEX "idx_surgeries_status"
ON "surgeries" ("status");

-- Index: Optimize searching surgeries assigned to a staff member
CREATE INDEX "idx_surgery_staff_staff"
ON "surgery_staff" ("staff_id");

-- Index: Optimize searching surgeries that require specific equipment
CREATE INDEX "idx_surgery_equipment_equipment"
ON "surgery_equipment" ("equipment_id");

-- Index: Optimize searching operating rooms containing specific equipment
CREATE INDEX "idx_room_equipment_equipment"
ON "room_equipment" ("equipment_id");

-- =========================
-- 3. VIEWS
-- =========================
-- View: Surgical Schedule
CREATE VIEW "surgical_schedule" AS
SELECT s."date" AS "data",
        ors."room_number" AS "room_number",
        ors."floor" AS "floor",
        p."first_name" AS "patient_first_name",
        p."last_name" AS "patient_last_name",
        pd."name" AS "procedure_name",
        pd."type" AS "procedure_type",
        s."scheduled_start" AS "scheduled_start",
        s."scheduled_end" AS "scheduled_end",
        s."status" AS "status"
FROM "surgeries" AS s
JOIN "operating_rooms" as ors
    ON s."operating_room_id" = ors."id"
JOIN "patients" as p
    ON s."patient_id" = p."id"
JOIN "procedures" AS pd
    ON s."procedure_id" = pd."id";


-- View: Operating Room Status
CREATE VIEW "operating_room_status" AS
SELECT ors."floor",
        ors."room_number",
        ors."status",
        s."date" AS "next_surgery_date",
        s."scheduled_start" AS "next_surgery_start",
        p."first_name" || ' ' || p."last_name" AS "patient",
        pd."name" AS "procedure"
FROM "operating_rooms" AS ors
LEFT JOIN "surgeries" AS s
ON s."id" = (
        SELECT s2."id"
        FROM "surgeries" AS s2
        WHERE s2."operating_room_id" = ors."id"
        AND s2."status" = 'Scheduled'
        ORDER BY s2."date", s2."scheduled_start"
        LIMIT 1
    )
LEFT JOIN "patients" AS p
    ON s."patient_id" = p."id"
LEFT JOIN "procedures" AS pd
    ON pd."id" = s."procedure_id";


-- View: Room Utilization
CREATE VIEW "room_utilization" AS
SELECT ors."floor",
        ors."room_number",
        COUNT(s."id") AS "Total Surgeries",
        ROUND(
            SUM(
                (julianday(s."scheduled_end") - julianday(s."scheduled_start")) * 24 * 60
            ),
            2
        ) AS "Total Scheduled Minutes"
FROM "operating_rooms" AS ors
JOIN "surgeries" AS s
    ON s."operating_room_id" = ors."id"
WHERE s."status" <> 'Cancelled'
GROUP BY ors."floor", ors."room_number"
ORDER BY "Total Surgeries" DESC, "Total Scheduled Minutes" DESC;


-- View: Staff Scheduçle
CREATE VIEW "staff_schedule" AS
SELECT
    s."id" AS "surgery_id",
    mf."id" AS "staff_id",
    mf."first_name",
    mf."last_name",
    ss."professional_role",
    s."date",
    s."scheduled_start",
    s."scheduled_end",
    pd."name" AS "procedure_name",
    ors."floor",
    ors."room_number",
    s."status"
FROM "medical_staff" AS mf
JOIN "surgery_staff" AS ss
    ON mf."id" = ss."staff_id"
JOIN "surgeries" AS s
    ON ss."surgery_id" = s."id"
JOIN "procedures" AS pd
    ON s."procedure_id" = pd."id"
JOIN "operating_rooms" AS ors
    ON s."operating_room_id" = ors."id";

-- ===========================
-- 4. TRIGGERS
-- ===========================

-- Trigger: Prevent overlapping surgeries in the same operating room
CREATE TRIGGER "prevent_room_overlap"
BEFORE INSERT ON "surgeries"
FOR EACH ROW
WHEN EXISTS (
    SELECT 1
    FROM "surgeries"
    WHERE "operating_room_id" = NEW."operating_room_id"
      AND "date" = NEW."date"
      AND "status" != 'Cancelled'
      AND NEW."scheduled_start" < "scheduled_end"
      AND NEW."scheduled_end" > "scheduled_start"
)
BEGIN
    SELECT RAISE(
        ABORT,
        'Operating room is already scheduled for another surgery during this period.'
    );
END;

-- Trigger: Prevent staff from being assigned to overlapping surgeries
CREATE TRIGGER "prevent_staff_overlap"
BEFORE INSERT ON "surgery_staff"
FOR EACH ROW
WHEN EXISTS (
    SELECT 1
    FROM "surgery_staff" AS ss
    JOIN "surgeries" AS s
    ON ss."surgery_id" = s."id"

    JOIN "surgeries" AS new_s
    ON new_s."id" = NEW."surgery_id"
    
    WHERE ss."staff_id" = NEW."staff_id"
      AND s."date" = new_s."date"
      AND s."status" != 'Cancelled'
      AND new_s."status" != 'Cancelled'
      AND new_s."scheduled_start" < s."scheduled_end"
      AND new_s."scheduled_end" > s."scheduled_start"
)
BEGIN
    SELECT RAISE(
        ABORT,
        'Staff member is already assigned to another surgery during this period.'
    );
END;
