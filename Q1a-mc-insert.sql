/* FIT9132 2019 S2 Assignment 3 Q1-Part A ANSWERS

   Student Name: DISHI JAIN
    Student ID:  30759307

   Comments to your marker:
   
*/

--Insert into resort
INSERT INTO resort VALUES (
    11,
    'RACV Torquay Resort',
    '1 Great Ocean Rd, VIC',
    '3228',
    5.0,
    'Y',
    1,
    3
);

INSERT INTO resort VALUES (
    12,
    'Balgownie Estate Vineyard Resort $ Spa',
    '1309 Melba Hwy, Yarra Glen VIC',
    '3775',
    4.2,
    'Y',
    3,
    1
);

INSERT INTO resort VALUES (
    13,
    'Peppers Moonah Links Resort',
    'Peter Thomson Dr, Fingal VIC',
    '3939',
    3.0,
    'N',
    10,
    5
);

INSERT INTO resort VALUES (
    14,
    'Oaks Santai Resort, Casuarina, Kingscliff',
    '9 Dianella Dr, Casuarina NSW',
    '2487',
    NULL,
    'Y',
    17,
    4
);

INSERT INTO resort VALUES (
    15,
    'RACV Noosa Resort',
    '94 Noosa Dr, Noosa Heads QLD',
    '4567',
    1.4,
    'N',
    5,
    3
);

INSERT INTO resort VALUES (
    16,
    'Park Hyatt Sydney',
    '7 Hickson Road The Rocks, Sydney, New South Wales',
    '2000',
    3.5,
    'Y',
    17,
    5
);

INSERT INTO resort VALUES (
    17,
    'Oscars Waterfront Boutique Hotel',
    '41b Gipps St, Port Fairy, Victoria',
    '3284',
    NULL,
    'N',
    6,
    4
);

--Insert into review

INSERT INTO review VALUES (
    31,
    'Good customer service',
    TO_DATE('01-Jan-2019', 'dd-mon-yyyy'),
    4,
    9,
    11
);

INSERT INTO review VALUES (
    32,
    'Amazing hotel',
    TO_DATE('11-Jan-2019', 'dd-mon-yyyy'),
    5,
    3,
    12
);

INSERT INTO review VALUES (
    33,
    'Bad experience',
    TO_DATE('02-Feb-2019', 'dd-mon-yyyy'),
    1,
    5,
    15
);

INSERT INTO review VALUES (
    34,
    'Poor customer treatment, very bad experience',
    TO_DATE('15-Mar-2019', 'dd-mon-yyyy'),
    1,
    7,
    17
);

INSERT INTO review VALUES (
    35,
    'Beautiful resort, amazing service, friendly staff',
    TO_DATE('25-Apr-2019', 'dd-mon-yyyy'),
    4,
    4,
    12
);

INSERT INTO review VALUES (
    36,
    'Very bad, no cleanliness and rude receptionist',
    TO_DATE('15-May-2019', 'dd-mon-yyyy'),
    1,
    10,
    13
);

INSERT INTO review VALUES (
    37,
    'Beautiful view from rooms, clean and tidy. Overall a perfect stay',
    TO_DATE('20-Jun-2019', 'dd-mon-yyyy'),
    5,
    1,
    14
);

INSERT INTO review VALUES (
    38,
    'Not so good',
    TO_DATE('20-Jul-2019', 'dd-mon-yyyy'),
    2,
    6,
    16
);

INSERT INTO review VALUES (
    39,
    'Moderate resort, not so good not so bad',
    TO_DATE('30-Jun-2019', 'dd-mon-yyyy'),
    3,
    7,
    11
);

INSERT INTO review VALUES (
    40,
    'Food is amazing, staff is not so good',
    TO_DATE('03-Aug-2019', 'dd-mon-yyyy'),
    3,
    5,
    14
);

INSERT INTO review VALUES (
    41,
    'Location very good, nearby malls and shopping centres',
    TO_DATE('05-Sep-2019', 'dd-mon-yyyy'),
    4,
    8,
    12
);

