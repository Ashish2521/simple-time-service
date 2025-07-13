from flask import Blueprint, jsonify
from datetime import datetime
import logging

time_blueprint = Blueprint('time', __name__)

logging.basicConfig(level=logging.INFO)

@time_blueprint.route("/", methods=["GET"])
def get_time():
    logging.info("GET / called")
    return jsonify({
        "service": "SimpleTimeService",
        "timestamp": datetime.utcnow().isoformat()
    })