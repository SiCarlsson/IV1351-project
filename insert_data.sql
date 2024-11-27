INSERT INTO public.person (first_name,last_name,social_security_number,street_name,city,zip_code)
VALUES
  ('Glenna','Ward',451263943466,'Ap #811-686 Fermentum St.','Gävle','03385'),
  ('Kyra','Morrison',654426128616,'425-9573 At Ave','Linköping','31662'),
  ('Nigel','Duffy',507918322794,'Ap #389-567 A, Rd.','Trollhättan','03822'),
  ('Kaye','Jensen',128801925403,'P.O. Box 922, 6009 Ipsum St.','Bollnäs','87287'),
  ('Duncan','Morse',848308449621,'811-4223 Dis Av.','Hofors','52546'),
  ('Kirestin','Combs',324929538938,'Ap #596-8613 Donec Street','Motala','56240'),
  ('Vivien','Knight',200285840255,'Ap #504-7831 Urna. Rd.','Boo','55811'),
  ('Jacob','Garrett',613276812763,'329-6594 Diam. Street','Gävle','97641');

INSERT INTO public.student (age,person_id)
VALUES
  (102,1),
  (4,2),
  (54,3),
  (76,4),
  (25,5);

INSERT INTO public.skill_level (skill_level, instrument)
VALUES
  ('Beginner', 'Piano'),
  ('Intermediate', 'Piano'),
  ('Advanced', 'Piano'),
  ('Beginner', 'Guitar'),
  ('Intermediate', 'Guitar'),
  ('Advanced', 'Guitar'),
  ('Beginner', 'Drums'),
  ('Intermediate', 'Drums'),
  ('Advanced', 'Drums');

INSERT INTO public.student_skill_level (student_id, skill_level_id)
VALUES
  (1, 2),
  (2, 1),
  (3, 6),
  (4, 3),
  (5, 7),
  (3, 8),
  (4, 2);

INSERT INTO public.contact_person (relationship, student_id)
VALUES
  ('mother', 2);

INSERT INTO public.email (email)
VALUES
    ('florindix@fakemail.com'),
    ('zermoxia@dummy.net'),
    ('gloptrix@nomail.org'),
    ('bortikus@tempmail.net'),
    ('yinkrola@nowhere.com'),
    ('plestavo@nullbox.org'),
    ('wrandico@fakeemail.com'),
    ('drifolio@placeholder.org'),
    ('krixover@mockmail.net');

INSERT INTO public.contact_person_email (contact_person_id,email_id)
VALUES
    (1,9);
  
INSERT INTO public.person_email (person_id,email_id)
VALUES
    (1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8);

INSERT INTO public.phone (phone_nr)
VALUES
    ('0701234567'),  
    ('0709876543'),  
    ('0812345678'),  
    ('0401234567'),  
    ('0312345678'),  
    ('0760012345'),  
    ('0739281736'),  
    ('0901234567'),  
    ('0712839476'); 

INSERT INTO public.person_phone (person_id,phone_id)
VALUES
    (1,2),  
    (2,4),  
    (3,1),  
    (4,7),  
    (5,8),  
    (6,3),  
    (7,5),  
    (8,6);  

INSERT INTO public.contact_person_phone (contact_person_id,phone_id)
VALUES
    (1,9); 

INSERT INTO public.instructor (is_employed,person_id)
VALUES
    ('Yes',6), 
	('Yes',7),
	('Yes',8);

INSERT INTO public.known_instruments (instrument)
VALUES
    ('Piano'), 
	('Guitar'),
	('Drums');

INSERT INTO public.instructor_known_instruments (instructor_id, known_instruments_id)
VALUES
    (1,2), 
	(1,1),
	(2,2),
	(2,1),
	(3,1);

INSERT INTO public.type_of_lesson_availability (type_of_lesson)
VALUES
    ('Individual'), 
	('Group'),
	('Ensemble');  

INSERT INTO public.instructor_type_of_lesson_availability (instructor_id,type_of_lesson_availability_id)
VALUES
    (1,1), 
	(1,3),
	(2,1),
	(2,2),
	(2,3),
	(3,2); 
 
