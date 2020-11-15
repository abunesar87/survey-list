from app.ma import ma
from app.models.question import QuestionModel
# from models.survey import SurveyModel


class QuestionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = QuestionModel
        load_instance = True
        load_only = ("survey", "deleted")
        dump_only = ("id", "survey_id")
        include_fk = True
