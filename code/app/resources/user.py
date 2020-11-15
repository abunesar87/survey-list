from flask_restful import Resource

from app.models.user import UserModel
from app.schemas.user import UserSchema
from app.libs.strings import gettext

user_schema = UserSchema()
user_list_schema = UserSchema(many=True)


class User(Resource):

    def get(self, person_id):
        user = UserModel.find_by_person_id(person_id)
        if user:
            return user_schema.dump(user)
        return {"message": gettext("person_id_not_found")}, 404

    def post(self, person_id):
        if UserModel.find_by_person_id(person_id):
            return {"message": gettext("person_id_already_exists").format(person_id)}, 400

        user = UserModel(person_id=person_id)
        try:
            user.save_to_db()
        except:
            return {"message": gettext("person_id_error_inserting")}, 500

        return user_schema.dump(user), 201

    def delete(self, person_id):
        user = UserModel.find_by_person_id(person_id)
        if user:
            user.delete_from_db()

        return {"message": gettext("person_id_deleted")}, 200


class UserList(Resource):
    def get(self):
        users = user_list_schema.dump(UserModel.find_all())
        return {'users': users}
