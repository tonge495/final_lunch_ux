from bottle import request, route, run, template, static_file, default_app
# NOTE:
# Bottle is weird about templates. By default, it expects them to be in a
# directory adjacent to this file called `views`.


@route('/', method='GET')
def index():
    '''The main route used in the application. We are going to provide all the
    questions within one page. The logic to render a new page is handled by the
    UI.
    '''
    return template('index')

@route('/submit')
def submit():
    pass
    # Do yo monog stuff
    if request.GET.get():
        pass

@route('/static/<filename:path>', name='static')
def server_static(filename):
    return static_file(filename, root='static')


# application = default_app()
run(host='localhost', port=8080, debug=True)
