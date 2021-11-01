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

def writeData():
    cursor = getCon()
    cursor.execute("CREATE TABLE users (email VARCHAR(50) UNIQUE, mobile VARCHAR(10) UNIQUE);")   
    cursor.execute("insert into users values('a@gmial.com','098');")
    cursor.execute("insert into users values('ab@gmial.com','21');")
    cursor.close()


@app.route('/')
def index():
    return "hello world"

@app.route('/checkUser')
def checkUser():
    return render_template('checkUser.html')

@app.route('/getUsers')
def getUsers():
    #writeData()
    cursor = getCon()
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    for user in users:
        print(user)
    cursor.close()
    return "render_template('getUsers.html', users=users)"


if __name__ == '__main__':
    app.run(debug=True)