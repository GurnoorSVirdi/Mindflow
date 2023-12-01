from flask import Flask, jsonify, request
import requests
from openai import OpenAI

app = Flask(__name__)

client = OpenAI(
    # defaults to os.environ.get("OPENAI_API_KEY")
    api_key="",
)

# A simple route to test the server
@app.route('/')
def home():
    return "Hello, this is the Flask server!"

@app.route('/process_gpt', methods=['POST'])
def process_gpt():
    data = request.json

    try:
        # Ensure that the POST request has a 'text' field
        if 'text' not in data:
            return jsonify({'error': 'No text provided'}), 400

        text = data['text']

        response = client.chat.completions.create(
            # model="gpt-3.5-turbo-1106",
            model="ada",
            response_format={"type": "json_object"},
            messages=[
                {"role": "system", "content": "You are a helpful assistant designed to output JSON."},
                {"role": "system", "content": "Imagine you are a therapist trying to help a patient express \
                 themselves, talk more, and guide their thoughts in an audio journal. Respond based on this."},
                {"role": "user", "content": text}
            ],
        )

        print(response.choices[0].message.content)

        # Return the GPT response
        return response.choices[0].message.content

    except Exception as e:
        # Handle exceptions
        return jsonify({'error': str(e)}), 500




# A route to handle GET requests
@app.route('/get_data', methods=['GET'])
def get_data():
    # You can fetch data from a database or perform other operations here
    data = {"message": "Data fetched successfully"}
    return jsonify(data)

# A route to handle POST requests
@app.route('/post_data', methods=['POST'])
def post_data():
    # Extract data sent in the request body
    data_received = request.json
    # You can process the data or store it in a database here
    response = {"message": "Data received successfully", "data": data_received}
    return jsonify(response)

# A route to handle PUT requests
@app.route('/update_data/<id>', methods=['PUT'])
def update_data(id):
    # Here, you can update data based on the 'id' and request body
    updated_data = request.json
    response = {"message": "Data updated successfully for ID: " + id, "data": updated_data}
    return jsonify(response)

# A route to handle DELETE requests
@app.route('/delete_data/<id>', methods=['DELETE'])
def delete_data(id):
    # Here, you can delete data based on the 'id'
    # Perform deletion operation
    return jsonify({"message": "Data deleted successfully for ID: " + id})

if __name__ == '__main__':
    app.run(debug=True)