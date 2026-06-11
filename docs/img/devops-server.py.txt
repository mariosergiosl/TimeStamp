#!bin/python
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/devops", methods=['GET'])
def operation():
    return jsonify({"uuid": '71477d86-afba-400e-8766-40bbeccdba35'})

def main():    
    app.run(host='0.0.0.0', port='8080', debug=True)

if __name__ == '__main__':
    main()
