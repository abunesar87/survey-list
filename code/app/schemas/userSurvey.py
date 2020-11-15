from app.ma import ma
from app.models.userSurvey import UserSurveyModel
# from models.question import QuestionModel
from app.schemas.userAnswer import UserAnswerSchema
from app.schemas.userScore import UserScoreSchema


class UserSurveySchema(ma.SQLAlchemyAutoSchema):
    user_answers = ma.Nested(UserAnswerSchema, many=True)
    user_scores = ma.Nested(UserScoreSchema, many=True)

    class Meta:
        model = UserSurveyModel
        load_instance = True
        load_only = ("deleted",)
        dump_only = ("id",)
        include_fk = True
