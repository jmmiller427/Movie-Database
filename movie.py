from flask import Flask, render_template, redirect, url_for, request, flash, session
import MySQLdb
import sys
from flask_bootstrap import Bootstrap

app = Flask(__name__)
app.secret_key = "matt_miller"
Bootstrap(app)

db = MySQLdb.connect(host = "localhost",
					 user = "root", 
					 passwd = "Wildcat13",
					 db = "movies")

cur = db.cursor()

data_transfer = []

def login_check(uname, password):

	cur.execute("SELECT uname, password, user_type, name, user_id FROM users WHERE uname=%s AND password=%s" %(uname, password))

	row = cur.fetchall()

	if row:
		if row[0][2] == 0:
			session['user_type'] = "user"
			session['name'] = row[0][3]
			session['uname'] = row[0][0]
			session['user_id'] = row[0][4]
		else:
			session['user_type'] = "manager"
			session['name'] = row[0][3]
			session['uname'] = row[0][0]
			session['user_id'] = row[0][4]

	return session['user_type']

@app.route("/logout", methods=['GET', 'POST'])
def logout():

	session.pop('user_type', None)
	session.pop('name', None)
	session.pop('uname',None)
	session.pop('user_id',None)
	return redirect(url_for("home"))

@app.route("/login", methods=['GET', 'POST'])
def login():

	session['error'] = None

	if request.method == 'POST':

		uname = "'" + request.form.get("UserId") + "'"
		password = "'" + request.form.get("Password") + "'"

		auth = login_check(uname, password)

		if auth:
			if auth == "user":
				return redirect(url_for("home"))
			else:
				return redirect(url_for("home"))
		else:
			session['user_type'] = "None"
			session['error'] = "Incorrect UserName or Password"	

	return render_template('login.html')

@app.route("/register", methods=['GET', 'POST'])
def register():
	
	session['error'] = None

	if request.method == 'POST':
		name = "'" + request.form.get("name") + "'"
		uname = "'" + request.form.get("uname") + "'"
		password = "'" + request.form.get("Password") + "'"
		password_conf = "'" + request.form.get("Password_conf") + "'"
		DoB = "'" + str(request.form.get("DOB")) + "'"
		gender = "'" + request.form.get("Gender") + "'"

		if (name=="\'\'" or uname=="\'\'" or password=="\'\'" or password_conf=="\'\'" or DoB == "\'\'" or gender=="\'\'" ):
			session['error'] = "Fill in All Entries"
			return redirect(url_for("register"))
		
		if(password != password_conf):
			session['error'] = "Passwords Don't Match"
			return redirect(url_for("register"))
		
		cur.execute("SELECT uname FROM users WHERE uname = %s" %(uname))

		if(cur.fetchall()):
			session['error'] = "Please Select a Different UserName"
			return redirect(url_for("register"))

		cur.execute("INSERT INTO `users` (uname, name, DoB, gender, user_type, password) VALUES (%s, %s, %s, %s, %s, %s)" %(uname, name, DoB, gender, 0, password))
		db.commit()

		return redirect(url_for('login'))

	return render_template('register.html')


def sort_movies(sort_type):

	if "Title" in sort_type:
		movie_array = session['movies']
		session.pop('movies')
		title_array = []

		for i in movie_array:
			title_array.append(i[0][0])
			title_array.sort()

		for count, item in enumerate(title_array):
			for j in movie_array:
				if j[0][0] == item:
					movie_array[movie_array.index(j)], movie_array[count] = movie_array[count], movie_array[movie_array.index(j)]

		if "A-Z" in sort_type:
			session['movies'] = movie_array

		if "Z-A" in sort_type:
			movie_array.reverse()
			session['movies'] = movie_array

	elif "Duration" in sort_type:

		movie_array = session['movies']
		session.pop('movies')
		title_array = []

		for i in movie_array:
			title_array.append(int(i[6][0]))
			title_array.sort()

		for count, item in enumerate(title_array):
			for j in movie_array:
				if int(j[6][0]) == item:
					movie_array[movie_array.index(j)], movie_array[count] = movie_array[count], movie_array[movie_array.index(j)]

		session['movies'] = movie_array

	elif "Release" in sort_type:

		movie_array = session['movies']
		session.pop('movies')
		title_array = []

		for i in movie_array:
			title_array.append(i[5][0])
			title_array.sort()

		for count, item in enumerate(title_array):
			for j in movie_array:
				if j[5][0] == item:
					movie_array[movie_array.index(j)], movie_array[count] = movie_array[count], movie_array[movie_array.index(j)]

		session['movies'] = movie_array


