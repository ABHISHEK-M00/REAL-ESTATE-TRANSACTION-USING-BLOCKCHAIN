from flask import Flask
from flask import*
import uuid
from database import*
from blk import *
from datetime import date,datetime
import  datetime
import ipfshttpclient
import ipfshttpclient
from flask import Flask, abort, request, send_file,render_template
from flask_script import Manager
from flask_cors import CORS
import os
import requests



user=Blueprint('user',__name__)

@user.route('/user_home')
def user_home():
    data={}
    
    return render_template("user_home.html",ss=session['uss'])

@user.route('/user_addplot', methods=['GET', 'POST'])
def user_addplot():
    data = {}
    # aid=request.args['aid']
    # Query to fetch plots related to the user  INNER JOIN district USING(district_id) 
            # INNER JOIN panchayath ON district.district_id = panchayath.panchayath_id 
    s1 = """select * from aadharam INNER JOIN panchayath using(panchayath_id) 
    INNER JOIN district on panchayath.district_id=district.district_id where aadharam_id in (
            SELECT aadharam_id FROM plot 
            WHERE user_id='%s' )""" % (session['uid'])
    data['s2'] = select(s1)

    if request.method == 'GET':
        # Fetch districts for the initial dropdown
        x = "SELECT * FROM district"
        data['did'] = select(x)
        return render_template("user_addplot.html", data=data)

    elif request.method == 'POST':
        # Handle AJAX request for Panchayath
        if 'district_id' in request.form:
            did = request.form['district_id']
            p = "SELECT * FROM panchayath WHERE district_id = %s" % did
            panchayaths = select(p)  # Fetch Panchayaths from the database
            return jsonify(panchayaths)  # Respond with JSON data for Panchayath dropdown
        # Handle form submission to add a plot
        if 'sub' in request.form:
            did = request.form['dis']
            pid = request.form['pan']
            cent = request.form['sqft']
            det = request.form['det']
            loc = request.form['location']
            
            # Convert cent to acre
            acres = float(cent) / 100

            image=request.files['aad']
            path="static/images/"+str(uuid.uuid4())+image.filename
            image.save(path)

            image1=request.files['f1']
            path1="static/images/"+str(uuid.uuid4())+image1.filename
            image1.save(path1)


            image2=request.files['f2']
            path2="static/images/"+str(uuid.uuid4())+image2.filename
            image2.save(path2)


            d = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            client = ipfshttpclient.connect('/ip4/127.0.0.1/tcp/5001/http')
            # res = client.add("C:\\Real_Estate_TOCH\\static\\a.jpg")
            res = client.add("C:\\Users\\Akash\\Downloads\\Real Estate\\Real_Estate_TOCH\\static\\a.jpg")
            url = 'http://localhost:5054/user/down/' + res['Hash']
            print(url)
            # i = """INSERT INTO aadharam 
            #         VALUES (NULL, '%s', '%s','%s')""" % (   res['Hash'],'',title)
            i = """INSERT INTO aadharam 
                    VALUES (NULL  ,'%s', '%s', '%s', '%s', '%s','%s','%s', '%s', 'pending')""" % ( did, pid, cent, det,res['Hash'],path1,path2,loc)
            ids=insert(i) 
            with open(compiled_contract_path) as file:
                contract_json = json.load(file)  # Load contract info as JSON
                contract_abi = contract_json['abi']  # Fetch contract's ABI - necessary to call its functions
                contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
                id = web3.eth.get_block_number()
                message = contract.functions.add_aadharam(
                                        int(id),
                                        int(did),
                                        int(pid),
                                        cent,
                                        det,
                                        loc,
                                        res['Hash'],
                                        
                                        'pending'
                                    ).transact({"from":web3.eth.accounts[0]}) 
            uid = session['uid']
            i = """INSERT INTO plot 
                    VALUES (NULL,'%s', '%s', '%s', 'pending')""" % (ids,uid, cent)
            insert(i)
            
            d = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            
            with open(compiled_contract_path) as file:
                contract_json = json.load(file)  # Load contract info as JSON
                contract_abi = contract_json['abi']  # Fetch contract's ABI - necessary to call its functions
            contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
            
            id = web3.eth.get_block_number()
            message = contract.functions.add_plot(
                int(id),
                int(ids),
                int(uid),
                cent,
                'pending',
            ).transact({"from":web3.eth.accounts[0]})
            
            
            flash(f"Plot added successfully! ({cent} cents = {acres:.2f} acres)", "success")
            return redirect('/user_addplot')
            
    return render_template("user_addplot.html", data=data)

