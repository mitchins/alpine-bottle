from bottle import route, run, template, default_app

@route('/hello/<name>')
def index(name):
    return template('<b>Hello {{name}}</b>!', name=name)

# Create app instance
app = application = default_app()

if __name__ == '__main__':
	run(host='localhost', port=8080)