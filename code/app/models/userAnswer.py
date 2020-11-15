import datetime
from typing import List

from app.db import db


class UserAnswerModel(db.Model):
    __tablename__ = 'user_answer'

    id = db.Column(db.Integer, primary_key=True)
    answer = db.Column(db.Integer)
    text = db.Column(db.String(80))
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    user_survey_id = db.Column(db.Integer, db.ForeignKey('user_survey.id'), nullable=False)
    user_survey = db.relationship('UserSurveyModel')

    question_id = db.Column(db.Integer, db.ForeignKey('question.id'), nullable=False)
    question = db.relationship('QuestionModel')

    answer_score_id = db.Column(db.Integer, db.ForeignKey('answer_score.id'), nullable=False)
    answer_score = db.relationship('AnswerScoreModel')


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
    def find_by_answer(cls, answer):
        return cls.query.filter_by(answer=answer).first()

    @classmethod
    def find_all(cls) -> List["UserAnswerModel"]:
        return cls.query.all()