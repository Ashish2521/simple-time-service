from flask import Flask

def create_app():
    app = Flask(__name__)

    from app.routes import time_blueprint
    app.register_blueprint(time_blueprint)

    return app