from PyPDF2 import PdfFileReader
from flask import Flask
from flask import*
from database import *
import uuid 

from pdf import*
from test import *



officer=Blueprint('officer',__name__)

@officer.route('/officer_home')
def officer_home():
    return render_template("officer_home.html")

@officer.route('/officer_viewplot')
def officer_viewplot():
    data={}
    s1="select * from user inner join plot using(user_id) inner join aadharam using(aadharam_id) inner join district using(district_id) inner join panchayath on district.district_id=panchayath.panchayath_id"
    data['s2']=select(s1)
    
    if 'action' in request.args:
        action=request.args['action']
        pid=request.args['pid']
    else:
        action=None
        
    if action=='accept':
        u="update plot set statuss='Accepted' where plot_id='%s'"%(pid)
        update(u)
        flash("Accepted Successfully!")
        return redirect(url_for('officer.officer_viewplot',pid=pid))
    
    if action=='reject':
        r="update plot set statuss='Rejected' where plot_id='%s'"%(pid)
        update(r)
        flash("Rejected Successfully!")
        return redirect(url_for('officer.officer_viewplot',pid=pid))

    return render_template("officer_viewplot.html",data=data)

@officer.route('/officer_viewuser')
def officer_viewuser():
    data={}
    uid=request.args['uid']
    s="select *,concat(fname,' ',lname) as fullname from user where user_id='%s'"%(uid)
    data['s1']=select(s)
    
    return render_template("officer_viewuser.html",data=data)
    
    
@officer.route('/officer_viewaadharam',methods=['get','post'])
def officer_viewaadharam():
    data={}
    pid = request.args['pid']
    s="select * from aadharam where plot_id='%s'"%(pid)
    data['s1']=select(s)
    
    return render_template("officer_viewaadharamdetails.html",data=data)

@officer.route('/officer_chatwithuser',methods=['get','post'])
def officer_chatwithuser():
    data={}
    reciver_id=request.args['rid']

    if 'submit' in request.form:
        message=request.form['msg']
        i="insert into chat values(null,'%s','%s','%s',now())"%(session['lid'],reciver_id,message)
        insert(i)
        
    s1="select * from chat where sender_id='%s' and receiver_id='%s' or sender_id='%s' and receiver_id='%s'"%(reciver_id,session['lid'],session['lid'],reciver_id)
    data['msg']=select(s1)
    return render_template('officer_chatwithuser.html',data=data)

@officer.route('/officer_viewrequestforsell', methods=['GET', 'POST'])
def officer_viewrequestforsell():
    data = {}
    s = """
    SELECT *, concat(fname, ' ', lname) as fullname 
    FROM user 
    INNER JOIN request USING(user_id) 
    INNER JOIN sell USING(sell_id) 
    INNER JOIN request_officers USING(request_id)
    """
    data['e'] = select(s)

    if request.method == 'POST':
        action = request.form.get('action')
        if action:
            action_type, request_officers_id = action.split('-')
            if action_type == 'accept':
                u = "UPDATE request_officers SET status = 'Accepted' WHERE request_officers_id = '%s'" % (request_officers_id)
                update(u)
                flash("Request accepted successfully!")
            elif action_type == 'reject':
                u = "UPDATE request_officers SET status = 'Rejected' WHERE request_officers_id = '%s'" % (request_officers_id)
                update(u)
                flash("Request rejected successfully!")
            return redirect(url_for('officer.officer_viewrequestforsell'))

    return render_template("officer_viewrequestforsell.html", data=data)




@officer.route('/officer_add_aadharam',methods=['post','get'])
def officer_add_aadharam():
    data={}
    pid = request.args['pid']
    aid = request.args['aid']
    s="select * from aadharam where plot_id='%s'"%(pid)
    data['s1']=select(s)
    # res=select(s)

    if 'sub' in request.form:
        s="select * from aadharam where aadharam_id='%s'"%(aid)
        # data['s11']=select(s)
        res1=select(s)
        # Construct the URL to download from IPFS
        url = 'http://localhost:8080/ipfs/' + res1[0]['file']
        print("ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp")
        print(url)
        print("jjkjjjj")

        # Define where to save the downloaded file
        # save_directory = "static/downloads/"
        # os.makedirs(save_directory, exist_ok=True)
        # save_path = os.path.join(save_directory, f"{hash}{p[1]}")

        # Download the file and save it
        downloaded_file = download(url, "static/downloads/abc.pdf")
        
        
        
        pid = request.args['pid']
        image=request.files['aad']
        path="static/images/"+str(uuid.uuid4())+image.filename
        image.save(path)
        readdata=pdfreader(path)
        readdatas=pdfreader("static/downloads/abc.pdf")
        
        outs=checkans(readdata,readdatas)
        if int(outs)==10:
            flash("Verified The Contents are same")
        else:
            flash("Malpractise Detected")
        return redirect(url_for('officer.officer_add_aadharam',pid=pid,aid=aid))
        
        print("====================================================")
        # print(readdata)
        data['s3'] = readdata
      
    return render_template('officer_add_aadharam.html',data=data)






def extract_pdf_text(pdf_path):
    """Extract text from a PDF file."""
    with open(pdf_path, 'rb') as file:
        pdf = PdfFileReader(file)
        text = ""
        for page_num in range(pdf.getNumPages()):
            text += pdf.getPage(page_num).extractText()
    return text

def compare_texts(text1, text2):
    """Compare two texts and return the differences."""
    return text1 == text2  # This can be improved to show more detailed differences


import os
import requests
from flask import send_file, request

def download(url, save_path):
    """Download the file from the URL and save it to the specified path."""
    h = {"Accept-Encoding": "identity"}
    r = requests.get(url, stream=True, verify=False, headers=h)
    try:
        r.raise_for_status()
    except requests.exceptions.HTTPError as e:
        return f"IPFS Server Error! {str(e)}", 503

    # Save the file locally
    with open(save_path, 'wb') as f:
        for chunk in r.iter_content(chunk_size=8192):
            f.write(chunk)

    return save_path  # Return the path to the saved file

# @officer.route("/downs/<path:path>")
# def down(path):
#     print(path, '/////////////////////////')
#     try:
#         p = os.path.splitext(path)
#         hash = str(p[0])
#         print(hash)

#         if not hash or not hash.startswith('Qm'):
#             return "<Invalid Path>", 404

#         # Construct the URL to download from IPFS
#         url = 'http://localhost:8080/ipfs/' + hash
#         print(url)

#         # Define where to save the downloaded file
#         save_directory = "static/downloads/"
#         os.makedirs(save_directory, exist_ok=True)
#         save_path = os.path.join(save_directory, f"{hash}{p[1]}")

#         # Download the file and save it
#         downloaded_file = download(url, save_path)

#         # Serve the file for download
#         return send_file(downloaded_file, as_attachment=True)

#     except Exception as e:
#         return f"Download Error! {str(e)}", 503

