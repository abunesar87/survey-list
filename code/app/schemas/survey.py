from app.ma import ma
from app.models.survey import SurveyModel
# from models.question import QuestionModel
from app.schemas.question import QuestionSchema


class SurveySchema(ma.SQLAlchemyAutoSchema):
    questions = ma.Nested(QuestionSchema, many=True)

    class Meta:
        model = SurveyModel
        load_instance = True
        load_only = ("deleted",)
        dump_only = ("id",)
        include_fk = True
