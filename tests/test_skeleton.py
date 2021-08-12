import unittest
from src.skeleton import Skeleton


class SkeletonTestCase(unittest.TestCase):
    def test_message(self):
        message = "The Skeleton Message"
        skeleton = Skeleton()
        skeleton.setMessage(message)
        self.assertAlmostEqual(skeleton.getMessage(), message)


if __name__ == "__main__":
    unittest.main()
