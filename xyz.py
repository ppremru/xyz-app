from flask import Flask
import os

app = Flask(__name__)

# Get tag from an environment variable, with a default value
MESSAGE = os.environ.get('MESSAGE', 'message from application')

@app.route('/')
def hello_world():
    return f'Hello, World! Message variable: {MESSAGE}.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
