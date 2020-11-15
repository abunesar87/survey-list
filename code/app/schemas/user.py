from app.ma import ma
from app.models.user import UserModel
from app.schemas.userSurvey import UserSurveySchema


class UserSchema(ma.SQLAlchemyAutoSchema):
    user_surveys = ma.Nested(UserSurveySchema, many=True)

    class Meta:
        model = UserModel
        load_instance = True
        dump_only = ("id", )
