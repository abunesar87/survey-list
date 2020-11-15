from flask import request
from flask_restful import Resource

from app.libs.strings import gettext

from app.models.survey import SurveyModel
from app.models.question import QuestionModel
from app.schemas.survey import SurveySchema
from app.schemas.question import QuestionSchema


survey_schema = SurveySchema()
survey_list_schema = SurveySchema(many=True)
question_schema = QuestionSchema()
question_list_schema = QuestionSchema(many=True)


class Survey(Resource):

    def get(self, survey_id):
        survey = SurveyModel.find_by_survey_id(survey_id)
        if survey:
            return survey_schema.dump(survey)
        return {"message": gettext("survey_not_found")}, 404

    def post(self, survey_id):
        if SurveyModel.find_by_survey_id(survey_id):
            return {"message": gettext("survey_already_exists").format(survey_id)}, 400

        survey_json = request.get_json()
        survey_json["survey_id"] = survey_id
        for item in survey_json["questions"]:
            item["question_id"] = item["question"]["name"]
            item["question"] = item["question"]
            item["page_title"] = item["page_title"]
        survey = survey_schema.load(survey_json)
        try:
            survey.save_to_db()
        except:
            return {"message": gettext("survey_error_inserting")}, 500

        return survey_schema.dump(survey), 201


    def delete(self, survey_id):
        survey = SurveyModel.find_by_survey_id(survey_id)
        if survey:
            survey.delete_from_db()

        return {"message": gettext("survey_deleted")}, 200


class SurveyList(Resource):
    def get(self):
        surveys = survey_list_schema.dump(SurveyModel.find_all())
        return {'surveys': surveys}

class SurveyForSurveyJS(Resource):
    def get(self, survey_id):
        survey = SurveyModel.find_by_survey_id(survey_id)
        if survey:
            return survey.surveyjs_json()
        return {"message": gettext("survey_not_found")}, 404