# @user.route('/user_addplot', methods=['GET', 'POST'])
# def user_addplot():
#     data = {}
    
#     s1="select * from plot inner join district using(district_id) inner join panchayath on district.district_id=panchayath.panchayath_id where user_id='%s'"%(session['uid'])
#     data['s2']=select(s1)

#     if request.method == 'GET':
#         # Fetch districts for the initial dropdown
#         x = "SELECT * FROM district"
#         data['did'] = select(x)  # Fetch districts from the database
#         return render_template("user_addplot.html", data=data)

#     elif request.method == 'POST':
#         # Handle AJAX request for Panchayath
#         if 'district_id' in request.form:
#             did = request.form['district_id']
#             p = "SELECT * FROM panchayath WHERE district_id = %s" % did
#             panchayaths = select(p)  # Fetch Panchayaths from the database
#             return jsonify(panchayaths)  # Respond with JSON data for Panchayath dropdown

#         # Handle form submission to add a plot
#         if 'sub' in request.form:
#             did = request.form['dis']
#             pid = request.form['pan']
#             cent = request.form['cent']
#             det = request.form['det']
#             loc = request.form['location']
            
#             if 'uid' in session:
#                 uid = session['uid']
#                 i = """INSERT INTO plot 
#                        VALUES (NULL, '%s', '%s', '%s', '%s', '%s', 'pending', '%s')""" % (uid, did, pid, cent, det, loc)
#                 insert(i)  # Execute the insert query
                
#                 # Notify success and reload the form
#                 flash("Plot added successfully!", "success")
#                 return redirect('/user_addplot')
#             else:
#                 flash("User session expired. Please log in again.", "error")
#                 return redirect('/login')
            
   
#     # Default fallback in case of unexpected behavior
#     return render_template("user_addplot.html", data=data)

@user.route('/user_uploadaadharam',methods=['get','post'])
def user_uploadaadharam():
    data={}
    aid = request.args['aid']
    s="select * from aadharam where aadharam_id='%s'" %(aid)
    data['s1']=select(s)

    if 'sub' in request.form:
        title = request.form['title']
        image=request.files['aad']
        path="static/images/"+str(uuid.uuid4())+image.filename
        image.save(r"D:\Project 2024\Btech\Toch\Real_Estate_TOCH\static\a.jpg")

        # i = """INSERT INTO aadharam 
        #         VALUES (NULL, '%s', '%s')""" % ( pid, path)
                
        # insert(i) 
       
        d = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        client = ipfshttpclient.connect('/ip4/127.0.0.1/tcp/5001/http')
        res = client.add("D:\\Project 2024\\Btech\\Toch\\Real_Estate_TOCH\\static\\a.jpg")
        url = 'http://localhost:5054/user/down/' + res['Hash']
        print(url)
        i = """INSERT INTO aadharam 
                VALUES (NULL, '%s', '%s','%s')""" % (   res['Hash'],'',title)
                
        insert(i) 
        with open(compiled_contract_path) as file:
            contract_json = json.load(file)  # Load contract info as JSON
            contract_abi = contract_json['abi']  # Fetch contract's ABI - necessary to call its functions
            contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
            id = web3.eth.get_block_number()
            message = contract.functions.add_aadharam(
                                    int(id),
                                    title,
                                    path
                                
                                    
                                ).transact({"from":web3.eth.accounts[0]}) 
        
		
        flash("Aadharam uploaded successfully!", "success")
        return redirect(url_for('user.user_uploadaadharam'))
    
    
                    
    return render_template("user_uploadaadharam.html", data=data)  

