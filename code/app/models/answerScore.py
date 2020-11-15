import datetime

from app.db import db


class AnswerScoreModel(db.Model):
    __tablename__ = 'answer_score'

    id = db.Column(db.Integer, primary_key=True)
    score = db.Column(db.Integer)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    user_answer = db.relationship('UserAnswerModel', lazy='dynamic')


    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    @classmethod
    def find_by_score(cls, score):
        return cls.query.filter_by(score=score).first()

    @classmethod
    def find_by_id(cls, _id):
        return cls.query.filter_by(id=_id).first()
