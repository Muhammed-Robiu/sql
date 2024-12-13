CREATE TABLE job_applied (
    job_id INT,
    app_date date,
    custom_resume boolean,
    resume_file_name varchar(255),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);

select *
FROM job_applied;

INSERT INTO job_applied 
    (job_id,
    app_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status)
values 
    (1,
    '2024-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_01.pdf',
    'submitted'),
    (2,
    '2024-02-02',
    true,
    'resume_02.pdf',
    true,
    'cover_02.pdf',
    'assesement'),
    (3,
    '2024-02-03',
    false,
    'resume_03.pdf',
    false,
    'NULL',
    'rejected'),
    (4,
    '2024-02-04',
    true,
    'resume_04.pdf',
    true,
    'cover_02.pdf',
    'interview_scheduled'), 
    (5,
    '2024-02-05',
    true,
    'resume_05.pdf',
    false,
    'NULL',
    'submitted');

ALTER TABLE job_applied
ADD contact varchar(50)

update  job_applied
set contact = 'leminae mary'
where job_id = 1;

update  job_applied
set contact = 'bash ade'
where job_id = 2;

update  job_applied
set contact = 'umu rose'
where job_id = 3;

update  job_applied
set contact = 'rita ora'
where job_id = 4;

update  job_applied
set contact = 'four khay'
where job_id = 5;

select *
FROM job_applied;

ALTER TABLE job_applied
rename column contact to contact_name;

ALTER TABLE job_applied
ALTER column contact_name type text;

ALTER TABLE job_applied
drop column contact_name;

DROP TABLE job_applied;