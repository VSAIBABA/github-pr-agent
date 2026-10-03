-- =============================================================
-- Update Script: Set status from Pending to Open
-- Table   : reports
-- Key     : report_id
-- Author  : report-studio
-- Date    : 2025-01-01
-- =============================================================

UPDATE reports
SET    status = 'Open'
WHERE  status = 'Pending';
