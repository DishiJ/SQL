/* FIT9132 2019 S2 Assignment 3 Q4 ANSWERS

   Student Name:  DISHI JAIN
    Student ID:   30759307

   Comments to your marker:
   
*/

/* (i)*/
CREATE OR REPLACE TRIGGER comp_booking AFTER
    UPDATE OF booking_state ON booking
    FOR EACH ROW
BEGIN
    UPDATE guest
    SET
        completed_booking = completed_booking + 1
    WHERE
        :new.booking_state = 'C'
        AND :old.booking_state != 'C'
        AND guest_no = :new.guest_no;

END;
/

--Before state

SELECT
    *
FROM
    guest;

SELECT
    *
FROM
    booking;

--Testing trigger

UPDATE booking
SET
    booking_state = 'C'
WHERE
    booking_id = 24;

--After state

SELECT
    *
FROM
    guest;

/* (ii)*/

CREATE OR REPLACE TRIGGER review_chk BEFORE
    INSERT ON review
    FOR EACH ROW
DECLARE
    flag DATE;
BEGIN
    SELECT
        MIN(booking_to)
    INTO flag
    FROM
        booking
    WHERE
        booking.guest_no = :new.guest_no
        AND booking.resort_id = :new.resort_id;

    IF flag > :new.review_date THEN
        raise_application_error(-20100, 'Invalid Review Before stay completed');
    END IF;
    IF flag IS NULL THEN
        raise_application_error(-20100, 'Invalid Review. No stay recorded');
    END IF;
END;
/

--Testing trigger when stay not completed

INSERT INTO review VALUES (
    10,
    'Wonderful stay. Amazing hotel.',
    TO_DATE('01-jan-2019', 'dd-mon-yyyy'),
    4,
    10,
    16
);

--Testing trigger when no booking present

INSERT INTO review VALUES (
    11,
    'Bad stay.',
    TO_DATE('30-oct-2019', 'dd-mon-yyyy'),
    4,
    1,
    12
);

/* (iii)*/

CREATE OR REPLACE TRIGGER booking_conflict BEFORE
    INSERT OR UPDATE ON booking
    FOR EACH ROW
DECLARE
    bookingcount NUMBER DEFAULT 0;
BEGIN
    SELECT
        COUNT(booking_id)
    INTO bookingcount
    FROM
        booking
    WHERE
        ( ( :new.booking_from >= booking_from
            AND booking_to >= :new.booking_from )
          OR ( :new.booking_to >= booking_from
               AND booking_to >= :new.booking_to )
          OR ( :new.booking_to > booking_to
               AND :new.booking_from < booking_from ) )
        AND resort_id = :new.resort_id
        AND cabin_no = :new.cabin_no;

    IF ( bookingcount > 0 ) THEN
        raise_application_error(-20000, 'Error: Booking can't be inserted');
    END IF;
END;
/

--Inserting into booking with cabin 1 resort 1

INSERT INTO booking VALUES (
    91,
    TO_DATE('10-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('20-jun-2019', 'dd-mon-yyyy'),
    3,
    3,
    600,
    8,
    1,
    11,
    'F'
);

SET SERVEROUTPUT ON

SET ECHO ON

--Inserting into booking with cabin 2 resort 15

INSERT INTO booking VALUES (
    92,
    TO_DATE('12-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('18-jun-2019', 'dd-mon-yyyy'),
    2,
    3,
    500,
    9,
    2,
    15,
    'F'
);

--Before state

SELECT
    *
FROM
    booking;

--Testing trigger
--Inserting into booking with cabin 2 resort 15 again. between 12 june to 18 june 2019. Shows error.

INSERT INTO booking VALUES (
    92,
    TO_DATE('11-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('15-jun-2019', 'dd-mon-yyyy'),
    2,
    3,
    500,
    3,
    2,
    15,
    'F'
);

--Inserting into booking with cabin 2 resort 15 again. start before 12 june and end before 18 june 2019. Shows error.

INSERT INTO booking VALUES (
    93,
    TO_DATE('11-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('15-jun-2019', 'dd-mon-yyyy'),
    2,
    3,
    500,
    4,
    2,
    15,
    'F'
);

--Inserting into booking with cabin 2 resort 15 again. start after 12 june and end after 18 june 2019. Shows error.

INSERT INTO booking VALUES (
    94,
    TO_DATE('14-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('20-jun-2019', 'dd-mon-yyyy'),
    2,
    3,
    500,
    3,
    2,
    15,
    'F'
);

--Inserting into booking with cabin 2 resort 15 again. start at 12 june and end at 18 june 2019. Shows error.

INSERT INTO booking VALUES (
    95,
    TO_DATE('12-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('18-jun-2019', 'dd-mon-yyyy'),
    2,
    3,
    500,
    3,
    2,
    15,
    'F'
);

--Inserting into booking with cabin 2 resort 15 again. start before 12 june and end after 18 june 2019. Shows error.

INSERT INTO booking VALUES (
    96,
    TO_DATE('10-jun-2019', 'dd-mon-yyyy'),
    TO_DATE('20-jun-2019', 'dd-mon-yyyy'),
    2,
    3,
    500,
    3,
    2,
    15,
    'F'
);

--After state

SELECT
    *
FROM
    booking;

--Undoing changes

ROLLBACK;

SET ECHO OFF;