@user.route('/user_view_Owners',methods=['get','post'])
def user_view_Owners():
    data={}
    aid=request.args['aid']
    # s="select * from user where user_id in (select user_id from plot where aadharam_id='%s')"%(aid)
    s="select * from user inner join plot using (user_id)  where aadharam_id='%s'"%(aid)
    data['e']=select(s)
    
   
    return render_template("user_view_Owners.html",data=data)


@user.route('/user_sellplot', methods=['GET', 'POST'])
def user_sellplot():
    data = {}
    aid = request.args.get('aid')
    
    # Fetch plot details
    s = "SELECT * FROM aadharam WHERE aadharam_id='%s'" % (aid)
    data['e'] = select(s)
    print(data['e'])
    
    # Conversion from cent to acre
    if data['e']:
        cent = float(data['e'][0]['cent'])  # Fetch cent value
        data['converted_acre'] = cent / 100  # Correct conversion formula
    else:
        data['converted_acre'] = 0

    if request.method == 'POST' and 'sub' in request.form:
        cent = request.form['sqft']  # Cent value from the form
        amount = request.form['amt']  # Amount input from the form
        acre = float(cent) / 100  # Calculate acre value
        
        # Insert record into the database
        i = "INSERT INTO sell (aadharam_id, cent, acre, amount, date) VALUES ('%s', '%s', '%s', '%s', CURDATE())" % (aid, cent, acre, amount)
        insert(i)
        
        flash("Plot successfully listed for sale!", "success")
        return redirect(url_for('user.user_addplot'))

    # Fetch previous sales for the plot
    z = "SELECT * FROM sell WHERE aadharam_id='%s'" % (aid)
    data['y'] = select(z)
    
    return render_template("user_sellplot.html", data=data)




# @user.route('/user_sellplot',methods=['get','post'])
# def user_sellplot():
#     data={}
#     pid = request.args['pid']
#     s="select * from plot where plot_id='%s'"%(pid)
#     data['e']=select(s)
    
#     if 'sub' in request.form:
#         pid = request.args['pid']
#         cent = request.args['cent']
#         amount = request.form['amt']
#         i="insert into sell values(null,'%s','%s','%s',curdate())"%(pid,cent,amount)
#         insert(i)
#         flash("Sell successfully!", "success")
#         return redirect(url_for('user.user_addplot'))

                
#     z="select * from sell where plot_id='%s'"%(pid)
#     data['y']=select(z)
   
#     return render_template("user_sellplot.html",data=data)

@user.route('/user_viewmyplottosell',methods=['get','post'])
def user_viewmyplottosell():
    data={}
    s="SELECT * FROM district INNER JOIN panchayath USING (district_id) INNER JOIN aadharam ON panchayath.panchayath_id = aadharam.panchayath_id INNER JOIN sell ON aadharam.aadharam_id = sell.aadharam_id where aadharam.aadharam_id in (select aadharam_id from plot where user_id='%s')"%(session['uid'])
    data['e']=select(s)
    
   
    return render_template("user_viewmyplottosell.html",data=data)

@user.route('/user_viewotherplots',methods=['get','post'])
def user_viewotherplots():
    data={}
    s="SELECT * FROM district INNER JOIN panchayath USING (district_id) INNER JOIN aadharam ON panchayath.panchayath_id = aadharam.panchayath_id inner join plot on aadharam.aadharam_id = plot.aadharam_id INNER JOIN sell ON aadharam.aadharam_id = sell.aadharam_id where aadharam.aadharam_id in (select aadharam_id from plot where user_id !='%s')and plot.statuss='Accepted'"%(session['uid'])
    data['e']=select(s)
    
    return render_template("user_viewotherplots.html",data=data)



