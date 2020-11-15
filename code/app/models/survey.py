from app.db import db
from app.models.question import QuestionModel
import datetime
from sqlalchemy.dialects.postgresql import JSON
from typing import List


class SurveyModel(db.Model):
    __tablename__ = 'survey'

    id = db.Column(db.Integer, primary_key=True)
    survey_id = db.Column(db.String(80), nullable=False, unique=True)
    title = db.Column(JSON, nullable=False)
    created_at = db.Column(db.DateTime(timezone=True), default=datetime.datetime.utcnow)
    updated_at = db.Column(db.DateTime(timezone=True), onupdate=datetime.datetime.utcnow)
    deleted = db.Column(db.Boolean, default=False)

    questions = db.relationship('QuestionModel', lazy='dynamic')
    # user_surveys = db.relationship('UserSurveyModel', lazy='dynamic')


    def surveyjs_json(self):
        return {
            'title': self.title,
            'pages': [
                {
                    "name": item.question_id,
                    "elements":[
                        item.question
                    ],
                    "visibleIf": item.visible_if,
                    "title": item.page_title
                } for item in self.questions.order_by(QuestionModel.id).all()
            ],
            "showProgressBar":"top"
        }

    def save_to_db(self) -> None:
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self) -> None:
        db.session.delete(self)
        db.session.commit()

    @classmethod
    def find_by_survey_id(cls, survey_id):
        return cls.query.filter_by(survey_id=survey_id).first()

    @classmethod
    def find_by_id(cls, _id):
        return cls.query.filter_by(id=_id).first()

    @classmethod
    def find_all(cls) -> List["SurveyModel"]:
        return cls.query.all()
