Salary Prediction AppMission

The goal of this project is to provide job seekers and employers with a reliable tool for salary predictions. By offering insights into potential salaries based on various factors like education, job title, and experience, this app helps individuals make more informed decisions when negotiating pay. It also aligns with a broader mission to promote job creation and health through innovative solutions.

Brief Description

This app uses machine learning to predict a person’s salary based on their age, education level, job title, and years of experience. It provides users with an estimated salary, offering valuable insights for professionals and employers alike.

Source of Data : https://www.kaggle.com/datasets/rkiattisak/salaly-prediction-for-beginer 

The data used to train the model was sourced from various publicly available salary datasets, including those found on platforms like Kaggle and other open-source databases. These datasets include anonymized salary data across multiple industries, job roles, and educational backgrounds.
Publicly Available API
The app includes a backend API that performs the salary prediction. This API is hosted on Render and can be accessed from anywhere.
API Endpoint
Base URL: https://salary-16ch.onrender.com
How to Use the API
Endpoint: /predict
Method: POST
Request Payload:
You can send the following JSON data in the body of the request:
json
Copy code
{
  "age": 34,
  "gender": "male",
  "education_level": "Bachelor's",
  "job_title": "Software Engineer",
  "years_of_experience": 5
}
Response Example:
If the request is successful, you’ll get a response like this:
json
Copy code
{
  "predicted_salary": 85000
}
You can also explore the API documentation with Swagger UI at:

https://salary-16ch.onrender.com/docs

YouTube Demo : https://youtu.be/GKNZmzoKr-8 

Check out a quick demo of how the app works! This video showcases how you can use the mobile app to input your details and get a salary prediction.
How to Run the Mobile App
Here’s how to get the mobile app up and running on your own machine.
Requirements:
Install Flutter: Follow the instructions on the Flutter website to set up Flutter on your system.
You should have a working Android or iOS emulator, or a physical device ready to run the app.
Steps to Run:
Clone the Repository:
bash
Copy code
git clone https://github.com/Kalisa21/linear-regression-model.git 
cd SalaryPredictionApp
Install Dependencies:
Run the following command to install all required Flutter packages:
bash
Copy code
flutter pub get
Update API URL:
In the predict_screen.dart file, update the API URL to use the publicly available one:
dart
Copy code
final url = Uri.parse("https://salary-16ch.onrender.com/predict");
Run the App:
To start the app, simply run:
bash
Copy code
flutter run
Use the App:
Enter your details: age, education level, job title, and years of experience.
Tap Predict to get your estimated salary.
Running the Backend Locally (Optional)
If you'd prefer to run the backend locally instead of using the hosted API, here are the instructions.
Prerequisites:
Install Python 3.8 or higher on your system.
Install FastAPI and Uvicorn:
bash
Copy code
pip install fastapi uvicorn
Steps to Run:
Start the API Locally:
Run the following command to start the backend server:
bash
Copy code
uvicorn main:app --reload
Access the API Locally:
API Base URL: http://127.0.0.1:8000
Swagger Docs: http://127.0.0.1:8000/docs

Contributors
Willy Kalisa

If you have any issues, questions, or feedback, feel free to open an issue on the GitHub repository or reach out directly!