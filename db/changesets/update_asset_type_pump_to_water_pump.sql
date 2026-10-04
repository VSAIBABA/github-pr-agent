--liquibase formatted sql

--changeset report-studio:89265aff99a0-1 runInTransaction:true
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM assets WHERE asset_id = 'A0' AND asset_type = 'Pump';
UPDATE assets SET asset_type = 'Water Pump' WHERE asset_id = 'A0' AND asset_type = 'Pump';
--rollback UPDATE assets SET asset_type = 'Pump' WHERE asset_id = 'A0' AND asset_type = 'Water Pump';

--changeset report-studio:89265aff99a0-2 runInTransaction:true
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM assets WHERE asset_id = 'A3' AND asset_type = 'Pump';
UPDATE assets SET asset_type = 'Water Pump' WHERE asset_id = 'A3' AND asset_type = 'Pump';
--rollback UPDATE assets SET asset_type = 'Pump' WHERE asset_id = 'A3' AND asset_type = 'Water Pump';
