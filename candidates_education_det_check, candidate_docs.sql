CREATE TABLE candidates_education_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);

CREATE TABLE candidate_docs(
  id int NOT NULL,
  candidate_id int NOT NULL,
  doc_type varchar(20) DEFAULT NULL,
  doc_path varchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates (id),
  PRIMARY KEY (id)
) 


CREATE TABLE user_details (
  id int NOT NULL,
  email varchar(50) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  password varchar(15) NOT NULL,
  contact_number bigint NOT NULL,
  verified bit DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (email)
) 


CREATE TABLE user_roles (
  user_id int primary key ,
  role_name varchar(100)
) 


CREATE TABLE company(
  id int,
  name int NOT NULL,
  address varchar(150) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
)

CREATE TABLE tech_type (
  id int primary key,
  type_name varchar(50) NOT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
) 


CREATE TABLE maker_program(
  id int NOT NULL,
  program_name int NOT NULL,
  program_type varchar(10) DEFAULT NULL,
  program_link varchar(MAX) DEFAULT NULL,
  tech_stack_id int DEFAULT NULL,
  tech_type_id int NOT NULL,
  is_program_approved int,
  description varchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  FOREIGN KEY (tech_stack_id) REFERENCES tech_stack (id),
  FOREIGN KEY (tech_type_id) REFERENCES tech_type (id),
  PRIMARY KEY (id)
) 


CREATE TABLE tech_stack (
  id int primary key,
  tech_name varchar(50) NOT NULL,
  image_path varchar(500) DEFAULT NULL,
  framework varchar(Max) DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
)


CREATE TABLE lab(
  id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  address  varchar(255) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
) 


CREATE TABLE app_parameters (
  id int primary key,
  key_type varchar(20) NOT NULL,
  key_value varchar(20) NOT NULL,
  key_text varchar(80) DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  seq_num int DEFAULT NULL,
  unique (key_type,  key_value)
)

CREATE TABLE mentor(
  id int,
  name varchar(50) DEFAULT NULL,
  mentor_type varchar(20) DEFAULT NULL,
  lab_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  FOREIGN KEY (lab_id) REFERENCES mentor(id),
  PRIMARY KEY (id)
)


CREATE TABLE mentor_ideation_map(
  id int,
  mentor_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  FOREIGN KEY (mentor_id) REFERENCES mentor (id),
  PRIMARY KEY (id)
)


CREATE TABLE mentor_techstack(
  id int NOT NULL,
  mentor_id int NOT NULL,
  tech_stack_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (mentor_id) REFERENCES mentor (id),
  FOREIGN KEY (tech_stack_id) REFERENCES tech_stack (id)
)


CREATE TABLE lab_threshold(
  id int NOT NULL,
  lab_id int NOT NULL,
  lab_capacity varchar(50) DEFAULT NULL,
  lead_threshold int DEFAULT NULL,
  ideation_engg_threshold int DEFAULT NULL,
  buddy_engg_threshold int DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (lab_id) REFERENCES lab (id)
  ) 


CREATE TABLE company_requirement(
id int NOT NULL,
company_id int NOT NULL,
candidate_id int NOT NULL,
requested_month varchar(20) NOT NULL,
city varchar(20) DEFAULT NULL,
is_doc_verification int DEFAULT 1,
requirement_doc_path varchar(500) DEFAULT NULL,
no_of_engg int NOT NULL,
tech_stack_id int NOT NULL,
tech_type_id int NOT NULL,
maker_programs_id int NOT NULL,
lead_id int NOT NULL,
ideateion_engg_id int DEFAULT NULL,
buddy_engg_id int  DEFAULT NULL,
special_remark varchar(Max) DEFAULT NULL,
status int DEFAULT 1,
creator_stamp datetime DEFAULT NULL,
creator_user int DEFAULT NULL,
FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates(id),
PRIMARY KEY(id)
)


CREATE TABLE candidate_techstack_assignment(
  id int NOT NULL,
  requirement_id int NOT NULL,
  candidate_id int NOT NULL,
  assign_date datetime DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  FOREIGN KEY (requirement_id) REFERENCES company_requirement (id),
  FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates (id),
  PRIMARY KEY (id)
)

CREATE TABLE user_engagement_MIS(
id int,
candidate_id int NOT NULL,
date_of_attendancce datetime DEFAULT NULL,
time_of_attendance datetime DEFAULT NULL,
email_id varchar(50) NOT NULL,
FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates (id),
PRIMARY KEY (id)
) 

