from flask import Flask
from public import public
from admin import admin
from user import user
from officer import officer

app=Flask(__name__)
app.secret_key="yyy"

app.register_blueprint(public)
app.register_blueprint(admin)
app.register_blueprint(user)
app.register_blueprint(officer)
app.run(debug=True,port=5011)