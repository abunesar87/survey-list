from app.ma import ma
from app.models.userScore import UserScoreModel
# from schemas.userAnswer import UserAnswerSchema


class UserScoreSchema(ma.SQLAlchemyAutoSchema):
    # user_answers = ma.Nested(UserAnswerSchema, many=True)

    class Meta:
        model = UserScoreModel
        load_instance = True
        load_only = ("deleted",)
        dump_only = ("id", "user_survey_id")
        include_fk = True
