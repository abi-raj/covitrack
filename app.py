import psycopg2

# Update connection string information
host = "agada-s1.postgres.database.azure.com"
dbname = "postgres"
user = "agada@agada-s1"
password = "Password123$"
sslmode = "require"

# Construct connection string
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")

cursor = conn.cursor()

# cursor.execute("CREATE TABLE users(email varchar(50) primary key,mobile varchar(50) UNIQUE)")
# cursor.execute("CREATE TABLE emergency(id varchar(50),date varchar(50),foreign key(id) references users(email))")
# cursor.execute("CREATE TABLE daily(id varchar(50),score int,date varchar(50),foreign key(id) references users(email))")
# cursor.execute("CREATE TABLE prescription(id varchar(50),morning varchar(50),afternoon varchar(50),evening varchar(50),foreign key(id) references users(email))")
# Drop previous table of same name if one exists
# cursor.execute("DROP TABLE users;")
# print("Finished dropping table (if existed)")

#cursor.execute("CREATE TABLE users (email VARCHAR(50) UNIQUE, mobile VARCHAR(10) UNIQUE);") 
# cursor.execute("insert into users values('a@g.com','098');")
# cursor.execute("insert into users values('ab@g.com','021');")
# cursor.execute("insert into  emergency values('a@g.com','02-11-2021')")
# cursor.execute("insert into  emergency values('ab@g.com','01-11-2021')")
# cursor.execute("insert into daily values('a@g.com',80,'01-11-2021')")
cursor.execute("insert into prescription values('a@g.com','Paracetomal','Dolo 650','Vapo Rub')")
cursor.execute("insert into prescription values('ab@g.com','Paracetomal','Dolo 650','Vapo Rub')")
# Create a table
# cursor.execute("CREATE TABLE inventory (id serial PRIMARY KEY, name VARCHAR(50), quantity INTEGER);")
# print("Finished creating table")

# # Insert some data into the table
# cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("banana", 150))
# cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("orange", 154))
# cursor.execute("INSERT INTO inventory (name, quantity) VALUES (%s, %s);", ("apple", 100))
# print("Inserted 3 rows of data")

# Clean up
conn.commit()
cursor.close()
conn.close()