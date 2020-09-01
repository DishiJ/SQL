/* FIT9132 2019 S2 Assignment 3 Q3 ANSWERS

   Student Name: DISHI JAIN
    Student ID:  30759307

   Comments to your marker:
   
*/
/* (i)*/
ALTER TABLE booking ADD booking_state CHAR(1);

COMMENT ON COLUMN booking.booking_state IS
    'State of the booking';

ALTER TABLE booking
    ADD CONSTRAINT ch_booking_state CHECK ( booking_state IN (
        'C',
        'D',
        'F',
        'P'
    ) );

UPDATE booking
SET
    booking_state =
        CASE
            WHEN TO_DATE(booking_to, 'dd-mon-yy') <= SYSDATE  THEN
                'C'
            WHEN TO_DATE(booking_from, 'dd-mon-yy') > SYSDATE THEN
                'F'
            WHEN TO_DATE(booking_from, 'dd-mon-yy') < SYSDATE
                 AND TO_DATE(booking_to, 'dd-mon-yy') > SYSDATE THEN
                'P'
        END;

ALTER TABLE booking MODIFY
    booking_state DEFAULT 'F';

  
/* (ii)*/

ALTER TABLE guest ADD completed_booking NUMBER(10);

COMMENT ON COLUMN guest.completed_booking IS
    'Completed bookings of guest';

UPDATE guest g
SET
    g.completed_booking = (
        SELECT
            COUNT(booking_state)
        FROM
            booking b
        WHERE
            g.guest_no = b.guest_no
            AND b.booking_state LIKE 'C'
    );

/* (iii)*/

INSERT INTO resort VALUES (
    seq_resort.NEXTVAL,
    'Byron Bay Exclusive Resort',
    '10 A Mackay Avenue, VIC',
    '3163',
    4,
    'Y',
    (
        SELECT
            town_id
        FROM
            town
        WHERE
            town_lat = - 28.6474
            AND town_long = 153.6020
    ),
    (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name LIKE 'Clair Lynnett'
            AND manager_phone LIKE '4275368288'
    )
);


DROP TABLE manager_role CASCADE CONSTRAINT ;

CREATE TABLE manager_role
(   role_id           NUMBER(2) NOT NULL,
    role_name         VARCHAR(25) NOT NULL,
    role_short_name   CHAR(2) NOT NULL
);

ALTER TABLE manager_role ADD CONSTRAINT manager_role_pk PRIMARY KEY ( role_id );

COMMENT ON COLUMN manager_role.role_id IS 'Manager role id';

COMMENT ON COLUMN manager_role.role_name IS 'Manager role name';

COMMENT ON COLUMN manager_role.role_short_name IS 'Manager role short name';


INSERT INTO manager_role VALUES(1, 'Bookings Manager' ,'BM');
INSERT INTO manager_role VALUES(2, 'Cleaning Manager' ,'CM');
INSERT INTO manager_role VALUES(3, 'Maintenance Manager' ,'MM'); 


DROP TABLE resort_mang_role CASCADE CONSTRAINT ;
CREATE TABLE resort_mang_role (
    resort_id    NUMBER(4) NOT NULL,
    manager_id   NUMBER(4) NOT NULL,
    role_id      NUMBER(2) NOT NULL
);

ALTER TABLE resort_mang_role
    ADD CONSTRAINT pk_rmr_resort PRIMARY KEY ( resort_id,
                                               manager_id,
                                               role_id );

ALTER TABLE resort_mang_role
    ADD CONSTRAINT fk_rmr_resort FOREIGN KEY ( resort_id )
        REFERENCES resort ( resort_id );

ALTER TABLE resort_mang_role
    ADD CONSTRAINT fk_rmr_manager FOREIGN KEY ( manager_id )
        REFERENCES manager ( manager_id );

ALTER TABLE resort_mang_role
    ADD CONSTRAINT fk_rmr_manager_role FOREIGN KEY ( role_id )
        REFERENCES manager_role ( role_id );

COMMENT ON COLUMN resort_mang_role.resort_id IS
    'Resort ID';

COMMENT ON COLUMN resort_mang_role.manager_id IS
    'Manager ID';

COMMENT ON COLUMN resort_mang_role.role_id IS
    'Manager role ID';

INSERT INTO resort_mang_role VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name LIKE 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            manager_id
        FROM
            resort
        WHERE
            resort_name LIKE 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            role_id
        FROM
            manager_role
        WHERE
            role_name LIKE 'Bookings Manager'
    )
);

INSERT INTO resort_mang_role VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name LIKE 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name LIKE 'Garrott Gooch'
            AND manager_phone LIKE '6002318099'
    ),
    (
        SELECT
            role_id
        FROM
            manager_role
        WHERE
            role_name LIKE 'Cleaning Manager'
    )
);

INSERT INTO resort_mang_role VALUES (
    (
        SELECT
            resort_id
        FROM
            resort
        WHERE
            resort_name LIKE 'Byron Bay Exclusive Resort'
    ),
    (
        SELECT
            manager_id
        FROM
            manager
        WHERE
            manager_name LIKE 'Fonsie Tillard'
            AND manager_phone LIKE '9636535741'
    ),
    (
        SELECT
            role_id
        FROM
            manager_role
        WHERE
            role_name LIKE 'Maintenance Manager'
    )
);

COMMIT;
