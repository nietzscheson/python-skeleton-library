from setuptools import setup, find_packages

setup(
    name="python-skeleton-library",
    version="0.1.0",
    author="Cristian Angulo Nova | @nietzscheson",
    author_email="cristianangulonova@gmail.com",
    description="A initial Python library",
    long_description="""
    A Python Skeleton Library
    """,
    long_description_content_type="text/markdown",
    url="https://github.com/nietzscheson/python-skeleton-library",
    install_requires=[],
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.9",
)