def display_items(row):

	movies = []

	for i in row:
		temp = []
		cur.execute("SELECT title FROM movies WHERE movie_id=%s" %(i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE position=%d AND movie_id=%s" %(4, i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE position=%d AND movie_id=%s" %(1, i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE position=%d AND movie_id=%s" %(2, i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT summary FROM movies WHERE movie_id=%s" %(i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT release_date FROM movies WHERE movie_id=%s" %(i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT duration FROM movies WHERE movie_id=%s" %(i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT tag FROM tags WHERE movie_id=%s" %(i[0]))
		temp.append(cur.fetchall())

		cur.execute("SELECT review FROM user_rating WHERE movie_id=%s" %(i[0]))
		temp.append(cur.fetchall())

		movies.append(temp)

	all_movies = []

	for i in movies:
		new_movie = []
		for j in i:
			if len(j) > 1:
				temp = []
				for k in j:
					for l in k:
						temp.append(l)
				new_movie.append(temp)
			else:
				for k in j:
					temp = []
					for l in k:
						temp.append(l)
					new_movie.append(temp)
		all_movies.append(new_movie)

	session['movies'] = all_movies

@app.route("/display", methods=['GET', 'POST'])
def display():

	movies = []

	if (session['search_bar'] == "False" and session['user_type'] == "manager"):
		cur.execute("SELECT movie_id FROM movies")
		row = cur.fetchall()

		display_items(row)
		sort_movies("Title(A-Z)")

	if request.method == 'POST':
		mod_val = request.form.get("mod_val")
		actual = "'" + mod_val + "'"
		if mod_val != "No":

			btype = request.form['btn']
			if str(btype) == "Modify":

				global data_transfer
				data_transfer = ['Title', mod_val]
				return redirect(url_for('modify_movies'))

			elif str(btype) == "Add to Watchlist":

				cur.execute("SELECT movie_id FROM movies WHERE title=%s" %(actual))
				movie_id = cur.fetchall()
				user_id = session['user_id']

				cur.execute("INSERT INTO watchlist (movie_id, user_id) VALUES (%s, %s)" %(movie_id[0][0], user_id))
				db.commit()
				return redirect(url_for('watchlist'))

			elif str(btype) == "Rate":

				rating = "'" + request.form.get("rating") + "'"

				cur.execute("SELECT movie_id FROM movies WHERE title=%s" %(actual))
				movie_id = cur.fetchall()
				user_id = session['user_id']

				cur.execute("INSERT INTO user_rating (movie_id, user_id, review) VALUES (%s, %s, %s)" %(movie_id[0][0], user_id, rating))
				db.commit()

				return redirect(url_for('display'))

			elif str(btype) == "Tag":

				tag = "'" + request.form.get("tag") + "'"

				cur.execute("SELECT movie_id FROM movies WHERE title=%s" %(actual))
				movie_id = cur.fetchall()

				cur.execute("INSERT INTO tags (movie_id, tag) VALUES (%s, %s)" %(movie_id[0][0], tag))
				db.commit()

				return redirect(url_for('display'))

		search_request = "'" + request.form.get("search") + "'"
		sort_by = request.form.get("Sort_By")
		search_by = request.form.get("Search_By")

		if search_request == "''":
			cur.execute("SELECT movie_id FROM movies")
			row = cur.fetchall()
			
		else:

			if search_by == "All":
				cur.execute("(SELECT movie_id FROM movies WHERE title=%s or release_date=%s or duration=%s or language=%s) UNION (SELECT movie_id FROM crew WHERE name=%s) UNION (SELECT movie_id FROM tags WHERE tag=%s) UNION (SELECT movie_id FROM genre WHERE genre=%s)" %(search_request, search_request, search_request, search_request, search_request, search_request, search_request))

				row = cur.fetchall()

			elif search_by == "Genre":
				cur.execute("SELECT DISTINCT movie_id FROM genre WHERE genre LIKE %s" %(search_request))

				row = cur.fetchall()

			elif search_by == "Tags":
				cur.execute("SELECT DISTINCT movie_id FROM tags WHERE tag LIKE %s" %(search_request))

				row = cur.fetchall()

			elif search_by == "Movie":
				cur.execute("SELECT DISTINCT movie_id FROM movies WHERE title LIKE %s" %(search_request))

				row = cur.fetchall()

			elif search_by == "Crew":
				cur.execute("SELECT DISTINCT movie_id FROM crew WHERE name LIKE %s" %(search_request))

				row = cur.fetchall()

		display_items(row)
		sort_movies(sort_by)

	return render_template('display.html')

@app.route("/", methods=['GET', 'POST'])
def home():

	session['search_bar'] = "False"
	session['sort_by'] = "Title(A-Z)"

	try:
		session['user_type']
	except KeyError:
		session['user_type'] = "None"

	if request.method == 'POST':
		search_request = "'" + request.form.get("search") + "'"

		if search_request == "' '":
			cur.execute("SELECT movie_id FROM movies")
			row = cur.fetchall()
			display_items(row)
			sort_movies("Title(A-Z)")
			
		else:
			cur.execute("(SELECT movie_id FROM movies WHERE title=%s or release_date=%s or duration=%s or language=%s) UNION (SELECT movie_id FROM crew WHERE name=%s) UNION (SELECT movie_id FROM tags WHERE tag=%s) UNION (SELECT movie_id FROM genre WHERE genre=%s)" %(search_request, search_request, search_request, search_request, search_request, search_request, search_request))
			row = cur.fetchall()
			display_items(row)
			sort_movies("Title(A-Z)")
			session['search_bar'] = "True"

		return redirect(url_for('display'))

	return render_template('home.html')

@app.route("/watchlist", methods=['GET', 'POST'])
def watchlist():

	if not session:
		return redirect(url_for('home'))

	if session:

		cur.execute("SELECT DISTINCT movie_id FROM watchlist WHERE user_id=%s" %(session['user_id']))
		row = cur.fetchall()

		display_items(row)
		sort_movies(session['sort_by'])

		if request.method == 'POST':
			search_request = str("'" + request.form.get("search") + "'")
			sort_by = request.form.get("Sort_By")
			session['sort_by'] = sort_by
			search_by = request.form.get("Search_By")
			user_id = session['user_id']

			'''
				REMOVE FROM WATCHLIST DOES NOT WORK
			

			btype = request.form['btn']
			if str(btype) == "Remove Watchlist":

				print mod_val

				global data_transfer
				data_transfer = ['Title', mod_val]

				cur.execute("SELECT movie_id FROM movies WHERE title=%s" %(mod_val))
				movie_id = cur.fetchall()

				cur.execute("DELETE FROM watchlist WHERE user_id=%s AND movie_id=%s" %(user_id, movie_id))
				db.commit()

				return redirect(url_for('watchlist'))
			'''

			if search_request == "''":
				cur.execute("SELECT DISTINCT movie_id FROM watchlist WHERE user_id=%s" %(session['user_id']))
				row = cur.fetchall()

				display_items(row)
				sort_movies(sort_by)

				return redirect(url_for('watchlist'))

			else:
				cur.execute("(SELECT m.movie_id FROM movies AS m WHERE title=%s or release_date=%s or duration=%s or language=%s and m.movie_id IN (SELECT w1.movie_id FROM watchlist AS w1 WHERE user_id=%s))  UNION (SELECT c.movie_id FROM crew AS c WHERE name=%s and c.movie_id IN (SELECT w2.movie_id FROM watchlist AS w2 WHERE user_id=%s)) UNION (SELECT t.movie_id FROM tags AS t WHERE tag=%s and t.movie_id IN (SELECT w3.movie_id FROM watchlist AS w3 WHERE user_id=%s)) UNION (SELECT g.movie_id FROM genre AS g WHERE genre=%s and g.movie_id IN (SELECT w4.movie_id FROM watchlist AS w4 WHERE user_id=%s))" %(search_request, search_request, search_request, search_request, user_id, search_request, user_id, search_request, user_id, search_request, user_id))

				row = cur.fetchall()
				display_items(row)
				sort_movies(sort_by)
				
				return redirect(url_for('watchlist'))

	return render_template('watchlist.html')

@app.route("/insert", methods=['GET', 'POST'])
def insert():

	if not session or session['user_type'] == "user":
		return redirect(url_for('home'))

	if session['user_type'] == "manager":
		if request.method =='POST':
			title = "'" + request.form.get("title") + "'"
			duration = "'" + request.form.get("duration") + "'"
			rDate = "'" + request.form.get("r_date") + "'"
			language = "'" + request.form.get("language") + "'"
			genre = request.form.get("genre")
			tags = request.form.get("tags")
			director = request.form.get("director")
			producer = request.form.get("producer")
			screen_write = request.form.get("screen")
			actor = request.form.get("actor")
			editor = request.form.get("editor")
			summary = "'" + request.form.get("summary") + "'"

			cur.execute("INSERT INTO `movies` (title, release_date, duration, language, summary) VALUES (%s, %s, %s, %s, %s)" %(title, rDate, duration, language, summary))
			db.commit()

			cur.execute("SELECT DISTINCT movie_id FROM movies WHERE title LIKE %s" %(title))
			m_id = cur.fetchall()

			genre_temp = genre.split(", ")
			for i in range(0, len(genre_temp)):
				new_genre = "'" + genre_temp[i] + "'"
				cur.execute("INSERT INTO `genre` (movie_id, genre) VALUES (%s, %s)" %(m_id[0][0], new_genre))
				db.commit()

			tags_temp = tags.split(", ")
			for i in range(0, len(tags_temp)):
				new_tag = "'" + tags_temp[i] + "'"
				cur.execute("INSERT INTO `tags` (movie_id, tag) VALUES (%s, %s)" %(m_id[0][0], new_tag))
				db.commit()

			dire_temp = director.split(", ")
			for i in range(0, len(dire_temp)):
				new_dire = "'" + dire_temp[i] + "'"
				cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s,%s,%s)" %(m_id[0][0], 1, new_dire))		
				db.commit()

			prod_temp = producer.split(", ")
			for i in range(0, len(prod_temp)):
				new_prod = "'" + prod_temp[i] + "'"
				cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id[0][0], 2, new_prod))
				db.commit()

			screen_temp = screen_write.split(", ")
			for i in range(0, len(screen_temp)):
				new_screen = "'" + screen_temp[i] + "'"
				cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id[0][0], 3, new_screen))
				db.commit()

			act_temp = actor.split(", ")
			for i in range(0, len(act_temp)):
				new_act = "'" + act_temp[i] + "'"
				cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id[0][0], 4, new_act))
				db.commit()

			edit_temp = editor.split(", ")
			for i in range(0, len(edit_temp)):
				new_edit = "'" + edit_temp[i] + "'"
				cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id[0][0], 5, new_edit))
				db.commit()

			return redirect(url_for("home"))

	return render_template('insert.html')

