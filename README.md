# Survey Fukujuji


## Technology Used:

```
Python3
Flask
Flask-RESTful
Flask-SQLAlchemy
Vue JS
Nginx
Postgresql
Docker
```

## Step 1

Clone the repository

```
git clone REPOSITORY_URL
```

Move to the directory

```
cd survey-fukujuji
```

## Step 2

Create a virtual environment

```
$ python3 -m venv venv

On Windows:
$ py -3 -m venv venv

On Mac

virtualenv venv --python=python3.6

```

Activate the virtual environment

```
$ . venv/bin/activate

On Windows:
> venv\Scripts\activate

On Mac

source venv/bin/activate

```

## Step 3

docker-compose up --build


## Available Endpoints

```
http://localhost//survey/<string:survey_id>  # To create, view and delete survey
http://localhost/surveys  # To view all survey list
http://localhost/surveyForSurveyJS/<string:survey_id>  # get survey data in SurveyJS library input json format
http://localhost/scoreType/<string:score_type_id> # To create, view and delete final scoring category for a survey
http://localhost/scoreTypes  # get list of all scoring categories
http://localhost/userSurvey  # post a persons answers of a survey
http://localhost/user/<person_id>  # To create, view and delete person_id
http://localhost/users  # To view all details of a person
```