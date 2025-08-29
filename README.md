# Hospital Management Data Analysis Project

## Project Background
Efficient hospital management not only require high-quality medical care but also optimized administrative and financial operations. Hospitals often deal with frequent patient cancellations, no-shows, and also insurance claim denials which affects revenue. In this project, I conducted an in-depth analysis of hospital management data to deliver key insights and recommendations on how the hospital administration can improve operational efficiency. Key KPIs

## Analysis Summary




![ERD](https://github.com/jaylenroope-afk/Hospital-Management-/blob/main/ERD%20for%20Healthcare%20Data%20(1).png?raw=true)
*Hospital Management ERD*

## Key Performance Indicators (KPIs)
### Operational KPIs
- Appointment Cancellation Rate- % of scheduled appointments that patients canceled or missed
- Patient Flow- measures how busy the hospital is throughout the week and months
- Appointments by Doctor and Specialization- measures how busy different doctors and specializations are when compared with one another

### Financial KPIs
- Claim Denial Rate- % of insurance claims that are denied
- Revenue by Doctor and Specialization- measures financial performance across doctors and specialization
- Payment Method- tracks the % of patients that pay with different methods (insurance, credit card, cash)

### Patient Demographics KPIs
- Age Distribution of Patients- helps understand the population is served
- Total Patients- how many patients were served throughout the year

## Insights Deep-Dive
### Appointments Dashboard
*Looking at how busy the hospital is throughout the year (2023) and % of patients that show up to their appointment*

- The busiest month was April with 25 appointments
- Tuesdays and Wednesdays were the busiest days of the week
- Only 30.9% of patients attended their scheduled appointments, leading to disruptions in scheduling and significant revenue loss
- Dr. Robert Davis and Dr. Jane Davis had the highest cancellation rates at 38.46% and 38.10% respectively, investigating what was causing these high cancellation rates are key
![Appointments Dashboard](https://github.com/jaylenroope-afk/Hospital-Management-/blob/main/Tableau/png/Appointment%20Cancellations%20and%20No-Shows%20Dashboard.png?raw=true)
*The dashboard is interactive on Tableau Public or on a .twbx file*

### Patient Flow and Operations Dashboard
*Measuring financial performance across the doctors and departments, doctor utilization, and patient demographics*

- 200 patients were served with the average age being 41
- The total revenue across all the doctors was $551,249.85
- Dr. Sarah Taylor had the most appointments which was 29 and brought in $82,696.48 in revenue
- Pediatrics had the most appointments which was 98 and brought in $258,937.83 in revenue
![Patient Flow and Operations Dashboard](https://github.com/jaylenroope-afk/Hospital-Management-/blob/main/Tableau/png/Patient%20Flow%20&%20Operations%20Dashboard.png?raw=true)

### Health Insurance Dashboard
*Measuring claim denials across different insurance providers and financial losses that resulted*

- 32% of patients paid via insurance and 33% of those insurance payments were denied
- Claim denials resulted in $62,597 in financial losses
- Health India had the highest claim denial rate (60%)
- MedCare Plus had the highest financial loss ($29,968)
- Physiotherapy treatment resulted in the highest claim denial rate (45.45%) 
![Health Insurance Dashboard](https://github.com/jaylenroope-afk/Hospital-Management-/blob/main/Tableau/png/Health%20Insurance%20Dashboard.png?raw=true)

## Limitations
- The dataset is synthetic as hospital management data is often kept confidential due to HIPPA
- Data is only given in 2023 so it is difficult to make conclusions on trends
- There are only 200 rows in the dataset so making statistically significant conclusions are difficult  


                                                                                  
Analyzing patient flow, cancellations, and insurance trends to improve operational efficiency in the hospital 
