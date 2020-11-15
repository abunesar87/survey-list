import os
from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

app.config.from_object(os.environ["APP_SETTINGS"])

from app import route