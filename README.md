# Hospital Management Data Analysis Project

## Project Background
Efficient hospital management not only require high-quality medical care but also optimized administrative and financial operations. Hospitals often deal with frequent patient cancellations, no-shows, and also insurance claim denials which affects revenue. In this project, I conducted an in-depth analysis of hospital management data to deliver key insights and recommendations on how the hospital administration can improve operational efficiency. 

## Tools and Skills Used
- Excel (Data Cleaning, Sorting/Filtering, Calculations for KPIs, Data Manipulation)
- BigQuery SQL (JOINs, CTEs, Variable Creation)
- Tableau Public (Data Visualizations, Dashboards)
- GitHub (Documentation, Delivering Key Insights and KPIs, Recommendations)
- Lucid App (Designing ERD)

## Project Structure
- /README.md - What you are looking at right now! This provides a description of the project, addressing KPIs, dashboards, and recommendations to stakeholders.
- /[data](https://github.com/jaylenroope-afk/Hospital-Management-/tree/main/data) - Contains raw and processed data.
- /[Tableau](https://github.com/jaylenroope-afk/Hospital-Management-/tree/main/Tableau) - Includes png and twbx files containing important dashboards.
- /[queries](https://github.com/jaylenroope-afk/Hospital-Management-/tree/main/queries) - Includes queries that were used to pull data as well as join the data tables. BigQuery SQL was used.  
- /[ERD](https://github.com/jaylenroope-afk/Hospital-Management-/blob/main/ERD%20for%20Healthcare%20Data%20(1).png) - Entity-Relationship Diagram that shows how data tables relate to one another and how they were joined in SQL. 

## Analysis Summary
The hospital served 200 patients with an average age of 41 in 2023. It is unknown about other departments but the dataset only contained data on 3 departments including: Pediatrics, Oncology, and Dermatology. The three departments collectively generated revenue of $551,249.85. Pediatrics had the highest revenue which was $258,937.83 and had 98 appointments. Dr. Sarah Taylor who specializes in Dermatology, had the most appointments (29) and generated the most revenue which was $82,696.48. April was the busiest month and saw 25 appointments while September was the least busiest month and saw only 11 appointments. No seasonal trends were observed. Tuesdays and Wednesdays were the busiest days throughout the year. Two of the biggest issues that were hurting revenue included high cancellation and no-show rates of patients and insurance claim denials. The cancellations and no-shows disrupted patient flow where patients in need could have been served while insurance claim denials resulted in $62,597 in financial losses. Only 30.9% showed up to their appointments which indicates that there is a significant issue in communication with the patients. This issue resulted in about a million dollars in potential losses. 33% of patients who paid with insurance had their claims denied, with certain providers such as HealthIndia and MedCare Plus had disproportionally higher denial rates (60% and 42.86% respectively). Dashboards that address the key performance indicators are included as well as recommendations on addressing major issues and improving hospital operational efficiency.



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

- 200 patients were served with the average age being 41 within the Pediatrics, Oncology, and Dermatology departments
- The total revenue across all the physicians was $551,249.85
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

## Recommendations

### Minimizing Appointment Cancellations and No-Shows
- Send automated emails or text messages to remind the patients about their upcoming appointment to reduce no-shows
- There were no patterns between department and cancellation rates. Some physicians had much higher cancellation rates compared to other physicians within the same department. For example, in the Oncology department, Dr. Robert Davis had a cancellation rate of 38.46% which was the highest out of all physicians while Dr. Linda Wilson had a cancellation rate of only 15.79%. The hospital administration can investigate the underlying causes such as physician availability, how they communicate with patients, and quality of care to reduce unncessary cancellations

### Insurance Denials
- Compare insurance claim denials with regional and national benchmarks to determine whether it was an internal issue or national healthcare trend causing these high denial rates. If the hospital is seeing higher denial rates compared to others, it could indicate an internal issue such as documentation errors or poor staff training. The hospital should revise their training to minimize these errors such as refreshing the staff on the accurate medical coding (ICD/CPT) used in claim documentation.
- HealthIndia and WellnessCorp were the highest denying providers. The administration should discuss with these insurers to understand how to provide clearer documentation and their policies.
- Physiotherapy (45%) and ECG (37.5%) had the highest denial rates. Investigate if the rates were linked to pre-authorization or coverage limits related to the specific treatment.
- To investigate denial reasons, my team may request a dataset containing more thorough health insurance data from the administration to provide a more detailed dashboard. 

### Workload & Patient Volume Management
- Tuesdays and Wednesdays were the busiest days throughout the year. Based on this trend, balance staffing schedules by scheduling more physicians and nurses on these high-volume days.
- If the patient cancellations and no-shows are mainly due to scheduling issues then readjust hospital hours and shifts for physicians.
- Reallocate resources depending on which departments are more busy. Allocate additional resources to the Pediatric department to support its high patient volume.

### Revenue & Payments
- For faster transactions, encourage patients to pay via credit card instead of cash. 31% of patients pay via cash.

## Limitations
- The dataset was synthetic as hospital management data is limited due to HIPPA.
- Data was only given in 2023 so it was difficult to make conclusions on trends
- There were only 200 rows in the dataset so making statistically significant conclusions are difficult
- The hospital only had 3 departments: Oncology, Pediatrics, and Dermatology but realistically a hospital would have a many more departments

## Dataset
- Data was found on [Kaggle](https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset?select=treatments.csv) by *Kanek Baghel*
- Contained were 5 csv files: appointments, billing, doctors, patients, and treatments
- The raw data can be found [here](https://github.com/jaylenroope-afk/Hospital-Management-/tree/main/data/raw) 
                                                                                  

