from urllib.request import urlopen


class ResponseGetter():

    def retrieveStatusCode(self):
        statusCode = urlopen('http://example.org').code
        return statusCode

    def handleError(self):
        pass
