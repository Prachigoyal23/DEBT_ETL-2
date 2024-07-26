-- 2. Email IDs are wrong entered - replace all email id domains as gmail.com (do it using code only)
UPDATE 10k_borrowers
SET "Email Address" = 
    CONCAT(SUBSTRING("Email Address", 1, POSITION('@' IN "Email Address") - 1), '@gmail.com')
WHERE POSITION('@' IN "Email Address") > 0;

-- 4. Add 2 more columns Income Level (IL) and Financial Status (FS). Allocate the data randomly as IL - low, medium, high and FS as stable, semi-stable, unstable)
ALTER TABLE 10k_borrowers
ADD COLUMN "Income Level" VARCHAR(10),
ADD COLUMN "Financial Status" VARCHAR(12);

-- Update the new columns with random data
UPDATE 10k_borrowers
SET "Income Level" = 
    CASE
        WHEN RANDOM() < 0.33 THEN 'low'
        WHEN RANDOM() < 0.66 THEN 'medium'
        ELSE 'high'
    END,
    "Financial Status" = 
    CASE
        WHEN RANDOM() < 0.33 THEN 'stable'
        WHEN RANDOM() < 0.66 THEN 'semi-stable'
        ELSE 'unstable'
    END;

--6. Add a new column for Collection Risk Score
ALTER TABLE 10k_borrowers
ADD COLUMN "Collection Risk Score" FLOAT;

-- Update the Collection Risk Score based on Credit Score and Loan Amount
UPDATE 10k_borrowers
SET "Collection Risk Score" = 
    CASE
        WHEN "Credit Score" IS NOT NULL AND "Loan Amount" IS NOT NULL THEN
            ("Loan Amount" / "Credit Score") * 100
        ELSE NULL
    END;




