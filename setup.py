from setuptools import setup, find_packages

setup(
    name="sagapi-proto",
    version="1.0.0",
    description="SAGAPI-Proto Web Middleware for PT Sahabat Agro Group",
    author="PT Sahabat Agro Group",
    packages=find_packages(),
    install_requires=[
        "Flask==2.3.3",
        "pandas==2.0.3",
        "openpyxl==3.1.2",
        "fpdf2==2.7.6",
        "Werkzeug==2.3.7",
        "gunicorn==21.2.0"
    ],
    python_requires=">=3.11",
)