INSERT INTO review VALUES (
    42,
    'Very nice antique look of rooms, clean and hotel staff is polite',
    TO_DATE('16-Oct-2019', 'dd-mon-yyyy'),
    4,
    9,
    14
);

INSERT INTO review VALUES (
    43,
    'Loved the stay, amazing food and very nice staff',
    TO_DATE('18-Oct-2019', 'dd-mon-yyyy'),
    5,
    2,
    12
);

INSERT INTO review VALUES (
    44,
    'Very close to airport, good facilities, helping staff',
    TO_DATE('09-Nov-2019', 'dd-mon-yyyy'),
    4,
    6,
    14
);

INSERT INTO review VALUES (
    45,
    'Ideal for tourists, not expensive at all, affordable and beautiful',
    TO_DATE('10-Nov-2019', 'dd-mon-yyyy'),
    3,
    10,
    11
);

--Insert into cabin

INSERT INTO cabin VALUES (
    1,
    11,
    2,
    4,
    'Free wi-Fi. kitchen with 400 ltr refrigerator,stove, microwave, pots, pans, silverware,
toaster, electric kettle,TV and utensils'
);

INSERT INTO cabin VALUES (
    2,
    11,
    3,
    6,
    'Free wi-Fi. kitchen with 300 ltr refrigerator,stove, pots, pans, silverware,
electric kettle,TV'
);

INSERT INTO cabin VALUES (
    1,
    12,
    3,
    6,
    'Free wi-Fi. kitchen with stove, microwave, pans,toaster, electric kettle and utensils'
);

INSERT INTO cabin VALUES (
    2,
    12,
    5,
    10,
    'Kitchen with 500 ltr refrigerator,stove, microwave, pots, pans, silverware,toaster,
electric kettle,TV and utensils'
);

INSERT INTO cabin VALUES (
    3,
    12,
    1,
    2,
    'Free Wi-Fi, telephone, flat-screen TV, air conditioning, heating with electric blinds
and double-glazed windows'
);

INSERT INTO cabin VALUES (
    1,
    13,
    2,
    4,
    'Private bathroom with bathtub and/or shower, hairdryer, heated towel rail and quality
courtesy kit. We also offer free WIFI connection, air conditioning, TV with satellite channels, safe'
);

INSERT INTO cabin VALUES (
    2,
    13,
    4,
    8,
    'Free WIFI connection, air conditioning, TV with satellite channels, safe and mini-bar 
where our guests can consume non-alcoholic soft drinks for free'
);

INSERT INTO cabin VALUES (
    3,
    13,
    2,
    4,
    'Double bed, air conditioning, safe, mini-bar, Wi-Fi connection, private bathroom with
hairdryer, bathrobe, slippers and courtesy kit'
);

INSERT INTO cabin VALUES (
    4,
    13,
    4,
    8,
    'Double beds, private bathroom with hairdryer, heated towel rail, shower, slippers and a
superior quality courtesy kit. And of course air conditioning, free WIFI connection, TV with satellite channels, safe'
);

INSERT INTO cabin VALUES (
    1,
    14,
    3,
    6,
    'Bathroom amenities, Hair Dryer, Scale, Bathrobe and Yukata, Modular data jack, Wi-Fi 
internet access, High-speed internet access, AM/FM/BGM radio, In-room safe, Mini-bar, Refrigerator, Hot pot'
);

INSERT INTO cabin VALUES (
    2,
    14,
    2,
    4,
    'Flat screen TV, Free Wi-Fi, Breakfast till 11, Bath en-suite'
);

INSERT INTO cabin VALUES (
    1,
    15,
    1,
    2,
    'Samsung smart TV, iHome docking station, USB ports, Keurig Coffee Brewer, mini-fridge,
humidifier, in-room safe, plush robes and slippers, and Wi-Fi'
);

INSERT INTO cabin VALUES (
    2,
    15,
    5,
    10,
    'Bedrooms with king-sized bed, an oversized bathroom with double vanity and marble 
floors and a separate sitting area with gas fireplace, and a wet bar'
);

