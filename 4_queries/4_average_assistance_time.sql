
SELECT AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_request_duration
FROM assistance_requests;

-- CREATE TABLE teachers (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   is_active BOOLEAN DEFAULT TRUE,
--   start_date DATE,
--   end_date DATE
-- );

-- CREATE TABLE assistance_requests (
--   id SERIAL PRIMARY KEY NOT NULL,
--   student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
--   teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
--   assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
--   created_at TIMESTAMP,
--   started_at TIMESTAMP,
--   completed_at TIMESTAMP,
--   student_feedback TEXT,
--   teacher_feedback TEXT
-- );

-- CREATE TABLE students (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255),
--   phone VARCHAR(32),
--   github VARCHAR(255),
--   start_date DATE,
--   end_date DATE,
--   cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
-- );

-- CREATE TABLE assignments (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255),
--   content TEXT,
--   day INTEGER,
--   chapter INTEGER,
--   duration INTEGER
-- );

-- CREATE TABLE assignment_submissions (
--   id SERIAL PRIMARY KEY NOT NULL,
--   assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
--   student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
--   duration INTEGER,
--   submission_date DATE
-- );