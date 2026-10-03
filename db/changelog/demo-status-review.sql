--liquibase formatted sql

--changeset report-studio:c9db3c217d4d-1 runInTransaction:true
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM reports WHERE report_id = 'DEMO-1001' AND status = 'Open';
UPDATE reports SET status = 'Closed' WHERE report_id = 'DEMO-1001' AND status = 'Open';
--rollback UPDATE reports SET status = 'Open' WHERE report_id = 'DEMO-1001' AND status = 'Closed';

--changeset report-studio:c9db3c217d4d-2 runInTransaction:true
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM reports WHERE report_id = 'DEMO-1002' AND status = 'Pending';
UPDATE reports SET status = 'Closed' WHERE report_id = 'DEMO-1002' AND status = 'Pending';
--rollback UPDATE reports SET status = 'Pending' WHERE report_id = 'DEMO-1002' AND status = 'Closed';
