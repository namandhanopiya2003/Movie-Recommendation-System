## Movie_Recommendation_System

## 🧠 ABOUT THIS PROJECT ==>

- This is an R-based Movie Recommendation System built using collaborative filtering techniques.

- It loads and processes the MovieLens 100K dataset, performs Exploratory Data Analysis (EDA), builds a User-Based Collaborative Filtering (UBCF) model, evaluates its performance using cross-validation, and generates movie recommendations for users.

- Ideal for academic projects, portfolio building, or integrating into larger recommender systems.

---

## ⚙ TECHNOLOGIES USED ==>

- **R Language**

= **dplyr** (for data manipulation)

- **recommenderlab** (for building and evaluating recommendation models)

- **Base R functions** (file reading, data processing)

- **MovieLens 100K Dataset** (for training/testing)

---

## 📁 PROJECT FOLDER STRUCTURE ==>

MOVIE_RECOMMENDATION_SYSTEM/<br>
├── data/<br>
│   └── ml-100k/                           # MovieLens dataset files (u.data, u.item, u.user)<br>
│<br>
├── R/<br>
│   ├── 01_data_loading.R<br>
│   ├── 02_eda.R<br>
│   ├── 03_model_building.R<br>
│   ├── 04_model_evaluation.R<br>
│   ├── 05_generate_recommendations.R<br>
│   └── 06_shiny_dashboard.R<br>
│<br>
├── output/<br>
│   └── recommendations.csv                # Output: Top recommended movies per user<br>
│<br>
├── Rlibs/                                 # Custom R library path (optional)<br>
│<br>
└── run_all.R                              # Main script to run the full pipeline

---

## 📝 WHAT EACH FILE DOES ==>

**data/**:
- Contains the MovieLens 100K dataset files:
- u.data: User-item ratings.
- u.item: Movie metadata (titles, genres, etc.).
- u.user: User demographic information.

**R/01_data_loading.R**:
- Loads rating, movie, and user data from the data/ directory.
- Preprocesses and returns structured data for further analysis.

**R/02_eda.R**:
- Performs Exploratory Data Analysis on the dataset.
- Outputs distribution summaries, common statistics, and visual patterns in ratings.

**R/03_model_building.R**:
- Converts data into a rating matrix.
- Builds a User-Based Collaborative Filtering (UBCF) model using recommenderlab.

**R/04_model_evaluation.R**:
- Evaluates the recommender model using cross-validation.
- Computes performance metrics like RMSE.

**R/05_generate_recommendations.R**:
- Generates top-N movie recommendations for each user.
- Saves results to output/recommendations.csv.

**R/06_shiny_dashboard.R**:
- Creates an interactive Shiny dashboard to visualize:
- User demographics
- Popular movies
- Personalized recommendations
- Allows end-users to explore and interact with the recommender system via a web interface.

**run_all.R**:
- Orchestrates the entire pipeline: loading data, running EDA, training, evaluating the model, and generating recommendations.

**output/**:
- Stores final recommendation outputs, typically in CSV format.

---

## 🚀 HOW TO RUN ==>

- Open cmd and run following commands ->

# Step 1: Move to the project directory:
cd D:\Movie_Recommendation_System
D:

# Step 2: Run the main script from terminal:
Rscript run_all.R

---

## ✨ SAMPLE OUTPUT ==>

🎬 Movie Recommendation Engine: ACTIVE<br>
👤 User: "User_123"<br>
🍿 Recommended Movie: Inception (Confidence Score: 92.5%)<br>
✅ Status: Recommendation Delivered Successfull

---

## 📬 CONTACT ==>

For questions or feedback, feel free to reach out!

---
