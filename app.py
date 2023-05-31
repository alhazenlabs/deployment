import os, sys

# Adding the path in the system to fix the python path
sys.path.append(os.path.join(os.getcwd(), 'ecwid_shiprocket_app'))
sys.path.append(os.path.join(os.getcwd(), 'fynd_imdb'))

from ecwid_shiprocket_app.webapp import create_flask_app
from fynd_imdb.webapp import register_flask_blueprint


if __name__ == "__main__":
    # Here the app is the connexion app which can be used to add Open API spec yamls
    app = create_flask_app()

    # Here the app.app is the flask app which can be used to add flask app
    register_flask_blueprint(app.app, False)

    app.run(port=8081)