CREATE TABLE temporary_MIS(
Date_Time  DATE NOT NULL,
Cpu_Count int NOT NULL,
Cpu_Working_Time Decimal(11,3) NOT NULL,
Cpu_idle_Time Decimal(11,3) NOT NULL,
cpu_percent Decimal(11,3) NOT NULL,
Usage_cpu_count int NOT NULL,
number_of_software_interrupts_since_boot Decimal(11,3) NOT NULL,
number_of_system_calls_since_boot int NOT NULL,
number_of_interrupts_since_boot int NOT NULL,
cpu_avg_load_over_1_min Decimal(11,3) NOT NULL,
cpu_avg_load_over_5_min   Decimal(11,3) NOT NULL,
cpu_avg_load_over_15_min Decimal(11,3) NOT NULL,
system_total_memory BIGINT NOT NULL,
system_used_memory BIGINT  NOT NULL,
system_free_memory BIGINT NOT NULL,
system_active_memory BIGINT NOT NULL,
system_inactive_memory BIGINT NOT NULL,
system_buffers_memory BIGINT NOT NULL,
system_cached_memory BIGINT NOT NULL,
system_shared_memory BIGINT NOT NULL,
system_avalible_memory BIGINT NOT NULL,
disk_total_memory BIGINT NOT NULL,
disk_used_memory BIGINT NOT NULL,
disk_free_memory BIGINT NOT NULL,
disk_read_count BIGINT NOT NULL,
disk_write_count BIGINT NOT NULL,
disk_read_bytes BIGINT NOT NULL,
disk_write_bytes BIGINT NOT NULL,
time_spent_reading_from_disk BIGINT NOT NULL,
time_spent_writing_to_disk BIGINT NOT NULL,
time_spent_doing_actual_Input_Output BIGINT NOT NULL,
number_of_bytes_sent BIGINT NOT NULL,
number_of_bytes_received BIGINT NOT NULL,
number_of_packets_sent BIGINT NOT NULL,
number_of_packets_recived BIGINT NOT NULL,
total_number_of_errors_while_receiving BIGINT NOT NULL,
total_number_of_errors_while_sending BIGINT NOT NULL,
total_number_of_incoming_packets_which_were_dropped BIGINT NOT NULL,
total_number_of_outgoing_packets_which_were_dropped BIGINT NOT NULL,
boot_time varchar(100) NOT NULL,
user_name varchar(50) NOT NULL,
keyboard int NOT NULL,
mouse int NOT NULL,
technology varchar(100) NOT NULL,
files_changed int NOT NULL,
PRIMARY KEY (user_name)
)


CREATE TABLE user_engagement_MISS(
id int,
candidate_id int NOT NULL,
Date_Time  DATE NOT NULL,
Cpu_Count int NOT NULL,
Cpu_Working_Time Decimal(11,3) NOT NULL,
Cpu_idle_Time Decimal(11,3) NOT NULL,
cpu_percent Decimal(11,3) NOT NULL,
Usage_cpu_count int NOT NULL,
number_of_software_interrupts_since_boot Decimal(11,3) NOT NULL,
number_of_system_calls_since_boot int NOT NULL,
number_of_interrupts_since_boot int NOT NULL,
cpu_avg_load_over_1_min Decimal(11,3) NOT NULL,
cpu_avg_load_over_5_min   Decimal(11,3) NOT NULL,
cpu_avg_load_over_15_min Decimal(11,3) NOT NULL,
system_total_memory BIGINT NOT NULL,
system_used_memory BIGINT NOT NULL,
system_free_memory BIGINT NOT NULL,
system_active_memory BIGINT NOT NULL,
system_inactive_memory BIGINT NOT NULL,
system_buffers_memory BIGINT NOT NULL,
system_cached_memory BIGINT NOT NULL,
system_shared_memory BIGINT NOT NULL,
system_avalible_memory BIGINT NOT NULL,
disk_total_memory BIGINT NOT NULL,
disk_used_memory BIGINT NOT NULL,
disk_free_memory BIGINT NOT NULL,
disk_read_count BIGINT NOT NULL,
disk_write_count BIGINT NOT NULL,
disk_read_bytes BIGINT NOT NULL,
disk_write_bytes BIGINT NOT NULL,
time_spent_reading_from_disk BIGINT NOT NULL,
time_spent_writing_to_disk BIGINT NOT NULL,
time_spent_doing_actual_Input_Output BIGINT NOT NULL,
number_of_bytes_sent BIGINT NOT NULL,
number_of_bytes_received BIGINT NOT NULL,
number_of_packets_sent BIGINT NOT NULL,
number_of_packets_recived BIGINT NOT NULL,
total_number_of_errors_while_receiving BIGINT NOT NULL,
total_number_of_errors_while_sending BIGINT NOT NULL,
total_number_of_incoming_packets_which_were_dropped BIGINT NOT NULL,
total_number_of_outgoing_packets_which_were_dropped BIGINT NOT NULL,
boot_time varchar(100) NOT NULL,
keyboard int NOT NULL,
mouse int NOT NULL,
technology varchar(100) NOT NULL,
files_changed int NOT NULL,
FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates(id),
PRIMARY KEY (id)
)


