from flask import Flask
from flask import*
import uuid
from database import *
from flask import jsonify
import re  
from blk import *


public=Blueprint('public',__name__)

@public.route('/')
def home():
    return render_template("home.html")

@public.route('/login', methods=['get', 'post'])
def login():
    if 'sub' in request.form:
        username = request.form['uname'].strip()
        password = request.form['pass'].strip()

        # Check credentials in the database
        s = "SELECT * FROM login WHERE username='%s' AND password='%s'" % (username, password)
        res = select(s)

        if res:
            session['lid'] = res[0]['login_id']
            if res[0]['usertype'] == 'admin':
                flash("Login Successful!", "success")
                return redirect(url_for('admin.admin_home'))

            elif res[0]['usertype'] == 'user':
                s1 = "SELECT * FROM user WHERE login_id='%s'" % session['lid']
                res1 = select(s1)
                if res1:
                    session['uid'] = res1[0]['user_id']
                    session['uss'] = res1[0]['fname']+" "+res1[0]['lname']
                    flash("Login Successful!", "success")
                    return redirect(url_for('user.user_home'))

            elif res[0]['usertype'] == 'officer':
                y = "SELECT * FROM officer WHERE login_id='%s'" % session['lid']
                z = select(y)
                if z:
                    session['oid'] = z[0]['officer_id']
                    flash("Login Successful!", "success")
                    return redirect(url_for('officer.officer_home'))
        else:
            # If no matching record is found
            flash("Invalid username or password!", "error")

    return render_template('login.html')

@public.route('/user_register', methods=['GET', 'POST'])
def user_register():
    data = {}

    if 'sub' in request.form:
        Fname = request.form['fname'].strip()
        Lname = request.form['lname'].strip()
        Phone = request.form['phone'].strip()
        Email = request.form['email'].strip()
        image = request.files['photo']
        Address = request.form['address'].strip()
        Gender = request.form['gen']
        username = request.form['uname'].strip()
        password = request.form['pass'].strip()

        # Server-side validation
        if not Fname.isalpha():
            flash("First name must contain only alphabets.")
        elif not Lname.isalpha():
            flash("Last name must contain only alphabets.")
        elif not Phone.isdigit() or len(Phone) != 10:
            flash("Phone number must be 10 digits.")
        elif not re.match(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$", Email):
            flash("Invalid email address.")
        elif len(password) < 6:
            flash("Password must be at least 6 characters long.")
        else:
            # Check if username or email already exists
            username_query = "SELECT * FROM login WHERE username = '%s'" % username
            email_query = "SELECT * FROM user WHERE email = '%s'" % Email

            existing_username = select(username_query)
            existing_email = select(email_query)

            if existing_username:
                flash("Username already exists. Please choose a different username.")
            elif existing_email:
                flash("Email already exists. Please use a different email.")
            else:
                # Save image
                path = "static/images/" + str(uuid.uuid4()) + image.filename
                image.save(path)

                # Insert into login and user tables
                i = "INSERT INTO login VALUES (null, '%s', '%s', 'user')" % (username, password)
                lid = insert(i)
                i1 = ("INSERT INTO user VALUES (null, '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s','')" %
                      (lid, Fname, Lname, Phone, Email, path, Address, Gender))
                uid=insert(i1)
                
                
                with open(compiled_contract_path) as file:
                    contract_json = json.load(file)  # Load contract info as JSON
                    contract_abi = contract_json['abi']  # Fetch contract's ABI - necessary to call its functions
                contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
                id = web3.eth.get_block_number()
                message = contract.functions.add_users(
                                        int(id),
                                        int(lid),
                                        Fname,
                                        Lname,
                                        Phone,
                                        Email,
                                        path,
                                        Address,
                                        Gender
                                    ).transact({"from":web3.eth.accounts[0]}) 
                q="update user set tid='%s' where user_id='%s'" %(id,uid)
                update(q)
                flash("User registered successfully!")
                return redirect(url_for('public.login'))

    return render_template('user_register.html')




        
        
