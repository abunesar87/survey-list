import datetime
from typing import List

from app.db import db


class UserScoreModel(db.Model):
    __tablename__ = 'user_score'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), default="Unknown Name")
    score = db.Column(db.Float)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    user_survey_id = db.Column(db.Integer, db.ForeignKey('user_survey.id'), nullable=False)
    user_survey = db.relationship('UserSurveyModel')

    score_type_id = db.Column(db.Integer, db.ForeignKey('score_type.id'), nullable=False)
    # score_type = db.relationship('ScoreTypeModel')


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
    def find_all(cls) -> List["UserScoreModel"]:
        return cls.query.all()