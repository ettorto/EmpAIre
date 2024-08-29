from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Initialize the Firebase Admin SDK
cred = credentials.Certificate('key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

@app.route('/users', methods=['POST'])
def create_user():
    data = request.get_json()
    print(data)
    try:
     
        db.collection('users').document(data["student_id"]).set({
            'email': data["email"],
            'name': data['name'],
            'dob': data['dob'],
            'year_group': data['year_group'],
            'major': data['major'],
            'residence': data['residence'],
            'best_food': data['best_food'],
            'best_movie': data['best_movie'],
            'password': data['password']
        })  

        return jsonify({'success': True}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 400


@app.route('/users/<uid>', methods=['PUT'])
def edit_user(uid):
    data = request.get_json()

    db.collection('users').document(uid).set({
        # 'dob': data['dob'],
        # 'year_group': data['year_group'],
        'major': data['major'],
        'residence': data['residence'],
        'best_food': data['best_food'],
        'best_movie': data['best_movie']
    }, merge=True)

    user_data = db.collection('users').document(uid).get().to_dict()

    return jsonify(user_data), 200


@app.route('/users/<uid>', methods=['GET'])
def get_user(uid):

    user_data = db.collection('users').document(uid).get().to_dict()
    if user_data is None:
        return jsonify({'error': 'User not found'}), 404

    return jsonify({
        'email': user_data['email'],
        'name': user_data['name'],
        'dob': user_data['dob'],
        'year_group': user_data['year_group'],
        'major': user_data['major'],
        'residence': user_data['residence'], 
        'best_food': user_data['best_food'],
        'best_movie': user_data['best_movie'],
    }), 200

@app.route('/login', methods=['POST'])
def login():
    email = request.json['email']
    password = request.json['password']

    # Query Firestore for user with matching email and password
    users_ref = db.collection('users')
    query = users_ref.where('email', '==', email).where('password', '==', password).limit(1)
    docs = query.get()

    if len(docs) == 0:
        return jsonify({'error': 'Invalid email or password'})

    # Get user document and return as JSON
    user = docs[0].to_dict()
    user['student_id'] = docs[0].id
    return jsonify(user)


if __name__ == '__main__':
    app.run(debug=True)