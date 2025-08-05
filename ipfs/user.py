from flask import *
from database import *


from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
from Crypto.Random import get_random_bytes


import uuid

from datetime import date,datetime
import  datetime


import json
from web3 import Web3, HTTPProvider

import ipfshttpclient
from flask_script import Manager
from flask_cors import CORS
from razorpay import Client
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad
from flask import request, send_file
import os


# from flask_cors import CORS


# CORS(app)




# truffle development blockchain address
blockchain_address = 'http://127.0.0.1:9545'
# Client instance to interact with the blockchain
web3 = Web3(HTTPProvider(blockchain_address))
# Set the default account (so we don't need to set the "from" for every transaction call)
web3.eth.defaultAccount = web3.eth.accounts[0]
compiled_contract_path = 'D:/Project2023/Btech/MBC/IMAGE_TRADING_BLOCKCHAIN/node_modules/.bin/build/contracts/imagesecures.json'
# Deployed contract address (see `migrate` command output: `contract address`)
deployed_contract_address = '0x81325CdDA22307cAF174E8f43185D351bd8B6A27'
syspath=r"'D:\Project2023\Btech\MBC\IMAGE_TRADING_BLOCKCHAIN\static\\"






user=Blueprint('user',__name__)

# CORS(user)

# user.config.from_pyfile('config.py')
# manager = Manager(user)

@user.route("/userhome")
def userhome():
	return render_template("user_home.html")

from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes
from Crypto.Util.Padding import pad, unpad
import uuid

# Define a global variable for the decryption key
decryption_key = None

@user.route('/user_add_image', methods=['get', 'post'])
def user_add_image():
    data = {}

    q = "select * from images where user_id='%s' or user_id!='%s'" % (session['uid'], session['uid'])
    res = select(q)
    data['upload'] = res

    if 'submit' in request.form:
        file = request.files['file']
        path = "static/encryptionimg/" + str(uuid.uuid4()) + file.filename
        file.save(path)

        def encrypt_message(message, key):
            cipher = AES.new(key, AES.MODE_CBC)  # Use CBC mode
            ciphertext = cipher.iv + cipher.encrypt(pad(message.encode(), AES.block_size))
            return ciphertext

        global decryption_key
        if not decryption_key:
            decryption_key = get_random_bytes(16)  # Generate decryption key if not already generated

        key = get_random_bytes(16)  # 16 bytes = 128 bits (AES-128)
        message = path  # Encrypting the file path
        encrypted = encrypt_message(message, key)
        print("Original:", message)
        print("decryption_key:", decryption_key)

        q = "INSERT INTO `images` VALUES(null,'%s','%s',curdate(),'%s','%s')" % (session['uid'], encrypted.hex(), path,decryption_key.hex())
        id = insert(q)

    return render_template('user_add_image.html', data=data)


@user.route('/download_image', methods=['GET', 'POST'])
def download_image():
    image_id = request.form['image_id']
    decryption_id = request.form['decryption_id']

    # Retrieve the encrypted image path from the database
    q = "SELECT path FROM images WHERE image = '%s'" % (image_id)
    result = select(q)
    if result:
        encrypted_path = result[0]['path']

        # Decrypt the image path using the decryption ID
        decrypted_path = decrypt_message(encrypted_path, decryption_id)

        # Read the encrypted image file and decrypt its content
        with open(decrypted_path, 'rb') as f:
            encrypted_image = f.read()

        decrypted_image = decrypt_image(encrypted_image, decryption_id)

        # Serve the decrypted image for download
        return send_file(decrypted_image, as_attachment=True)

    # Handle error if image is not found
    return "Image not found", 404

def decrypt_message(encrypted_message, decryption_key):
    decryption_key = decryption_key.encode()
    cipher = AES.new(decryption_key, AES.MODE_CBC)
    iv = encrypted_message[:AES.block_size]
    ciphertext = encrypted_message[AES.block_size:]
    decrypted_message = unpad(cipher.decrypt(ciphertext), AES.block_size).decode('utf-8')
    return decrypted_message

def decrypt_image(encrypted_image, decryption_key):
    decryption_key = decryption_key.encode()
    cipher = AES.new(decryption_key, AES.MODE_CBC)
    iv = encrypted_image[:AES.block_size]
    ciphertext = encrypted_image[AES.block_size:]
    decrypted_image = unpad(cipher.decrypt(ciphertext), AES.block_size)
    return decrypted_image
# @user.route('/download_image',methods=['get', 'post'])
# def download_image():
#     image_id = request.form['image_id']
#     decryption_id = request.form['decryption_id']

#     # Retrieve the encrypted image path from the database
#     q = "SELECT path FROM images WHERE image = '%s'" % (image_id)
#     print(q,"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")
#     result = select(q)
#     if result:
#         encrypted_path = result[0]['path']

#         # Decrypt the image path using the decryption ID
#         decrypted_path = decrypt_message(encrypted_path, decryption_id)

#         # Serve the decrypted image for download
#         return send_file(decrypted_path, as_attachment=True)

# def decrypt_message(encrypted_message, decryption_key):
#     decryption_key = decryption_key.encode()
#     cipher = AES.new(decryption_key, AES.MODE_CBC)
#     iv = encrypted_message[:AES.block_size]
#     ciphertext = encrypted_message[AES.block_size:]
#     decrypted_message = unpad(cipher.decrypt(ciphertext), AES.block_size).decode('utf-8')
#     return decrypted_message
#     # Handle error if image is not found
#     return "Image not found", 404








