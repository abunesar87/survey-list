import datetime
from typing import List

from app.db import db


class UserModel(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    person_id = db.Column(db.String(80), nullable=False, unique=True)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    user_surveys = db.relationship('UserSurveyModel', lazy='dynamic')


    def save_to_db(self) -> None:
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self) -> None:
        db.session.delete(self)
        db.session.commit()

    @classmethod
    def find_by_id(cls, _id):
        return cls.query.filter_by(id=_id).first()

    @classmethod
    def find_by_person_id(cls, person_id):
        return cls.query.filter_by(person_id=person_id).first()

    @classmethod
    def find_all(cls) -> List["UserModel"]:
        return cls.query.all()