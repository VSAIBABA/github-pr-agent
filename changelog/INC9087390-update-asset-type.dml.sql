--liquibase formatted sql

--changeset report-studio:66ec2394bdc8 runInTransaction:true
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:1 SELECT CASE WHEN (SELECT COUNT(*) FROM assets WHERE asset_id = 'A0' AND asset_type = 'Pump') = 1 AND (SELECT COUNT(*) FROM assets WHERE asset_id = 'A3' AND asset_type = 'Pump') = 1 THEN 1 ELSE 0 END;
UPDATE assets SET asset_type = 'Pump' WHERE asset_id = 'A0' AND asset_type = 'Pump';
UPDATE assets SET asset_type = 'Pump' WHERE asset_id = 'A3' AND asset_type = 'Pump';

--rollback UPDATE assets SET asset_type = 'Pump' WHERE asset_id = 'A3' AND asset_type = 'Pump';
--rollback UPDATE assets SET asset_type = 'Pump' WHERE asset_id = 'A0' AND asset_type = 'Pump';
