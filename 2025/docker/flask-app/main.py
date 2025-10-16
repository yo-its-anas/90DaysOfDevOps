from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
            # This is the message the browser will see
     return "Hello Docker (Web Server) !!!"

if __name__ == '__main__':
                                        # Flask will listen on ALL interfaces (0.0.0.0) on port 8080
     app.run(host='0.0.0.0', port=8080)
