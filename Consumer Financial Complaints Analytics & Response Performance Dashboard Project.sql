-- 1. Create and select the banking complaints database

CREATE DATABASE IF NOT EXISTS BANKING_COMPLAINTS;
USE BANKING_COMPLAINTS;


-- 2. View the complaint dataset

SELECT *
FROM cfpb_credit_card_complaints_2024_cleaned;


-- 3. View the table structure and column data types

DESCRIBE cfpb_credit_card_complaints_2024_cleaned;


-- 4. Calculate the total number of complaints

SELECT
    COUNT(complaint_id) AS total_complaints
FROM cfpb_credit_card_complaints_2024_cleaned;


-- 5. Calculate the number of complaints received by each company

SELECT
    company,
    COUNT(complaint_id) AS complaints_by_company
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY company;


-- 6. Calculate the number of complaints received from each state

SELECT
    state,
    COUNT(complaint_id) AS complaints_by_state
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY state;


-- 7. Calculate complaints by issue and sub-issue

SELECT
    issue,
    sub_issue,
    COUNT(complaint_id) AS no_of_complaints
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY issue, sub_issue
ORDER BY no_of_complaints DESC;


-- 8. Analyse the monthly complaint trend

SELECT
    month_name,
    COUNT(complaint_id) AS total_complaints
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY month_name;


-- 9. Calculate complaints by submission channel

SELECT
    submitted_via,
    COUNT(complaint_id) AS total_complaints
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY submitted_via;


-- 10. Calculate complaints by company response type

SELECT
    company_response_to_consumer,
    COUNT(company_response_to_consumer) AS total_responses
FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY company_response_to_consumer;


-- 11. Calculate the overall timely-response rate

SELECT
    COUNT(complaint_id) AS total_complaints,

    SUM(
        CASE
            WHEN timely_response = 'Yes' THEN 1
            ELSE 0
        END
    ) AS timely_complaints,

    ROUND(
        100 * SUM(
            CASE
                WHEN timely_response = 'Yes' THEN 1
                ELSE 0
            END
        )
        /
        NULLIF(
            SUM(
                CASE
                    WHEN timely_response IN ('Yes', 'No') THEN 1
                    ELSE 0
                END
            ),
            0
        ),
        2
    ) AS timely_response_rate

FROM cfpb_credit_card_complaints_2024_cleaned;


-- 12. Calculate the average time taken to send complaints in hours

SELECT
    ROUND(AVG(days_to_send) * 24, 2) AS average_hours_to_send
FROM cfpb_credit_card_complaints_2024_cleaned
WHERE days_to_send > 0;


-- 13. Calculate the timely-response rate for companies with at least 20 complaints

SELECT
    company,
    COUNT(complaint_id) AS total_complaints,

    SUM(
        CASE
            WHEN timely_response = 'Yes' THEN 1
            ELSE 0
        END
    ) AS timely_complaints,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN timely_response = 'Yes' THEN 1
                ELSE 0
            END
        )
        /
        NULLIF(
            SUM(
                CASE
                    WHEN timely_response IN ('Yes', 'No') THEN 1
                    ELSE 0
                END
            ),
            0
        ),
        2
    ) AS timely_response_rate

FROM cfpb_credit_card_complaints_2024_cleaned
GROUP BY company
HAVING COUNT(complaint_id) >= 20
ORDER BY timely_response_rate ASC;