from flask import Flask
from pubmedGPT import *

app = Flask(__name__)

@app.route('/executescript')
def run_script():
    result = generate_pubmed_data()  # Pass the parameter to the function
    return result

if __name__ == "__main__":
    app.run(debug=True)