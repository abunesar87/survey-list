from app import app

from flask import Flask, jsonify
from flask_restful import Api
from marshmallow import ValidationError

from app.ma import ma
from app.db import db

from app.resources.survey import Survey, SurveyList, SurveyForSurveyJS
from app.resources.userSurvey import UserSurvey
from app.resources.user import User, UserList
from app.resources.scoreType import ScoreType, ScoreTypeList

api = Api(app)


@app.before_first_request
def create_tables():
    db.create_all()


@app.errorhandler(ValidationError)
def handle_marshmallow_validation(e):
    return jsonify(e.messages), 400


api.add_resource(Survey, '/survey/<string:survey_id>')
api.add_resource(SurveyForSurveyJS, '/surveyForSurveyJS/<string:survey_id>')
api.add_resource(SurveyList, '/surveys')
api.add_resource(UserSurvey, '/userSurvey')
api.add_resource(User, '/user/<string:person_id>')
api.add_resource(UserList, '/users')
api.add_resource(ScoreType, '/scoreType/<string:score_type_id>')
api.add_resource(ScoreTypeList, '/scoreTypes')

db.init_app(app)
ma.init_app(app)

