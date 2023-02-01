# Writing a main file that prints:
# Devops is great

from flask import Flask

app = Flask(__name__)
moto = "Devops is great"

@app.route("/")
def motivation():
    return moto

if __name__ == '__main__':
    app.run(host='0.0.0.0')