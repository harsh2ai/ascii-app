from flask import Flask, request, jsonify


app = Flask(__name__)


@app.route('/api', methods=['GET'])
def returnascii():
    print(request.args)
    d = {}
    inputchr = str(request.args['query'])
    answer = 0
    for x in inputchr:
        answer += ord(x)

    d['output'] = str(answer)
    return d


if __name__ == "__main__":
    app.run(debug=True)