INSERT INTO cabin VALUES (
    3,
    15,
    2,
    4,
    'Individually Controlled A/C and Heating, Electronic Safe Deposit Box, Electronic Lock 
Key System,  Mini Bar,  Tea and Coffee Facilities,  Iron and Ironing Board, Hairdryer, Balcony'
);

INSERT INTO cabin VALUES (
    1,
    16,
    1,
    2,
    'Luxuriously Cloud Beds, LCD flat screen television, Clock radios with smart-phone 
technology, In-room coffee service with plenty of supplies, Bath products by NEST Fragrances including shampoo, conditioner,
lotion'
);

INSERT INTO cabin VALUES (
    2,
    16,
    2,
    4,
    'Single bed, air conditioning, Wi-Fi connection, private bathroom with hairdryer, 
bathrobe, slippers and courtesy kit'
);

INSERT INTO cabin VALUES (
    3,
    16,
    3,
    6,
    'Breakfast till 10, Flat screen TV, Free Wi-Fi, Bath en-suite'
);

INSERT INTO cabin VALUES (
    4,
    16,
    4,
    8,
    'Bedrooms with queen-sized bed, a bathroom with double vanity and marble floors and a 
separate sitting area with gas fireplace'
);

INSERT INTO cabin VALUES (
    5,
    16,
    5,
    10,
    'Electronic Safe Deposit Box, Electronic Lock Key System, Tea and Coffee Facilities, 
Iron and Ironing Board'
);

INSERT INTO cabin VALUES (
    1,
    17,
    5,
    10,
    'Spacious rooms, Free Wi-Fi, Microwave, Utensils'
);

--Insert into booking

INSERT INTO booking VALUES (
    1,
    TO_DATE('11-Jan-2019', 'dd-mon-yyyy'),
    TO_DATE('15-Jan-2019', 'dd-mon-yyyy'),
    2,
    4,
    200.0,
    1,
    1,
    11
);

INSERT INTO booking VALUES (
    2,
    TO_DATE('20-Jan-2019', 'dd-mon-yyyy'),
    TO_DATE('22-Jan-2019', 'dd-mon-yyyy'),
    3,
    0,
    100.0,
    2,
    1,
    12
);

INSERT INTO booking VALUES (
    3,
    TO_DATE('01-Feb-2019', 'dd-mon-yyyy'),
    TO_DATE('10-Feb-2019', 'dd-mon-yyyy'),
    4,
    10,
    250.0,
    3,
    2,
    13
);

INSERT INTO booking VALUES (
    4,
    TO_DATE('25-Feb-2019', 'dd-mon-yyyy'),
    TO_DATE('02-Mar-2019', 'dd-mon-yyyy'),
    1,
    1,
    200.0,
    4,
    2,
    14
);

INSERT INTO booking VALUES (
    5,
    TO_DATE('06-Mar-2019', 'dd-mon-yyyy'),
    TO_DATE('13-Mar-2019', 'dd-mon-yyyy'),
    3,
    3,
    200.0,
    5,
    1,
    15
);

INSERT INTO booking VALUES (
    6,
    TO_DATE('19-Mar-2019', 'dd-mon-yyyy'),
    TO_DATE('22-Mar-2019', 'dd-mon-yyyy'),
    2,
    4,
    400.0,
    6,
    3,
    15
);

INSERT INTO booking VALUES (
    7,
    TO_DATE('15-Apr-2019', 'dd-mon-yyyy'),
    TO_DATE('20-Apr-2019', 'dd-mon-yyyy'),
    5,
    6,
    857.0,
    7,
    1,
    16
);

INSERT INTO booking VALUES (
    8,
    TO_DATE('12-May-2019', 'dd-mon-yyyy'),
    TO_DATE('15-May-2019', 'dd-mon-yyyy'),
    2,
    1,
    100.0,
    8,
    3,
    16
);

INSERT INTO booking VALUES (
    9,
    TO_DATE('13-May-2019', 'dd-mon-yyyy'),
    TO_DATE('18-May-2019', 'dd-mon-yyyy'),
    4,
    4,
    350.0,
    9,
    1,
    17
);

