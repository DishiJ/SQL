/* FIT9132 2019 S2 Assignment 3 Q2 ANSWERS

   Student Name: DISHI JAIN
    Student ID:  30759307

   Comments to your marker:
   
*/

/* (i)*/
SELECT
    r.resort_name,
    r.resort_street_address
    || ' '
    || t.town_name
    || ' '
    || r.resort_pcode AS "RESORT ADDRESS",
    m.manager_name,
    m.manager_phone
FROM
    ( ( resort    r
    JOIN town      t ON r.town_id = t.town_id )
    JOIN manager   m ON r.manager_id = m.manager_id )
WHERE
    r.resort_star_rating IS NULL
    AND r.resort_livein_manager LIKE 'Y'
ORDER BY
    r.resort_pcode DESC,
    r.resort_name;

/* (ii)*/

SELECT
    b.resort_id,
    r.resort_name,
    r.resort_street_address,
    t.town_name,
    t.town_state,
    r.resort_pcode,
    '$'
    || round(SUM(b.booking_charge), 2) AS total_booking_charges
FROM
    booking   b
    JOIN resort    r ON b.resort_id = r.resort_id
    JOIN town      t ON r.town_id = t.town_id
HAVING
    SUM(b.booking_charge) > AVG(b.booking_charge)
GROUP BY b.resort_id, r.resort_name, r.resort_street_address, t.town_name, t.town_state, r.resort_pcode
ORDER BY b.resort_id;

    
/* (iii)*/

SELECT rv.review_id , rv.guest_no, g.guest_name, rs.resort_id,  rs.resort_name, rv.review_comment , to_char(rv.review_date) AS DATE_REVIEWED
FROM review rv
LEFT OUTER JOIN  booking b ON b.resort_id = rv.resort_id AND b.guest_no = rv.guest_no
JOIN guest g ON rv.guest_no = g.guest_no
JOIN resort rs ON rs.resort_id = rv.resort_id
WHERE b.resort_id IS NULL Or to_date(rv.review_date,'dd-mon-yyyy') < (select min(to_date(b.BOOKING_TO,'dd-mon-yyyy')) from booking where booking_to = b.booking_to)
ORDER BY rv.review_date;


/* (iv)*/

SELECT c.resort_id, r.resort_name,  'Has ' ||
    COUNT(c.cabin_no) || ' cabins in total with ' ||
    COUNT(CASE WHEN c.cabin_bedrooms > 2 THEN 1 END) || ' having more than 2 bedrooms ' AS ACCOMMODATION_AVAILABLE
FROM cabin c
JOIN resort r ON c.resort_id = r.resort_id
group by c.resort_id, r.resort_name
order by r.resort_name;

 
/* (v)*/

SELECT r.resort_id, r.resort_name , 
CASE 
     WHEN r.resort_livein_manager LIKE 'Y' 
     THEN 'Yes' 
     ELSE 'No' END AS LIVE_IN_MANAGER ,
CASE WHEN r.resort_star_rating is not null 
     THEN (CAST(r.resort_star_rating  AS varchar2(255)))
     ELSE 'No Ratings' END AS STAR_RATING,
m.manager_name , m.manager_phone, count(b.booking_id) AS NUMBER_OF_BOOKINGS 
FROM booking b
JOIN resort r  ON b.resort_id = r.resort_id
JOIN manager m ON m.manager_id = r.manager_id
HAVING count(b.booking_id) = ( select max(count(booking_id)) from booking group by resort_id)
GROUP BY r.resort_id,
r.resort_name,
        CASE
            WHEN r.resort_livein_manager LIKE 'Y' THEN
                'Yes'
            ELSE
                'No'
        END,
        CASE
            WHEN r.resort_star_rating IS NOT NULL THEN
                ( CAST(r.resort_star_rating AS VARCHAR2(255)) )
            ELSE
                'No Ratings'
        END, m.manager_name,
  m.manager_phone order by
r.resort_id;

   
/* (vi)*/

SELECT
    r.resort_id,
    r.resort_name,
    p.poi_name,
    p.poi_street_address,
    t.town_name AS POI_TOWN,
    t.town_state AS POI_STATE,
    (
        CASE
            WHEN TO_CHAR(p.poi_open_time, 'HH24:MI') IS NULL THEN
                'Not Applicale'
            WHEN TO_CHAR(p.poi_open_time, 'HH24:MI') IS NOT NULL THEN
                TO_CHAR(p.poi_open_time, 'HH24:MI')
        END
    ) AS poi_opening_time,
    round((geodistance(t.town_lat, t.town_long,(
        SELECT
            t2.town_lat
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ),(
        SELECT
            t2.town_long
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ))), 1) AS separation_in_kms
FROM
    point_of_interest   p
    JOIN town                t ON p.town_id = p.town_id
    JOIN resort              r ON t.town_id = r.town_id
WHERE
    ( geodistance(t.town_lat, t.town_long,(
        SELECT
            t2.town_lat
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    ),(
        SELECT
            t2.town_long
        FROM
            town t2
        WHERE
            t2.town_id = p.town_id
    )) ) <= 100
ORDER BY
    r.resort_name;


COMMIT;