@user.route('/user_viewrequest', methods=['GET', 'POST'])
def user_viewrequest():
    data = {}
    sid = request.args.get('sid')  # get the sell_id from the URL
    # Query to get the request and sell details
    s = """SELECT *,
    CONCAT(req_user.fname, ' ', req_user.lname) AS fullname, 
    sell.amount AS sell_amt, 
    request.amount AS request_amt,
    request.status AS status,request.cent as r_cent,
    request.updated_once AS updated_once  -- Track if amount has been updated once
    FROM 
        user AS req_user
    INNER JOIN 
        request ON req_user.user_id = request.user_id
    INNER JOIN 
        sell ON request.sell_id = sell.sell_id
    WHERE 
        request.sell_id = '%s';""" % (sid)
    data['e'] = select(s)

    if request.method == 'POST':
        action = request.form.get('action')  # Get the action from the form
        if action:
            # Split the action to get type and sell_id
            action_parts = action.split('-')
            action_type = action_parts[0]
            sell_id = action_parts[1] if len(action_parts) > 1 else None

            if action_type == 'update' and sell_id:
                # Check if the amount has been updated before
                u = "SELECT updated_once FROM request WHERE sell_id = '%s'" % (sell_id)
                result = select(u)
                if result and result[0]['updated_once']:
                    flash("You can only update the amount once.")
                else:
                    # Allow updating the amount
                    amount = request.form.get('amt')
                    if amount:
                        u = "UPDATE sell SET amount = '%s' WHERE sell_id = '%s'" % (amount, sell_id)
                        update(u)
                        # Set the updated_once flag to true
                        u = "UPDATE request SET updated_once = 1 WHERE sell_id = '%s'" % (sell_id)
                        update(u)
                        flash("Amount updated successfully!")
                return redirect(url_for('user.user_viewrequest'))

            elif action_type == 'accept' and sell_id:
                u = "UPDATE request SET status = 'Accepted' WHERE sell_id = '%s'" % (sell_id)
                update(u)
                flash("Request accepted successfully!")

            elif action_type == 'reject' and sell_id:
                u = "UPDATE request SET status = 'Rejected' WHERE sell_id = '%s'" % (sell_id)
                update(u)
                flash("Request rejected successfully!")

            return redirect(url_for('user.user_viewrequest'))

    return render_template("user_viewrequest.html", data=data)




@user.route('/usersend_complaints',methods=['post','get'])
def usersend_complaints():
    data={}
    if 'sub' in request.form:
        complaints=request.form['com']
        i="insert into complaint values(null,'%s','%s','pending',now())"%(session['uid'],complaints)
        r=insert(i);
        
    z="select * from complaint where user_id='%s'"%(session['uid'])
    data['x']=select(z)

        
    return render_template('user_sendcomplaint.html',data=data)

@user.route('/user_chatwithofficer',methods=['get','post'])
def user_chatwithofficer():
    data={}
    reciver_id=request.args['rid']

    if 'submit' in request.form:
        message=request.form['msg']
        i="insert into chat values(null,'%s','%s','%s',now())"%(session['lid'],reciver_id,message)
        insert(i)
        
    s1="select * from chat where sender_id='%s' and receiver_id='%s' or sender_id='%s' and receiver_id='%s'"%(reciver_id,session['lid'],session['lid'],reciver_id)
    data['msg']=select(s1)
    return render_template('user_chatwithofficer.html',data=data)


@user.route('/user_sendrequestforplot',methods=['get','post'])
def user_sendrequestforplot():
    data={}

    plot_id=request.args['plid']

    kl="select * from  plot where plot_id='%s'"%(plot_id)
    data['pl']=select(kl)

    
    if 'sub' in request.form:
        sid = request.args['sid']
        cent = request.form['cent']
        amount = request.form['amt']
        i="insert into request values(null,'%s','%s','%s','%s',curdate(),'pending','0')"%(sid,session['uid'],cent,amount)
        insert(i)
        flash("Requested successfully!", "success")
        return redirect(url_for('user.user_viewotherplots'))
   
    return render_template("user_sendrequestforplot.html",data=data)





