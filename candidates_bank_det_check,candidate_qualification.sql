CREATE TABLE candidates_bank_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);


CREATE TABLE candidate_qualification(
  id int,
  candidate_id int NOT NULL,
  diploma int DEFAULT 0,
  degree_name varchar(10) NOT NULL,
  is_degree_name_verified int DEFAULT 0,
  employee_decipline varchar(100) NOT NULL,
  is_employee_decipline_verified int DEFAULT 0,
  passing_year int NOT NULL,
  is_passing_year_verified int DEFAULT 0,
  aggr_per double precision DEFAULT NULL,
  final_year_per double precision DEFAULT NULL,
  is_final_year_per_verified int DEFAULT 0,
  training_institute varchar(20) NOT NULL,
  is_training_institute_verified int DEFAULT 0,
  training_duration_month int DEFAULT NULL,
  is_training_duration_month_verified int DEFAULT 0,
  other_training varchar(255) DEFAULT NULL,
  is_other_training_verified int DEFAULT 0,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
 FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates(id),
 PRIMARY KEY (id)
)


