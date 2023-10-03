
-- create
CREATE TABLE user (
    email VARCHAR(100) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_approved_date DATETIME, 
    user_sign_up_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_role ENUM('user', 'admin') DEFAULT 'user',
    user_status ENUM('approved', 'signed_up','manually_added') DEFAULT 'signed_up',
	temp_pwd ENUM('yes','no') DEFAULT 'no';,
	g2fa_key varchar(300);
);


desc user;

-- insert initial details
INSERT INTO user 
(email,first_name,last_name,password)
VALUES 
('test@gmail.com', 'Clark', 'Sales','12345');


-- add admin
INSERT INTO user 
(email,first_name,last_name,password,user_role,user_status,user_approved_date)
VALUES 
('lemos@gmail.com', 'Lemos', 'Nifme','121212','admin','manually_added',now());



-- update user_status by admin
UPDATE user
SET 
user_status = 'approved', 
user_approved_date = CURRENT_TIMESTAMP
WHERE email='test@gmail.com';


-- for admin approval
select email from user where user_status = 'signed_up';



-- at login page
-- check whether user has been approved
select user_status where email='____________' and password;  


-- at sign up stage
check username availability 

SELECT first_name FROM user WHERE email = ? LIMIT 1;



-- change user_role to admin
UPDATE user
SET 
user_status = 'manually_added', 
user_approved_date = CURRENT_TIMESTAMP,
user_role = 'admin'
WHERE email='lemos@gmail.com';






UPDATE user
SET 
user_status = 'manually_added', 
user_approved_date = CURRENT_TIMESTAMP,
user_role = 'admin'
WHERE email='kumu@gmail.com';





UPDATE user
SET 
user_status = 'approved', 
user_approved_date = CURRENT_TIMESTAMP
WHERE email='test2@gmail.com';


UPDATE user
SET 
user_status = 'signed_up', 
user_approved_date = CURRENT_TIMESTAMP
WHERE email='test3@gmail.com';

UPDATE user
SET 
user_status = 'signed_up', 
user_approved_date = CURRENT_TIMESTAMP
WHERE email='newuser@gmail.com';

UPDATE user
SET 
first_name = 'test', 
last_name = 'user'
WHERE email='test2@gmail.com';



 
ALTER TABLE user MODIFY user_status ENUM('approved', 'signed_up','manually_added') DEFAULT 'signed_up';

ALTER TABLE user
ADD temp_pwd ENUM('yes','no') DEFAULT 'no';


ALTER TABLE user
ADD g2fa_key varchar(300);

josha19980815@gmail.com


UPDATE user
SET 
user_status = 'manually_added', 
user_approved_date = CURRENT_TIMESTAMP,
user_role = 'admin'
WHERE email='kumushinithennakoon@gmail.com';



UPDATE user
SET 
user_status = 'signed_up', 
user_approved_date = CURRENT_TIMESTAMP
WHERE email='test4@gmail.com';



ALTER TABLE user 
ADD COLUMN user_status ENUM('approved', 'signed_up','manually_added')
DEFAULT 'signed_up';

DELETE FROM user WHERE email = 'annemarie19950215@gmail.com';