@user.route('/user_makepayment', methods=['POST', 'GET'])
def user_make_payment():
    data={}
   
    if 'btn' in request.form:
        rid=request.args['rid']
        amount=request.args['amt']
        query="INSERT INTO payment VALUES(NULL,'%s','%s',curdate())"%(rid,amount)
        insert(query)  
        query="update request set status='paid' where request_id='%s'"%(rid)
        update(query)  
        qq="select * from request inner join sell using(sell_id) where request_id='%s'" %(rid)
        ress=select(qq)
        if ress:
            val=ress[0]['cent']
            q="select * from sell inner join aadharam using (aadharam_id) where aadharam_id='%s'" %(ress[0]['aadharam_id'])
            rr=select(q)
            vals=rr[0]['cent']
            ss=int(vals)-int(val)
            uid = session['uid']
            i = """INSERT INTO plot 
                    VALUES (NULL,'%s', '%s', '%s', 'pending')""" % (ress[0]['aadharam_id'],uid, val)
            insert(i)
            
            q="update plot set acent='%s' where aadharam_id='%s' and user_id='%s'" %(ss,ress[0]['aadharam_id'],uid)
            update(q)
            d = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            
            with open(compiled_contract_path) as file:
                contract_json = json.load(file)  # Load contract info as JSON
                contract_abi = contract_json['abi']  # Fetch contract's ABI - necessary to call its functions
            contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
            
            id = web3.eth.get_block_number()
            message = contract.functions.add_plot(
                int(id),
                int(ress[0]['aadharam_id']),
                int(uid),
                str(ss),
                'pending',
            ).transact({"from":web3.eth.accounts[0]})
            
            
        
        return redirect(url_for('user.user_home'))
    
    return render_template('user_makepayment.html',data=data)

@user.route('/user_viewrequeststatus', methods=['GET', 'POST'])
def user_viewrequeststatus():
    data = {}
    sid=request.args['sid']
    s = "SELECT *, sell.amount AS sell_amt, request.amount AS request_amt,request.cent as r_cent FROM request INNER JOIN sell USING (sell_id) WHERE request.user_id = '%s' and sell_id='%s'" % (session['uid'],sid)
    data['e'] = select(s)
    
    if 'action' in request.args:
        action=request.args['action']
        rid=request.args['rid']
    else:
        action=None
        
    if action=='send':
        i="insert into request_officers values(null,'%s',curdate(),'pending')"%(rid)
        insert(i)
        flash("Requested successfully!", "success")
    

    return render_template("user_viewrequeststatus.html", data=data)

@user.route('/user_viewpayment', methods=['GET', 'POST'])
def user_viewpayment():
    data = {}
    rid = request.args['rid']
    s = "SELECT *,CONCAT(user.fname, ' ', user.lname) AS fullname, sell.amount AS sell_amt, request.amount AS request_amt FROM user inner join request using(user_id) INNER JOIN sell USING (sell_id) inner join payment using(request_id) WHERE request_id = '%s'" % (rid)
    data['e'] = select(s)

    return render_template("user_viewpayment.html", data=data)

@user.route('/user_viewofficerrequeststatus',methods=['get','post'])
def user_viewofficerrequeststatus():
    data={}
    rid=request.args['rid']
    s="SELECT * FROM request INNER JOIN sell USING(sell_id) INNER JOIN request_officers USING(request_id) inner join officer on request_officers.request_officers_id=officer.officer_id where request_id='%s'"%(rid)
    data['e']=select(s)
    
    return render_template("user_viewofficerrequeststatus.html",data=data)


 


import os
import requests
def download(url):
    h = {"Accept-Encoding": "identity"}
    r = requests.get(url, stream=True, verify=False, headers=h)
    try:
        r.raise_for_status()
    except requests.exceptions.HTTPError as e:
        #log.exception("IPFS Server Error! url:{0}, exception:{1}".format(url, str(e)))
        return "IPFS Server Error! \n", 503

    if "content-type" in r.headers:
        return send_file(r.raw, r.headers["content-type"])
    else:
        return send_file(r.raw)
@user.route("/down/<path:path>")
def down(path):
    print(path,'/////////////////////////')
    try:
        p = os.path.splitext(path)
        hash = str(p[0])
        print(hash)

        if not hash or not hash.startswith('Qm'):
            return "<Invalid Path>", 404
        url = url = 'http://localhost:8080/ipfs/' +hash
        print(url)
        return download(url)
    except Exception as e:
        return "Download Error!"+str(e), 503
    
    
    
    



@user.route('/user_view_bk',methods=['post','get'])
def user_view_bk():
    data={}
    
    
    
    b="select * from user"
    data['s1']=select(b)
    return render_template('user_view_bk.html',data=data)  




