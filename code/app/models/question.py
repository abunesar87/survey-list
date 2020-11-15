import datetime
from sqlalchemy.dialects.postgresql import JSON
from typing import List

from app.db import db


class QuestionModel(db.Model):
    __tablename__ = 'question'

    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.String(80), nullable=False)
    question = db.Column(JSON, nullable=False)
    page_title = db.Column(JSON)
    visible_if = db.Column(db.String(80))
    reverse_score = db.Column(db.Boolean, default=False)
    scoring_rule_id = db.Column(db.Integer, default=1)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    survey_id = db.Column(db.Integer, db.ForeignKey('survey.id'), nullable=False)
    survey = db.relationship('SurveyModel')
    
    
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
    def find_by_question_id(cls, question_id):
        return cls.query.filter_by(question_id=question_id).first()

    @classmethod
    def find_by_question_and_survey(cls, question_id, survey_id):
        return cls.query.filter_by(question_id=question_id).filter_by(survey_id=survey_id).first()

    @classmethod
    def find_by_id(cls, _id):
        return cls.query.filter_by(id=_id).first()

    @classmethod
    def find_all(cls) -> List["QuestionModel"]:
        return cls.query.all()
