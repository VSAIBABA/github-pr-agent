--liquibase formatted sql
--changeset saibaba vemula:001
--comment: Update report status from PENDING to CLOSED
UPDATE reports
SET status = 'CLOSED'
WHERE status = 'PENDING';
--rollback UPDATE reports SET status = 'PENDING' WHERE status = 'CLOSED';