@user.route('/user_view_bbimage',methods=['get','post'])
def user_view_bbimage():
	data={}

	im_id=request.args['im_id']
	with open(compiled_contract_path) as file:
		contract_json = json.load(file)  # load contract info as JSON
		contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
	contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
	blocknumber = web3.eth.get_block_number()
	res = []
	try:
		for i in range(blocknumber, 0, -1):
			a = web3.eth.get_transaction_by_block(i, 0)
			decoded_input = contract.decode_function_input(a['input'])
			print(decoded_input)
			if str(decoded_input[0]) == "<Function add_imagerecord(uint256,uint256,string,string,string,string)>":
				print("-----------------------------------",int(decoded_input[1]['user_id']))

				if int(decoded_input[1]['im_id']) == int(im_id):
					res.append(decoded_input[1])
	except Exception as e:
		print("", e)
	data['view']=res
	print("/////////",res)

	
	return render_template('user_view_bimage.html',data=data)


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
    try:
        p = os.path.splitext(path)
        hash = str(p[0])

        if not hash or not hash.startswith('Qm'):
            return "<Invalid Path>", 404
        url = url = 'http://localhost:8080/ipfs/' +hash
        return download(url)
    except Exception as e:
        return "Download Error!"+str(e), 503













@user.route('/user_upload_file',methods=['get','post'])
def user_upload_file():
	data={}

	if 'submit' in request.form:
		na=request.form['na']
		amt=request.form['amt']
		image=request.files['file']
		

		
		image.save("D:\\Project2023\\Btech\\MBC\\IMAGE_TRADING_BLOCKCHAIN\\static\\a.jpg")
		d=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
		client = ipfshttpclient.connect('/ip4/127.0.0.1/tcp/5001/http')
		res = client.add("D:\\Project2023\\Btech\\MBC\\IMAGE_TRADING_BLOCKCHAIN\\static\\a.jpg")
		url = 'http://localhost:8080/ipfs/' + res['Hash']
		with open(compiled_contract_path) as file:
			contract_json = json.load(file)  # load contract info as JSON
			contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
		contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
		id=web3.eth.get_block_number()
		print(id)
		message = contract.functions.add_imagerecord(id,int(session['uid']),str(na),str(amt),str(res['Hash']),d).transact({"from": web3.eth.accounts[0]})
		flash("Added..!!")
		return redirect(url_for('user.userhome'))

	


	with open(compiled_contract_path) as file:
		contract_json = json.load(file)  # load contract info as JSON
		contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
	contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
	blocknumber = web3.eth.get_block_number()
	res = []
	try:
		for i in range(blocknumber, 0, -1):
			a = web3.eth.get_transaction_by_block(i, 0)
			decoded_input = contract.decode_function_input(a['input'])
			print(decoded_input)
			if str(decoded_input[0]) == "<Function add_imagerecord(uint256,uint256,string,string,string,string)>":
				print("-----------------------------------",int(decoded_input[1]['user_id']))

				if int(decoded_input[1]['user_id']) == int(session['uid']):
					res.append(decoded_input[1])
	except Exception as e:
		print("ereeee", e)
	
	print("/////////",res)
	return render_template('user_upload_file.html',data=res)


@user.route('/user_view_payment')
def user_view_payment():
	im_id=request.args['im_id']
	# Sample item IDs
	data={}
	q="select * from payment inner join seller using(seller_id) where image_id='%s'" %(im_id)
	res=select(q)
	data['res']=res


	return render_template('user_view_payment.html', data=data)


@user.route('/client_make_payment')
def client_make_payment():
	# Simulate context data (replace with your actual data)
	total_amount=request.args['amount']# Sample total amount
	im_id=request.args['im_id']
	# Sample item IDs


	return render_template('client_make_payment.html', amount=total_amount, im_id=im_id)


@user.route('/user_payment_complete', methods=['POST','GET'])
def user_payment_complete():
    # Retrieve payment details from the query parameters
    amount = request.args['amount']
    im_id = request.args['im_id']
    print("-----------",amount)
    print("-----------",im_id)

    # Process payment logic here
    # if 'pay' in request.form:
    # Insert payment details into the database (replace with your database logic)
    q = "INSERT INTO `payment` VALUES (null, '%s','%s', '%s', curdate())" % (session['sid'],im_id, amount)
    print("-----------",q)
    id = insert(q)  # Execute your database insertion query here

    flash('Payment successfully processed!')
    return redirect(url_for('user.user_view_download'))

    # If payment processing fails or form submission is invalid, render payment_complete.html
    return render_template('payment_complete.html')








@user.route('/user_view_download',methods=['get','post'])
def user_view_download():
	data={}

	with open(compiled_contract_path) as file:
		contract_json = json.load(file)  # load contract info as JSON
		contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
	contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
	blocknumber = web3.eth.get_block_number()
	res = []
	try:
		for i in range(blocknumber, 0, -1):
			a = web3.eth.get_transaction_by_block(i, 0)
			decoded_input = contract.decode_function_input(a['input'])
			print(decoded_input)
			if str(decoded_input[0]) == "<Function add_imagerecord(uint256,uint256,string,string,string,string)>":
				print("-----------------------------------",int(decoded_input[1]['user_id']))

				# if int(decoded_input[1]['im_id']) == int(im_id):
				res.append(decoded_input[1])
	except Exception as e:
		print("", e)
	data['view']=res
	print("/////////",res)
	# if res:
	# 	data['image']=res[0]['image']
		# q="select * payment from where im_id='%s'"%(im_id)
		# res=select(q)
		# data['view']=res
	
	return render_template('user_view_download.html',data=data)

