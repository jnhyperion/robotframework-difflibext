import os
from setuptools import setup, find_packages

REQUIREMENTS = [i.strip() for i in open("requirements.txt").readlines()]

about = {}
with open(os.path.join("src", "DiffLibExt", "__version__.py")) as f:
    exec(f.read(), about)

VERSION = about["__version__"]

setup(
    version=VERSION,
    name="robotframework-difflibext",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    description="Robotframework library to show file/text differences via Python builtin difflib",
    author="Johnny Huang",
    author_email="jnhyperion@gmail.com",
    url="https://github.com/jnhyperion/robotframework-difflibext",
    keywords="robotframework diff library",
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
    install_requires=REQUIREMENTS,
    include_package_data=True,
)
