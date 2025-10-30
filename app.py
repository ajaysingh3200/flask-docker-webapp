from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello from Flask in Docker!'

if __name__ == '__main__':
    # Bind to 0.0.0.0 so the container exposes the port
    app.run(host='0.0.0.0', port=5000)
