from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from CI/CD Pipeline!'

# Add this for App Engine compatibility if running locally needs it
# Although gunicorn is usually used for deployment, this can help local testing
if __name__ == '__main__':
    # Get port from environment variable or default to 8080
    port = int(os.environ.get("PORT", 8080))
    # Add host='0.0.0.0' to make it accessible externally if needed locally
    app.run(host='0.0.0.0', port=port, debug=True)
