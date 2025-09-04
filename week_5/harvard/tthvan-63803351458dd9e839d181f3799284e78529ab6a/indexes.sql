CREATE INDEX "enrolment_courseid" ON enrollments (course_id);
CREATE INDEX "enrolment_studentid" ON enrollments (student_id);
CREATE INDEX "course_id" ON courses(id);
CREATE INDEX "course_department_sem" ON courses(department, semester);
CREATE INDEX "course_title_sem" ON courses(title, semester);
CREATE INDEX "course_dep_sem_num" ON courses(department, semester, number);
CREATE INDEX "satisfies_courseid" ON satisfies(course_id);

