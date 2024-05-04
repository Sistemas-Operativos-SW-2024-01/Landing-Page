from flask import Flask, render_template, request
import mysql.connector
from config import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

app = Flask(__name__)
db = mysql.connector.connect(
    host=DB_HOST,
    user=DB_USER,
    password=DB_PASSWORD,
    database=DB_NAME
)
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    # Obtener datos del formulario
    username = request.form['username']
    password = request.form['password']

    # Insertar datos en la base de datos
    cursor = db.cursor()
    cursor.execute("INSERT INTO usuarios (nombre_usuario, contrasenia) VALUES (%s, %s)", (username, password))
    db.commit()
    cursor.close()

    return 'Usuario registrado correctamente'