INSERT INTO booking VALUES (
    10,
    TO_DATE('26-Jun-2019', 'dd-mon-yyyy'),
    TO_DATE('29-Jun-2019', 'dd-mon-yyyy'),
    3,
    1,
    250.0,
    10,
    2,
    15
);

INSERT INTO booking VALUES (
    11,
    TO_DATE('30-Jun-2019', 'dd-mon-yyyy'),
    TO_DATE('03-Jul-2019', 'dd-mon-yyyy'),
    5,
    2,
    350.0,
    2,
    2,
    11
);

INSERT INTO booking VALUES (
    12,
    TO_DATE('15-Jul-2019', 'dd-mon-yyyy'),
    TO_DATE('27-Jul-2019', 'dd-mon-yyyy'),
    2,
    4,
    200.0,
    3,
    1,
    13
);

INSERT INTO booking VALUES (
    13,
    TO_DATE('18-Jul-2019', 'dd-mon-yyyy'),
    TO_DATE('23-Jul-2019', 'dd-mon-yyyy'),
    6,
    4,
    888.0,
    6,
    2,
    13
);

INSERT INTO booking VALUES (
    14,
    TO_DATE('11-Aug-2019', 'dd-mon-yyyy'),
    TO_DATE('14-Aug-2019', 'dd-mon-yyyy'),
    1,
    2,
    150.0,
    7,
    1,
    11
);

INSERT INTO booking VALUES (
    15,
    TO_DATE('19-Aug-2019', 'dd-mon-yyyy'),
    TO_DATE('29-Aug-2019', 'dd-mon-yyyy'),
    3,
    4,
    356.0,
    2,
    2,
    15
);

INSERT INTO booking VALUES (
    16,
    TO_DATE('01-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('03-Sep-2019', 'dd-mon-yyyy'),
    1,
    0,
    100.0,
    4,
    2,
    14
);

INSERT INTO booking VALUES (
    17,
    TO_DATE('05-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('15-Sep-2019', 'dd-mon-yyyy'),
    3,
    3,
    500.0,
    10,
    3,
    16
);

INSERT INTO booking VALUES (
    18,
    TO_DATE('10-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('18-Sep-2019', 'dd-mon-yyyy'),
    2,
    0,
    240.0,
    8,
    4,
    16
);

INSERT INTO booking VALUES (
    19,
    TO_DATE('16-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('20-Sep-2019', 'dd-mon-yyyy'),
    4,
    1,
    360.0,
    1,
    1,
    17
);

INSERT INTO booking VALUES (
    20,
    TO_DATE('25-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('28-Sep-2019', 'dd-mon-yyyy'),
    2,
    0,
    190.0,
    3,
    2,
    16
);

INSERT INTO booking VALUES (
    21,
    TO_DATE('29-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('03-Oct-2019', 'dd-mon-yyyy'),
    3,
    5,
    390.0,
    9,
    1,
    15
);

INSERT INTO booking VALUES (
    22,
    TO_DATE('01-Oct-2019', 'dd-mon-yyyy'),
    TO_DATE('15-Oct-2019', 'dd-mon-yyyy'),
    1,
    0,
    170.0,
    2,
    2,
    13
);

INSERT INTO booking VALUES (
    23,
    TO_DATE('20-Oct-2019', 'dd-mon-yyyy'),
    TO_DATE('31-Oct-2019', 'dd-mon-yyyy'),
    2,
    1,
    220.0,
    6,
    2,
    11
);

INSERT INTO booking VALUES (
    24,
    TO_DATE('30-Oct-2019', 'dd-mon-yyyy'),
    TO_DATE('15-Nov-2019', 'dd-mon-yyyy'),
    4,
    3,
    430.0,
    5,
    2,
    14
);

INSERT INTO booking VALUES (
    25,
    TO_DATE('20-Nov-2019', 'dd-mon-yyyy'),
    TO_DATE('24-Dec-2019', 'dd-mon-yyyy'),
    7,
    3,
    890.0,
    10,
    1,
    16
);

COMMIT;