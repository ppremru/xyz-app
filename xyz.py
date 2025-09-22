from flask import Flask
import os

app = Flask(__name__)

# Get tag from an environment variable, with a default value
TAG = os.environ.get('TAG', '1.0.0')

@app.route('/')
def hello_world():
    return f'Hello, World! This is tagged {TAG}.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