@app.route("/movieDisplay", methods=['GET', 'POST'])
def movie_display():
	
	if data_transfer[0] == "Title":

		movies = []

		movies.append([[data_transfer[1]]])

		cur.execute("SELECT language FROM movies WHERE title=%s" %(TITLE))		
		movies.append(cur.fetchall())

		cur.execute("SELECT duration FROM movies WHERE title=%s" %(TITLE))
		movies.append(cur.fetchall())

		cur.execute("SELECT release_date FROM movies WHERE title=%s" %(TITLE))
		movies.append(cur.fetchall())

		cur.execute("SELECT summary FROM movies WHERE title=%s" %(TITLE))
		movies.append(cur.fetchall())

		cur.execute("SELECT movie_id FROM movies WHERE title=%s" %(TITLE))
		movie_id = cur.fetchall()

		cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 4))
		movies.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 1))
		movies.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 2))
		movies.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 3))
		movies.append(cur.fetchall())

		cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 5))
		movies.append(cur.fetchall())

		cur.execute("SELECT genre FROM genre WHERE movie_id=%s" %(movie_id[0][0]))
		movies.append(cur.fetchall())

		cur.execute("SELECT tag FROM tags WHERE movie_id=%s" %(movie_id[0][0]))
		movies.append(cur.fetchall())

		all_movies = []

		for i in movies:
			temp = []
			if len(i) > 1:
				for j in i:
					for k in j:
						temp.append(k)
				temp = [' | '.join(temp)]
				all_movies.append(temp)
			else:
				for j in i:
					for k in j:
						temp.append(k)
				all_movies.append(temp)

		session['movies'] = all_movies

	return render_template("movieDisplay.html")

