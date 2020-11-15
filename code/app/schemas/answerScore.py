from app.ma import ma
from app.models.answerScore import AnswerScoreModel


class AnswerScoreSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = AnswerScoreModel
        load_instance = True
        load_only = ("deleted", )
        dump_only = ("id", )
        include_fk = True
