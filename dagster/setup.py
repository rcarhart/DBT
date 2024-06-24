from setuptools import find_packages, setup

setup(
    name="digital_data",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        "digital_data": [
            "dbt-project/**/*",
        ],
    },
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dbt-sqlserver<1.9",
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)