@app.route("/modify_movies", methods=['GET', 'POST'])
def modify_movies():

	if not session or session['user_type'] == "user":
		return redirect(url_for('home'))

	if session['user_type'] == "manager":

		if data_transfer[0] == "Title":
			movies = []

			movies.append([[data_transfer[1]]])
			TITLE = "'" + data_transfer[1] + "'"

			cur.execute("SELECT language FROM movies WHERE title=%s" %(TITLE))		
			movies.append(cur.fetchall())

			cur.execute("SELECT duration FROM movies WHERE title=%s" %(TITLE))
			movies.append(cur.fetchall())

			cur.execute("SELECT release_date FROM movies WHERE title=%s" %(TITLE))
			movies.append(cur.fetchall())

			cur.execute("SELECT summary FROM movies WHERE title=%s" %(TITLE))
			movies.append(cur.fetchall())

			cur.execute("SELECT movie_id FROM movies WHERE title=%s" %(TITLE))
			movie_id = cur.fetchall()

			cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 4))
			movies.append(cur.fetchall())

			cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 1))
			movies.append(cur.fetchall())

			cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 2))
			movies.append(cur.fetchall())

			cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 3))
			movies.append(cur.fetchall())

			cur.execute("SELECT name FROM crew WHERE movie_id=%s AND position=%d" %(movie_id[0][0], 5))
			movies.append(cur.fetchall())

			cur.execute("SELECT genre FROM genre WHERE movie_id=%s" %(movie_id[0][0]))
			movies.append(cur.fetchall())

			cur.execute("SELECT tag FROM tags WHERE movie_id=%s" %(movie_id[0][0]))
			movies.append(cur.fetchall())

			all_movies = []

			for i in movies:
				temp = []
				if len(i) > 1:
					for j in i:
						for k in j:
							temp.append(k)
					temp = [' | '.join(temp)]
					all_movies.append(temp)
				else:
					for j in i:
						for k in j:
							temp.append(k)
					all_movies.append(temp)

			session['movies'] = all_movies
			
			m_id = movie_id[0][0]

		if request.method == 'POST':
			
			mod_val = request.form['btn']
			if str(mod_val) == "Delete":

				cur.execute("DELETE FROM watchlist WHERE movie_id=%s" %(m_id))
				db.commit()

				cur.execute("DELETE FROM user_rating WHERE movie_id=%s" %(m_id))
				db.commit()

				cur.execute("DELETE FROM crew WHERE movie_id=%s" %(m_id))
				db.commit()

				cur.execute("DELETE FROM genre WHERE movie_id=%s" %(m_id))
				db.commit()

				cur.execute("DELETE FROM tags WHERE movie_id=%s" %(m_id))
				db.commit()

				cur.execute("DELETE FROM movies WHERE movie_id=%s" %(m_id))
				db.commit()

				return redirect(url_for('home'))

			else:
				title = "'" + request.form.get("title") + "'"
				duration = "'" + request.form.get("duration") + "'"
				rDate = "'" + request.form.get("r_date") + "'"
				language = "'" + request.form.get("language") + "'"
				genre = request.form.get("genre")
				tags = request.form.get("tags")
				director = request.form.get("director")
				producer = request.form.get("producer")
				screen_write = request.form.get("screen")
				actor = request.form.get("actor")
				editor = request.form.get("editor")
				summary = "'" + request.form.get("summary") + "'"

				cur.execute("UPDATE movies SET title = %s, release_date = %s, duration = %s, language = %s, summary = %s WHERE movie_id = %s" %(title, rDate, duration, language, summary, m_id))
				db.commit()

				cur.execute("DELETE FROM genre WHERE movie_id=%s" %(m_id))
				db.commit()
				genre_temp = genre.split(" | ")
				for i in range(0, len(genre_temp)):
					new_genre = "'" + genre_temp[i] + "'"
					cur.execute("INSERT INTO `genre` (movie_id, genre) VALUES (%s, %s)" %(m_id, new_genre))
					db.commit()

				cur.execute("DELETE FROM tags WHERE movie_id=%s" %(m_id))
				db.commit()
				tags_temp = tags.split(" | ")
				for i in range(0, len(tags_temp)):
					new_tag = "'" + tags_temp[i] + "'"
					cur.execute("INSERT INTO `tags` (movie_id, tag) VALUES (%s, %s)" %(m_id, new_tag))
					db.commit()

				cur.execute("DELETE FROM crew WHERE movie_id=%s" %(m_id))
				db.commit()

				dire_temp = director.split(" | ")
				for i in range(0, len(dire_temp)):
					new_dire = "'" + dire_temp[i] + "'"
					cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s,%s,%s)" %(m_id, 1, new_dire))		
					db.commit()

				prod_temp = producer.split(" | ")
				for i in range(0, len(prod_temp)):
					new_prod = "'" + prod_temp[i] + "'"
					cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id, 2, new_prod))
					db.commit()

				screen_temp = screen_write.split(" | ")
				for i in range(0, len(screen_temp)):
					new_screen = "'" + screen_temp[i] + "'"
					cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id, 3, new_screen))
					db.commit()

				act_temp = actor.split(" | ")
				for i in range(0, len(act_temp)):
					new_act = "'" + act_temp[i] + "'"
					cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id, 4, new_act))
					db.commit()

				edit_temp = editor.split(" | ")
				for i in range(0, len(edit_temp)):
					new_edit = "'" + edit_temp[i] + "'"
					cur.execute("INSERT INTO `crew` (movie_id, position, name) VALUES (%s, %s, %s)" %(m_id, 5, new_edit))
					db.commit()
				return redirect(url_for('home'))

	return render_template('modify_movies.html')

@app.route("/modify_users", methods=['GET', 'POST'])
def modify_users():

	if not session or session['user_type'] == "user":
		return redirect(url_for('home'))

	if session['user_type'] == "manager":

		cur.execute("SELECT uname, name, user_type, user_id FROM users")
		users = cur.fetchall()
		
		new_users = []

		for i in users:
			temp = []
			for j in i:
				temp.append(j)
			new_users.append(temp)

		session['users'] = new_users

		if request.method == 'POST':

			user_id = request.form.get("user_id")

			mod_val = request.form['btn']
			if str(mod_val) == "Delete":

				cur.execute("DELETE FROM user_rating WHERE user_id=%s" %(user_id))
				db.commit()

				cur.execute("DELETE FROM watchlist WHERE user_id=%s" %(user_id))
				db.commit()

				cur.execute("DELETE FROM users WHERE user_id=%s" %(user_id))
				db.commit()

				return redirect(url_for('modify_users'))

			else:

				cur.execute("UPDATE users SET user_type=%s WHERE user_id=%s" %(1, user_id))
				db.commit()

				return redirect(url_for("modify_users"))

	return render_template("modify_users.html")

if __name__ == "__main__":
    app.run()
