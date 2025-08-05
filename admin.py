from flask import Flask
from flask import*
from database import *

admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():
    return render_template("admin_home.html")

@admin.route('/admin_managedistrict',methods=['get','post'])
def admin_managedistrict():
    data={}
    if 'sub' in request.form:
        district=request.form['dis']
        i="insert into district values(null,'%s')"%(district)
        insert(i)
        flash("Inserted sucessfully!")
        
    s="select * from district"
    data['s1']=select(s)
    if 'action' in request.args:
        action=request.args['action']
        did=request.args['did']
    else:
        action=None
        
    if action=='update':
        s2="select * from district where district_id='%s'"%(did)
        data['s3']=select(s2)
    
    if 'ups' in request.form:
        district=request.form['dis']
        u="update district set district_name='%s' where district_id='%s'"%(district,did)
        update(u)
        flash("Updated Successfully!")
        return redirect(url_for('admin.admin_managedistrict'))
    
    if action=='delete':
        d="delete from district where district_id='%s'"%(did) 
        delete(d)
        flash("Deleted Successfully!")
        return redirect(url_for('admin.admin_managedistrict'))
    
    return render_template("admin_managedistrict.html",data=data)

@admin.route('/admin_managepanchayath',methods=['get','post'])
def admin_managepanchayath():
    data={}
    did=request.args['did']
    data['did']=did
    se="select * from district where district_id='%s'"%(did)
    data['e']=select(se)
    if 'sub' in request.form:
        did=request.form['did']        
        panchayath=request.form['pan']
        phone=request.form['phn']
        email=request.form['eml']
        i="insert into panchayath values(null,'%s','%s','%s','%s')"%(did,panchayath,phone,email)
        insert(i)
        flash("Inserted sucessfully!")
    
    district_id=request.args['did']
    s="select * from panchayath inner join district using(district_id) where district_id='%s'"%(district_id)
    data['s1']=select(s)
    
    if 'action' in request.args:
        action=request.args['action']
        pid=request.args['pid']
    else:
        action=None
        
    if action=='update':
        s2="select * from panchayath where panchayath_id='%s'"%(pid)
        data['s3']=select(s2)
    
    if 'ups' in request.form:
        panchayath=request.form['pan']
        phone=request.form['phn']
        email=request.form['eml']
        u="update panchayath set name='%s',phone='%s',email='%s' where panchayath_id='%s'"%(panchayath,phone,email,pid)
        update(u)
        flash("Updated Successfully!")
        return redirect(url_for('admin.admin_managepanchayath',did=did))
    
    if action=='delete':
        d="delete from panchayath where panchayath_id='%s'"%(pid) 
        delete(d)
        flash("Deleted Successfully!")
        return redirect(url_for('admin.admin_managepanchayath',did=did))
    
    return render_template("admin_managepanchayath.html",data=data)

@admin.route('/admin_manageofficer',methods=['get','post'])
def admin_manageofficer():
    data={}
    pid=request.args['pid']
    data['pid']=pid
    se="select * from panchayath where panchayath_id='%s'"%(pid)
    data['e']=select(se)
    if 'sub' in request.form:
        pid=request.form['pid'] 
        uname=request.form['uname']
        password=request.form['pass']       
        name=request.form['nam']
        phone=request.form['phn']
        email=request.form['eml']
        position=request.form['pos']
        i1="insert into login values(null,'%s','%s','officer')"%(uname,password)
        lid=insert(i1)
        i="insert into officer values(null,'%s','%s','%s','%s','%s','%s')"%(lid,pid,name,phone,email,position)
        insert(i)
        flash("Inserted sucessfully!")
    
    pid=request.args['pid']
    s="select *,panchayath.name as pname from panchayath inner join officer using(panchayath_id) inner join login using(login_id) where panchayath_id='%s'"%(pid)
    data['s1']=select(s)
    
    if 'action' in request.args:
        action=request.args['action']
        oid=request.args['oid']
    else:
        action=None
        
    if action=='update':
        s2="select * from officer inner join login using(login_id) where officer_id='%s'"%(oid)
        data['s3']=select(s2)
    
    if 'ups' in request.form:
        name=request.form['nam']
        phone=request.form['phn']
        email=request.form['eml']
        position=request.form['pos']
        u="update officer set name='%s',phone='%s',email='%s',position='%s' where officer_id='%s'"%(name,phone,email,position,oid)
        update(u)
        flash("Updated Successfully!")
        return redirect(url_for('admin.admin_manageofficer',pid=pid))
    
    if action=='delete':
        d="delete from officer where officer_id='%s'"%(oid) 
        delete(d)
        flash("Deleted Successfully!")
        return redirect(url_for('admin.admin_manageofficer',pid=pid))
    
    return render_template("admin_manageofficer.html",data=data)

@admin.route('/admin_viewuser')
def admin_viewuser():
    data={}
    s="select *,concat(fname,' ',lname) as fullname from user"
    data['s1']=select(s)
    
    return render_template("admin_viewuser.html",data=data)

# @admin.route('/admin_viewcomplaints',methods=['post','get'])
# def admin_viewcomplaints():
#     data={}
#     z="select *,concat(fname,' ',lname) as fullname from user inner join complaint using(user_id)"
#     data['x']=select(z)
    
#     if 'sub' in request.form:
#         reply=request.form['rep']
#         u="update complaint set reply='%s'"%(reply)
#         up=update(u)
#         flash('Replied successfully')
#         return redirect(url_for('admin.admin_viewcomplaints'))

        
#     return render_template('admin_viewcomplaint.html',data=data)

@admin.route('/admin_viewcomplaints', methods=['post', 'GET'])
def admin_viewcomplaints():
    data = {}
    # Query to fetch complaints with admin details
    z = """
        SELECT 
            complaint.complaint_id, complaint.complaint, complaint.reply, 
            complaint.date, CONCAT(fname,' ',lname) AS fullname 
        FROM 
            user 
        INNER JOIN 
            complaint USING(user_id)
    """
    data['x'] = select(z)

    # Handle reply submission
    if 'sub' in request.form:
        # Retrieve the complaint ID from the form
        complaint_id = request.form.get('complaint_id')
        reply_key = f'reply_{complaint_id}'  # Construct the dynamic key
        reply = request.form.get(reply_key, '').strip()

        if reply and complaint_id:
            # Update the specific complaint reply
            u = "UPDATE complaint SET reply = '%s' WHERE complaint_id = '%s'"%(reply, complaint_id)
            update(u)
            flash('Replied successfully', 'success')
        else:
            flash('Failed to send reply. Please try again.', 'error')

        return redirect(url_for('admin.admin_viewcomplaints'))

    return render_template('admin_viewcomplaint.html', data=data)

    

        
        
    
