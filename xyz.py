from flask import Flask
import os

app = Flask(__name__)

# Get version from an environment variable, with a default value
VERSION = os.environ.get('APP_VERSION', '1.0.0')

@app.route('/')
def hello_world():
    return f'Hello, World! This is version {VERSION}.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
