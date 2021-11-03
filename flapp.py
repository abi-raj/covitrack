from flask import Flask, render_template, request, redirect, url_for, flash, jsonify

app= Flask(__name__)

import psycopg2

# Update connection string information
host = "agada-s1.postgres.database.azure.com"
dbname = "postgres"
user = "agada@agada-s1"
password = "Password123$"
sslmode = "require"

# conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
# conn = psycopg2.connect(conn_string)
# print("Connection established")

# cursor = conn.cursor()

# cursor.execute("CREATE TABLE IF NOT EXISTS users (email VARCHAR(50) UNIQUE, mobile VARCHAR(10) UNIQUE);")
# cursor.execute("insert into users values('a@gmial.com','098');")
# cursor.execute("insert into users values('ab@gmial.com','21');")

def getCon():
    conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
    conn = psycopg2.connect(conn_string)
    print("Connection established")
    cursor = conn.cursor()
    return cursor

def addPatient(email,phone):
    cursor = getCon()
    cursor.execute("insert into users values(%s,%s)",(email,phone))
    cursor.close()

def addEmergency(email,date):
    cursor = getCon()
    cursor.execute("insert into emergency values(%s,%s)",(email,date))
    cursor.close()

def addDailyTest(email,score,date):
    cursor = getCon()
    cursor.execute("insert into daily values(%s,%s,%s)",(email,score,date))
    cursor.close()

def addPrescription(email,morning,afternoon,evening):
    cursor = getCon()
    cursor.execute("insert into prescription values(%s,%s,%s,%s)",(email,morning,afternoon,evening))
    cursor.close()


def checkUserInDB(email,phone):
    cursor = getCon()
    cursor.execute("select * from users where email=%s and mobile=%s",(email,phone))
    data = cursor.fetchall()
    cursor.close()
    return True if len(data)>0 else False

@app.route('/')
def index():
    return "hello world"

@app.route('/checkUser',methods=['POST'])
def checkUser():
    data=request.get_json()
    email=data['email']
    mobile=data['mobile']
    return jsonify({"status":checkUserInDB(email,mobile)})

@app.route('/getUsers',methods=['GET'])
def getUsers():
    #writeData()
    cursor = getCon()
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    result={}
    patients = []
   
    for user in users:
        patient = {
            'email': user[0],
            'mobile': user[1]
        }
        patients.append(patient)
    cursor.close()
    result['patients'] = patients
    return jsonify(result)

@app.route('/getEmergency',methods=['GET'])
def getEmergency():
    cursor = getCon()
    cursor.execute("SELECT * FROM emergency")
    users = cursor.fetchall()
    result={}
    patients = []
   
    for user in users:
        patient = {
            'email': user[0],
            'date': user[1]
        }
        patients.append(patient)
    cursor.close()
    result['emergencies'] = patients
    return jsonify(result)

@app.route('/getDailyAll',methods=['GET'])
def getDailyAll():
    cursor = getCon()
    cursor.execute("SELECT * FROM daily")
    users = cursor.fetchall()
    result={}
    patients = []
   
    for user in users:
        patient = {
            'email': user[0],
            'score': user[1],
            'date': user[2]
        }
        patients.append(patient)
    cursor.close()
    result['dailies'] = patients
    return jsonify(result)

@app.route('/getDailySingle',methods=['POST'])
def getDailySingle():
    data=request.get_json()
    email=data['email']
    cursor = getCon()
    cursor.execute("SELECT * FROM daily where email=%s",(email))
    users = cursor.fetchall()
    result={}
    patients = []
   
    for user in users:
        patient = {
            'email': user[0],
            'score': user[1],
            'date': user[2]
        }
        patients.append(patient)
    cursor.close()
    result['dailies'] = patients
    return jsonify(result)

@app.route('/addEmergency',methods=['POST'])
def addEmergencyUser():
    data=request.get_json()
    email=data['email']
    date=data['date']
    addEmergency(email,date)
    return jsonify({"status":"success"})

@app.route('/getPrescription',methods=['GET'])
def getPrescription():
    data=request.get_json()
    email=data['email']
    cursor = getCon()
    print(email)
    cursor.execute("select * from prescription where id='"+email+"'")
    users = cursor.fetchall()
    result={}
    patients = []
   
    for user in users:
        patient = {
            'id': user[0],
            'morning': user[1],
            'afternoon': user[2],
            'evening':user[3],
        }
        patients.append(patient)
    cursor.close()
    result['pres'] = patients
    return jsonify(result)
    
@app.route('/addDailyScore',methods=['POST'])
def addDailyScore():
    data=request.get_json()
    email=data['email']
    score=data['score']
    date=data['date']
    addDailyTest(email,score,date)
    return jsonify({"status":"success"})

if __name__ == '__main__':
    app.run(debug=True)