from flask import request
from flask_restful import Resource

from app.libs.strings import gettext
from app.models.scoreType import ScoreTypeModel
from app.models.survey import SurveyModel
from app.schemas.scoreType import ScoreTypeSchema

score_type_schema = ScoreTypeSchema()
score_type_list_schema = ScoreTypeSchema(many=True)


class ScoreType(Resource):
    def get(self, score_type_id):
        score_type = ScoreTypeModel.find_by_score_type_id(score_type_id)
        if score_type:
            return score_type_schema.dump(score_type)
        return {"message": gettext("score_type_not_found")}, 404

    def post(self, score_type_id):
        if ScoreTypeModel.find_by_score_type_id(score_type_id):
            return {"message": gettext("score_type_already_exists").format(score_type_id)}, 400

        score_type_json = request.get_json()
        score_type_json["score_type_id"] = score_type_id
        if "survey_id" in score_type_json:
            survey = SurveyModel.find_by_survey_id(score_type_json["survey_id"])
            if survey:
                score_type_json["survey_id"] = survey.id
            else:
                return {"message": gettext("survey_not_found")}, 404
        score_type = score_type_schema.load(score_type_json)
        try:
            score_type.save_to_db()
        except:
            return {"message": gettext("score_type_error_inserting")}, 500

        return score_type_schema.dump(score_type), 201

    def delete(self, score_type_id):
        score_type = ScoreTypeModel.find_by_score_type_id(score_type_id)
        if score_type:
            score_type.delete_from_db()

        return {"message": gettext("score_type_deleted")}, 200


class ScoreTypeList(Resource):
    def get(self):
        score_types = score_type_list_schema.dump(ScoreTypeModel.find_all())
        return {'score_types': score_types}
