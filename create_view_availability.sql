CREATE VIEW VenueAvailabilityView AS
SELECT 
    va.id,
    va.venue_id,
    va.date,
    va.start_time,
    va.end_time,
    va.status,
    v.VenueName,
    v.VenueType,
    v.Location,
    v.Capacity
FROM 
    VenueAvailability va
JOIN 
    Venues v ON va.venue_id = v.VenueID;