insert into user_engagement_MISS select * from fellowship_candidates LEFT  JOIN temporary_MIS ON fellowship_candidates.email=temporary_MIS.user_name
UNION
(select * from   fellowship_candidates  RIGHT  JOIN temporary_MIS     ON fellowship_candidates.email=temporary_MIS.user_name);


insert into user_engagement_MIS 
select id,first_name, middle_name , last_name, mobile_num,   hired_city,
hired_date, degree, aggr_per,  current_pincode, permanent_pincode, hired_lab,
attitude_remark, communication_remark,  knowledge_remark,   birth_date ,
is_birth_date_verified,  parent_name,  parent_occupation,   parent_mobile_num ,
parent_annual_sal,  local_addr,  permanent_addr,   photo_path ,  joining_date,  
candidate_status,  personal_info_filled,   bank_info_filled,  educational_info_filled,
doc_status,  remark ,  creator_stamp, creator_user
from fellowship_candidates LEFT  JOIN temporary_MIS  ON fellowship_candidates.email=temporary_MIS.user_name
UNION
(select id,first_name, middle_name , last_name, mobile_num,   hired_city,
hired_date, degree, aggr_per,  current_pincode, permanent_pincode, hired_lab,
attitude_remark, communication_remark,  knowledge_remark,   birth_date ,
is_birth_date_verified,  parent_name,  parent_occupation,   parent_mobile_num ,
parent_annual_sal,  local_addr,  permanent_addr,   photo_path ,  joining_date,  
candidate_status,  personal_info_filled,   bank_info_filled,  educational_info_filled,
doc_status,  remark ,  creator_stamp, creator_user
from fellowship_candidates RIGHT  JOIN temporary_MIS  ON fellowship_candidates.email=temporary_MIS.user_name);


(select Date_Time, Cpu_Count, Cpu_Working_Time, Cpu_idle_Time, cpu_percent,
Usage_cpu_count, number_of_software_interrupts_since_boot , number_of_system_calls_since_boot, number_of_interrupts_since_boot,
cpu_avg_load_over_1_min, cpu_avg_load_over_5_min, cpu_avg_load_over_15_min,
system_total_memory , system_used_memory, system_free_memory, system_active_memory, system_inactive_memory,  system_buffers_memory,
system_cached_memory, system_shared_memory, system_avalible_memory, disk_total_memory, disk_used_memory, disk_free_memory , disk_read_count,
disk_write_count, disk_read_bytes , disk_write_bytes, time_spent_reading_from_disk,
time_spent_writing_to_disk, time_spent_doing_actual_Input_Output, number_of_bytes_sent ,
number_of_bytes_received, number_of_packets_sent, number_of_packets_recived,
total_number_of_errors_while_receiving, total_number_of_errors_while_sending,
total_number_of_incoming_packets_which_were_dropped, total_number_of_outgoing_packets_which_were_dropped, boot_time, keyboard, mouse,
technology, files_changed
from   fellowship_candidates  RIGHT  JOIN temporary_MIS     ON fellowship_candidates.email=temporary_MIS.user_name);



create procedure produce_user_engagement_MIS_data
As
begin
insert into user_engagement_MIS select * from fellowship_candidates LEFT  JOIN temporary_MIS     ON fellowship_candidates.email=temporary_MIS.user_name
UNION
(select * from   fellowship_candidates  LEFT  JOIN temporary_MIS     ON fellowship_candidates.email=temporary_MIS.user_name) ;
END

EXEC produce_user_engagement_MIS_data;