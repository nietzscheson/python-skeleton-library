import unittest
from unittest.mock import MagicMock

from src.response_getter import ResponseGetter


def test_response_getter():
    requestObject = ResponseGetter()
    requestObject.retrieveStatusCode = MagicMock(return_value=200)
    responseStatus = requestObject.retrieveStatusCode()
    
    assert 200 == responseStatus
    # self.assertEqual(200, responseStatus)
