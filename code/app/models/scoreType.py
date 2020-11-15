import datetime
from typing import List

from app.db import db


class ScoreTypeModel(db.Model):
    __tablename__ = 'score_type'

    id = db.Column(db.Integer, primary_key=True)
    score_type_id = db.Column(db.String(80), nullable=False, unique=True)
    title = db.Column(db.String(80), nullable=False)
    items = db.Column(db.ARRAY(db.String), nullable=False)
    calculation_rule_id = db.Column(db.Integer, default=1)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    survey_id = db.Column(db.Integer, db.ForeignKey('survey.id'), nullable=False)
    survey = db.relationship('SurveyModel')

    # score_type = db.relationship('UserScoreModel', lazy='dynamic')


    def save_to_db(self) -> None:
        db.session.add(self)
        db.session.commit()

    def save_to_db_all(self) -> None:
        db.session.bulk_save_objects(self)
        db.session.commit()

    def delete_from_db(self) -> None:
        db.session.delete(self)
        db.session.commit()

    @classmethod
    def find_by_score_type_id(cls, score_type_id):
        return cls.query.filter_by(score_type_id=score_type_id).first()

    @classmethod
    def find_by_survey_id(cls, survey_id) -> List["ScoreTypeModel"]:
        return cls.query.filter_by(survey_id=survey_id).all()


    @classmethod
    def find_by_id(cls, _id):
        return cls.query.filter_by(id=_id).first()

    @classmethod
    def find_all(cls) -> List["ScoreTypeModel"]:
        return cls.query.all()
