import datetime
from typing import List

from app.db import db


class UserSurveyModel(db.Model):
    __tablename__ = 'user_survey'

    id = db.Column(db.Integer, primary_key=True)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    user = db.relationship('UserModel')

    survey_id = db.Column(db.Integer, db.ForeignKey('survey.id'), nullable=False)
    survey = db.relationship('SurveyModel')

    user_scores = db.relationship('UserScoreModel', lazy='dynamic')

    user_answers = db.relationship('UserAnswerModel', lazy='dynamic')


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
    def find_all(cls) -> List["UserSurveyModel"]:
        return cls.query.all()
