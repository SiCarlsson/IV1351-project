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

INSERT INTO public.student (age,has_sibling,active_leases,person_id)
VALUES
  (102,'No',1,1),
  (4,'Yes',1,2),
  (54,'Yes',0,3),
  (76,'Yes',2,4),
  (25,'No',0,5);

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
	(1,3),
	(2,3),
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
    