INSERT INTO public.lesson (date, time, duration, instructor_id)
VALUES
('2024-10-22', '10:00:00', 60, 1),
('2024-10-23', '11:30:00', 45, 2),
('2024-10-24', '09:00:00', 90, 3),
('2024-10-25', '14:15:00', 30, 1),
('2024-11-22', '10:00:00', 60, 1),
('2024-11-23', '11:30:00', 45, 2),
('2024-11-24', '09:00:00', 90, 3),
('2024-12-25', '14:15:00', 30, 1),
('2024-12-26', '16:00:00', 60, 2),
('2024-12-26', '16:00:00', 60, 2);


INSERT INTO public.lesson_price_scheme (lesson_type, skill_level, price_per_lesson, price_from_date)
VALUES
('group_lesson', 'Beginner', 200, '2024-11-01'),
('group_lesson', 'Intermediate', 250, '2024-11-01'),
('group_lesson', 'Advanced', 300, '2024-11-01'),
('ensemble', 'Beginner', 350, '2024-11-01'),
('ensemble', 'Intermediate', 400, '2024-11-01'),
('ensemble', 'Advanced', 450, '2024-11-01'),
('individual_lesson', 'Beginner', 500, '2024-11-01'),
('individual_lesson', 'Intermediate', 600, '2024-11-01'),
('individual_lesson', 'Advanced', 700, '2024-11-01'),
('group_lesson', 'Beginner', 180, '2024-11-15'),
('group_lesson', 'Intermediate', 220, '2024-11-15'),
('group_lesson', 'Advanced', 270, '2024-11-15'),
('ensemble', 'Beginner', 320, '2024-11-15'),
('ensemble', 'Intermediate', 370, '2024-11-15'),
('ensemble', 'Advanced', 420, '2024-11-15'),
('individual_lesson', 'Beginner', 550, '2024-11-15'),
('individual_lesson', 'Intermediate', 650, '2024-11-15'),
('individual_lesson', 'Advanced', 750, '2024-11-15');

INSERT INTO public.individual_lesson (specific_instrument, lesson_id)
VALUES
('Piano', 1),
('Guitar', 2),
('Drums', 3),
('Guitar', 4),
('Piano', 5);

INSERT INTO public.group_based_lesson (minimum_number_of_spots, maximum_number_of_spots,lesson_id)
VALUES
(2,10,6),
(5,10,7),
(7,12,8),
(10,15,9),
(5,15,10);

INSERT INTO public.group_lesson (skill_level,specific_instrument,group_based_lesson_id)
VALUES
('Intermediate','Piano',1),
('Advanced','Drums',2),
('Intermediate','Guitar',3);

INSERT INTO public.ensemble (genre,group_based_lesson_id)
VALUES
('Jazz',4),
('Gospel',5);

INSERT INTO public.lesson_student (lesson_id,student_id)
VALUES
(1,2),
(2,3),
(3,4),
(4,1),
(5,5),
(4,3),
(5,4);

INSERT INTO public.instrumental_storage (instrument_brand, quantity)
VALUES
('Yamaha', 15),
('Fender', 7),
('Gibson', 3),
('Roland', 10),
('Korg', 8),
('Casio', 12),
('Ibanez', 5),
('Pearl', 6),
('Boss', 20),
('Behringer', 9);

INSERT INTO public.instrumental_lease (type_of_instrument, start_date, end_date, student_id, instrumental_storage_id)
VALUES
('Guitar', '2024-01-15', '2024-06-15', 4, 2),
('Piano', '2024-02-01', '2024-08-01', 4, 3),
('Piano', '2024-03-10', '2024-09-10', 1, 5),
('Piano', '2024-04-05', '2024-10-05', 2, 7);

INSERT INTO public.instrumental_price_scheme (type_of_instrument,fee_per_month,price_from_date)
VALUES
('Guitar', 150, '2024-01-01'),
('Piano', 300, '2024-01-01'),
('Drums', 250, '2024-01-01'),
('Guitar', 160, '2024-07-01'),
('Piano', 320, '2024-07-01'),
('Drums', 270, '2024-07-01');

INSERT INTO public.sibling (student_id)
VALUES
(1),
(2),
(3),
(5);

INSERT INTO public.student_sibling (student_id,sibling_id)
VALUES
(1,4),
(5,1),
(2,3),
(3,2),
(3,4),
(5,3);