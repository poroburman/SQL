-- 1. retrieve all information from cd.facilities table
SELECT * FROM cd.facilities;

-- 2. retrieve a list of only facility names and costs
SELECT name, membercost FROM cd.facilities;

-- 3. select facilities which charge fee to members
SELECT * FROM cd.facilities
WHERE membercost > 0;

-- 4. select facilities that charge a fee to members and the fee is less than 1/50th 
-- of monthly maintenance cost
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost > 0 AND membercost < monthlymaintenance/50.0;

-- 5. list facilities with word 'Tennis' in their name
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- 6. list facilities with ID 1 and 5?
SELECT * FROM cd.facilities
WHERE facid IN (1,5);

-- 7. list of members who joined after start of September 2012
SELECT memid, surname, firstname, joindate 
FROM cd.members
WHERE joindate >= '2012-09-01';

-- 8. produce ordered list of first 10 surnames in members table, with no duplicates
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;

-- 9. get signup date of last member.
SELECT MAX(joindate) 
AS latest_signup
FROM cd.members;

-- 10. how many facilities have cost to guests of 10 or more
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

-- 11. list total number of slots booked per facility in the month
--     of September 2012. output table should consist of id and slots, 
--     sorted by number of slots.
SELECT facid, sum(slots) 
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots);

-- 12. list of facilities with more than 1000 slots booked. Output table
-- with facility id and total slots, sorted by facility id.
SELECT facid, SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

-- 13. list start times for bookings for tennis courts, for the  date
--     '2012-09-21'. return list of start time and facility name pairings,
--     ordered by the time.
SELECT cd.bookings.starttime AS start, cd.facilities.name AS name
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.facid IN (0,1)
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;

























