from app.ma import ma
from app.models.userAnswer import UserAnswerModel
from app.schemas.answerScore import AnswerScoreSchema


class UserAnswerSchema(ma.SQLAlchemyAutoSchema):
    answer_score = ma.Nested(AnswerScoreSchema)

    class Meta:
        model = UserAnswerModel
        load_instance = True
        load_only = ("user_survey", "question", "deleted")
        dump_only = ("id", "user_survey_id", "answer_score_id")
        include_fk = True
