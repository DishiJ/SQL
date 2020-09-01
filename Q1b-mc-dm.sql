/* FIT9132 2019 S2 Assignment 3 Q1-Part B ANSWERS

   Student Name: DISHI JAIN
    Student ID:  30759307

   Comments to your marker:
   
*/

/* (i)*/
DROP SEQUENCE seq_resort;

CREATE SEQUENCE seq_resort START WITH 100 INCREMENT BY 1;

/* (ii)*/

INSERT INTO resort VALUES (
    seq_resort.NEXTVAL,
    'Awesome Resort',
    '50 Awesome Road',
    '4830',
    NULL,
    'N',
    (
        SELECT
            town_id
        FROM
            town
        WHERE
            town_lat = - 20.7256
            AND town_long = 139.4927
    ),
    (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name LIKE 'Garrott Gooch'
            AND manager_phone LIKE '6002318099'
    )
);

DROP SEQUENCE seq_cabin;

CREATE SEQUENCE seq_cabin START WITH 1 INCREMENT BY 1;

INSERT INTO cabin VALUES (
    seq_cabin.NEXTVAL,
    seq_resort.CURRVAL,
    3,
    6,
    'Free wi-Fi. kitchen with 400 ltr refrigerator,stove, microwave, pots, pans, silverware,
toaster, electric kettle, TV and utensils'
);

INSERT INTO cabin VALUES (
    seq_cabin.NEXTVAL,
    seq_resort.CURRVAL,
    2,
    4,
    'Free wi-Fi. kitchen with 280 ltr refrigerator,stove, pots, pans, silverware, toaster, electric
kettle, TV and utensils'
);

/* (iii)*/

UPDATE resort
SET
    manager_id = (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name LIKE 'Fonsie Tillard'
            AND manager_phone LIKE '9636535741'
    )
WHERE
    resort_name LIKE 'Awesome Resort';

      
/* (iv)*/

DELETE FROM cabin
WHERE
    resort_id = (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name LIKE 'Awesome Resort'
    );

DELETE FROM resort
WHERE
    resort_name LIKE 'Awesome Resort';
    
COMMIT;