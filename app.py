from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Ola! Welcome to my Python micro services POC.\n This is a github workflow.."

@app.get("/health")
def health():
    return jsonify(status="healthy"), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)