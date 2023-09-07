from setuptools import find_packages, setup


def readme():
    with open("README.md", "r") as f:
        return f.read()


setup(
    name="serp",
    version="0.1.5",
    author="astrotourist",
    author_email="d@orbl.io",
    description="Python API client for SERP API",
    long_description=readme(),
    long_description_content_type="text/markdown",
    url="https://serptech.ru",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3.8",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.8",
)
