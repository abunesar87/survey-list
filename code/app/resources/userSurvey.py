from flask import request
from flask_restful import Resource

from app.models.user import UserModel
from app.models.userSurvey import UserSurveyModel
from app.models.userAnswer import UserAnswerModel
from app.models.answerScore import AnswerScoreModel
from app.models.userScore import UserScoreModel
from app.models.question import QuestionModel
from app.models.survey import SurveyModel
from app.models.scoreType import ScoreTypeModel
from app.schemas.user import UserSchema
from app.schemas.userSurvey import UserSurveySchema
from app.schemas.scoreType import ScoreTypeSchema
from app.calculation.scoreCalculation import CalculateAnswerScore, CalculateSurveyScore
from app.libs.strings import gettext

user_schema = UserSchema()
user_survey_schema = UserSurveySchema()
score_type_list_schema = ScoreTypeSchema(many=True)


class UserSurvey(Resource):

    def post(self):
        json_data = request.get_json()
        person = UserModel.find_by_person_id(json_data["person_id"])
        if person is None:
            person_json = {}
            if "person_id" in json_data:
                person_json["person_id"] = json_data["person_id"]
            person = user_schema.load(person_json)
            try:
                person.save_to_db()
            except:
                return {"message": gettext("person_id_error_inserting")}, 500

        person_id = person.id
        user_survey_json = {
            "user_id": person_id
        }

        if "survey_id" in json_data:
            survey = SurveyModel.find_by_survey_id(json_data["survey_id"])
            if survey:
                user_survey_json["survey_id"] = survey.id
            else:
                return {"message": gettext("survey_not_found")}, 404

        if "answers" in json_data:
            user_answers = []
            all_scores = {}
            user_scores = []
            for element in json_data["answers"]:
                answer_json = {}
                question = QuestionModel.find_by_question_and_survey(element, survey.id)
                if question:
                    answer_json["question_id"] = question.id
                else:
                    return {"message": "question_id '{}' not found in this survey".format(element)}, 404
                if type(json_data["answers"][element]) is bool:
                    answer_json["answer"] = -1
                    answer_json["text"] = str(json_data["answers"][element])
                    answer_json["answer_score"] = {
                        "score": -1
                    }
                else:
                    answer_json["answer"] = json_data["answers"][element]
                    calculate_answer_score = CalculateAnswerScore(json_data["answers"][element], question.reverse_score)
                    answer_json["answer_score"] = {
                        "score": calculate_answer_score.get_score()
                    }
                user_answers.append(answer_json)
                all_scores[element] = answer_json["answer_score"]["score"]

            user_survey_json["user_answers"] = user_answers

            score_types = ScoreTypeModel.find_by_survey_id(survey.id)
            if score_types:
                score_type_json = score_type_list_schema.dump(score_types)
                for item in score_type_json:
                    score_type_name = item["score_type_id"]
                    calculating_items = { item_key: all_scores[item_key] for item_key in list(set(all_scores) & set(item["items"])) }
                    if 2*len(calculating_items) >= len(item["items"]):
                        calculate_survey_score = CalculateSurveyScore(calculating_items)
                        final_score = calculate_survey_score.get_score()
                    else:
                        final_score = None
                    final_score_json = {
                        "name": score_type_name,
                        "score": final_score,
                        "score_type_id": item["id"]
                    }
                    user_scores.append(final_score_json)
                user_survey_json["user_scores"] = user_scores

        user_survey = user_survey_schema.load(user_survey_json)
        try:
            user_survey.save_to_db()
        except:
            return {"message": gettext("user_survey_error_inserting")}, 500

        return user_survey_schema.dump(user_survey), 201
