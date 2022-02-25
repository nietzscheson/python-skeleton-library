import unittest
from unittest.mock import MagicMock

from src.response_getter import ResponseGetter


class ResponseGetterTestCase(unittest.TestCase):
    def test_response_getter(self):
        requestObject = ResponseGetter()
        requestObject.retrieveStatusCode = MagicMock(return_value=200)
        responseStatus = requestObject.retrieveStatusCode()
        self.assertEqual(200, responseStatus)


if __name__ == "__main__":
    unittest.main()
