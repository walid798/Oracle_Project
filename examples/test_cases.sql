-- This file includes test cases to validate your PL/SQL scripts.  

```sql
-- Test Case 1: Validate schema creation
SELECT * FROM HR.CLIENTS;
SELECT * FROM HR.CONTRACTS;
SELECT * FROM HR.INSTALLMENTS_PAID;

-- Test Case 2: Insert a valid client and contract
INSERT INTO HR.CLIENTS (CLIENT_ID, CLIENT_NAME, MOBILE, ADDRESS) 
VALUES (5, 'Sami Nabil', '0109876543', 'Alexandria');

INSERT INTO HR.CONTRACTS (CONTRACT_ID, CONTRACT_STARTDATE, CONTRACT_ENDDATE, CONTRACT_TOTAL_FEES, CLIENT_ID, CONTRACT_PAYMENT_TYPE)
VALUES (203, TO_DATE('02/01/2022', 'MM/DD/YYYY'), TO_DATE('02/01/2023', 'MM/DD/YYYY'), 120000, 5, 'QUARTER');

-- Validate installments
SELECT * FROM HR.INSTALLMENTS_PAID WHERE CONTRACT_ID = 203;

-- Test Case 3: Invalid payment type
INSERT INTO HR.CONTRACTS (CONTRACT_ID, CONTRACT_STARTDATE, CONTRACT_ENDDATE, CONTRACT_TOTAL_FEES, CLIENT_ID, CONTRACT_PAYMENT_TYPE)
VALUES (204, TO_DATE('01/01/2022', 'MM/DD/YYYY'), TO_DATE('01/01/2023', 'MM/DD/YYYY'), 120000, 5, 'INVALID');

-- Test Case 4: Verify installment amounts
SELECT INSTALLMENT_AMOUNT 
FROM HR.INSTALLMENTS_PAID 
WHERE CONTRACT_ID = 203;