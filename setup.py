from setuptools import setup, find_packages
import pathlib

# The directory containing this file
HERE = pathlib.Path(__file__).parent

# The text of the README file
README = (HERE / "README.md").read_text()

# Parse requirements.txt for install_requires
with open(HERE / "requirements.txt") as f:
    install_requires = f.read().splitlines()

setup(
    name="Digital_Data",
    version="0.1.0",
    author="Ross Carhart",
    author_email="rcarhart@donercx.com",
    description="This is a DBT project for Doners Digital Data",
    long_description=README,
    long_description_content_type='text/markdown',
    url="https://github.com/rcarhart/DBT.git",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    install_requires=install_requires,
)

