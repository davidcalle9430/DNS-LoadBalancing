from flask import Flask
from redis import Redis
import os
import socket
app = Flask( __name__ )
redis = Redis( host = 'redis.david.calle' , port = 6379 )
host = socket.gethostname()

@app.route('/')
def hello():
    redis.incr('hits')
    return '\n<h1>Hola Redes</h1>\n <p>Han entrado %s veces al servidor .\nMi hostname es  <strong>%s</strong><p> \n\n' % ( redis.get('hits') , host )

if __name__ == "__main__":
    app.run( host = "0.0.0.0", debug = True )
