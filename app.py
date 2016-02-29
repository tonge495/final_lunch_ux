from bottle import request, route, run, template, static_file, default_app
import json

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

@route('/submit', method='POST')
def submit():
    result = None

    # this only does it once
    for key in request.POST.keys():
        if not result:
            result = key
            break

    data = json.loads(result)
    # data is a dictionary of parameters

    return template('index')

@route('/static/<filename:path>', name='static')
def server_static(filename):
    return static_file(filename, root='static')


# application = default_app()
run(host='localhost', port=8080, debug=True)
