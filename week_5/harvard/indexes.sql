CREATE INDEX "enrollments_index"
ON "enrollments"("student_id", "course_id");

CREATE INDEX "enrollments_course_student_index"
ON "enrollments"("course_id", "student_id");

CREATE INDEX "satisfies_index"
ON "satisfies"("course_id", "requirement_id");



