Select count(*) FROM blinkit_data;
SET SQL_SAFE_UPDATES = 0;
UPDATE blinkit_data
SET `Item Fat Content` =
CASE 
WHEN `Item Fat Content` IN('LF','low fat') THEN 'Low Fat'
WHEN `Item Fat Content`='reg' THEN 'Regular'
ELSE `Item Fat Content`
END;

Select DISTINCT `Item Fat Content` FROM blinkit_data;

SELECT CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)),'M')  AS `Total Sales Millions` FROM blinkit_data;
SELECT CAST(AVG(Sales) AS DECIMAL(10,1)) AS `Avg Sales` FROM blinkit_data WHERE `Outlet Establishment year`=2022;
SELECT COUNT(*) AS `No Of Items` FROM blinkit_data WHERE `Outlet Establishment year`=2022;
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS `Avg Rating` FROM blinkit_data WHERE `Outlet Establishment year`=2022;

SELECT `Item Fat Content`,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS `Total Sales`,
        CAST(AVG(Sales) AS DECIMAL(10,1)) AS `Avg Sales`,
        COUNT(*) AS `No Of Items`,
        CAST(AVG(Rating) AS DECIMAL(10,2)) AS `Avg Rating`
FROM blinkit_data
WHERE `outlet establishment year`=2022        
GROUP BY `Item Fat Content`
ORDER BY `Total Sales` DESC;

SELECT `Item Type`,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS `Total Sales`,
        CAST(AVG(Sales) AS DECIMAL(10,1)) AS `Avg Sales`,
        COUNT(*) AS `No Of Items`,
        CAST(AVG(Rating) AS DECIMAL(10,2)) AS `Avg Rating`
FROM blinkit_data
WHERE `outlet establishment year`=2022        
GROUP BY `Item Type`
ORDER BY `Total Sales` DESC;

SELECT 
    `Outlet Location Type`,
    CAST(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN Sales ELSE 0 END) AS DECIMAL(10,2)) AS `Low Fat`,
    CAST(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN Sales ELSE 0 END) AS DECIMAL(10,2)) AS `Regular`
FROM blinkit_data
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

SELECT `Outlet Establishment Year`,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS `Total Sales`,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS `Avg Sales`,
        COUNT(*) AS `No Of Items`,
        CAST(AVG(Rating) AS DECIMAL(10,2)) AS `Avg Rating`
FROM blinkit_data
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year` ASC;

SELECT 
    `Outlet Size`,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS `Total Sales`,
    CAST(SUM(Sales) * 100 / 
         (SELECT SUM(Sales) FROM blinkit_data) AS DECIMAL(5,2)) AS `Percentage Of Sales`
FROM blinkit_data
GROUP BY `Outlet Size`
ORDER BY `Percentage Of Sales` DESC;

SELECT `Outlet Location Type`,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS `Total Sales`,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS `Avg Sales`,
        COUNT(*) AS `No Of Items`,
        CAST(AVG(Rating) AS DECIMAL(10,2)) AS `Avg Rating`
FROM blinkit_data
WHERE `Outlet Establishment Year`=2022
GROUP BY `Outlet Location Type`
ORDER BY `Total Sales` DESC;

SELECT `Outlet Type`,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS `Total Sales`,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS `Avg Sales`,
        COUNT(*) AS `No Of Items`,
        CAST(AVG(Rating) AS DECIMAL(10,2)) AS `Avg Rating`
FROM blinkit_data
GROUP BY `Outlet Type`
ORDER BY `Total Sales` DESC;






