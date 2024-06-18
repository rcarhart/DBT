from setuptools import find_packages, setup

setup(
    name="Dagster",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        "Dagster": [
            "dbt-project/**/*",
        ],
    },
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dbt-sqlserver 1.7.4",
        "dbt-core 1.7.16"
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)

