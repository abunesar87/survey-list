from app.ma import ma
from app.models.scoreType import ScoreTypeModel


class ScoreTypeSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = ScoreTypeModel
        load_instance = True
        load_only = ("deleted",)
        dump_only = ("id",)
        include_fk = True
