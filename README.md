# 🧠 Silent Struggles: Turning hidden struggles into visible insights through data

---

## 📌 Project Overview

**Project Title:** Silent Struggles  
**Domain:** Data Analytics / Public Health  
**Tools Used:** Python (Pandas, NumPy), SQL (MySQL), Power BI, Excel  

### 🎯 Objective  
The goal of this project is to analyze mental health conditions among adolescents (ages 10–19) in Bangladesh and identify:  
- Key risk factors  
- High-risk groups  
- Protective factors  
- Actionable insights for policy-making  

---

## 📊 Dataset Description

### 🔹 Source  
Survey-based adolescent mental health dataset  

### 🔹 Key Columns  
- record_id  
- age  
- dob  
- sex  
- father_qualification  
- father_occupation  
- mother_qualification  
- mother_occupation  
- marital_status  
- monthly_allowance  
- FIES_category (Food Security)  
- Stress_category  
- overall_cyber_abuse  
- Other socio-economic & behavioral features  

### 🔹 Target Insights  
- Mental health stress levels  
- Food insecurity impact  
- Cyber abuse influence  

---

## 🧹 Data Cleaning (Python Workflow)

1. Dataset understanding  
2. Column renaming  
3. Missing value handling  
4. Duplicate removal  
5. Data type fixing  
6. Categorical standardization  
7. Age validation (10–19 only)  
8. Outlier detection  
9. Likert scale encoding  
10. Feature engineering  
11. Final validation  
12. Export cleaned dataset  

### 🔹 Output  
`FINAL_Clean_Dataset.csv`

---

## ⚙️ Feature Engineering

### 🔹 Created Features
- Age Groups  
  - Early Adolescence (10–13)  
  - Mid Adolescence (14–16)  
  - Late Adolescence (17–19)  
- High Risk Flag  
- Multi Risk Flag  

### 🔹 Logic  
High-risk adolescents identified based on:  
- High stress  
- Food insecurity  
- Cyber abuse exposure  

---

## 🗄️ SQL Analysis

### 🔹 Key Areas
- Demographic distribution (Age vs Gender)  
- Stress analysis across categories  
- Socio-economic impact analysis  
- Food security (FIES) vs stress correlation  
- Cyber abuse vs mental health impact  
- High-risk group identification  
- Protective factor analysis  

---

## 📈 Power BI Dashboards

### 📊 Dashboard 1: Overview  
- Total adolescents  
- Gender distribution  
- Age group distribution  

### 📊 Dashboard 2: Mental Health  
- Stress category breakdown  
- Average stress levels  

### 📊 Dashboard 3: Socio-economic Factors  
- Allowance vs stress  
- Parent education vs stress  

### 📊 Dashboard 4: Food Security  
- FIES distribution  
- Impact on mental health  

### 📊 Dashboard 5: Cyber Abuse  
- Exposure levels  
- Stress correlation  

### 📊 Dashboard 6: Risk Analysis  
- High-risk %  
- Multi-risk %  

### 📊 Dashboard 7: High-Risk Profiling  
**KPIs:**
- % High-risk adolescents  
- Top risk group  
- Top protective factor  

**Visuals:**
- Risk breakdown (gender, age, allowance)  
- Risk clustering matrix  
- Protective factor effectiveness  

---

## 📌 Key Insights

### 🚨 Risk Factors
- Food insecurity increases stress  
- Cyber abuse worsens mental health  
- Low allowance increases vulnerability  

### 🛡️ Protective Factors
- Family support reduces stress  
- Good communication improves resilience  
- Physical health improves mental stability  

---

## 🧠 Business / Policy Impact

### 👥 Beneficiaries
- Government agencies  
- NGOs  
- Schools  
- Healthcare organizations  

### 📌 Use Cases
- Identify high-risk adolescents  
- Design mental health interventions  
- Improve food security policies  

---

## 🧪 Challenges
- Missing data handling  
- Categorical inconsistencies  
- Converting survey data into measurable metrics  

---

## 🚀 Future Improvements
- Machine Learning-based prediction model  
- Real-time dashboard integration  
- Larger dataset expansion  

---

## 🛠️ Tech Stack

- **Programming:** Python (Pandas, NumPy)  
- **Database:** MySQL  
- **Visualization:** Power BI  
- **Data Handling:** Excel  

---

## ✍️ Author

**Md Anik**  
Computer Science Student  
Aspiring Data Analyst  
