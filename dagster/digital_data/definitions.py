from dagster import Definitions
from dagster_dbt import DbtCliResource

from .assets import DigitalData_dbt_assets
from .project import DigitalData_project
from .schedules import schedules

defs = Definitions(
    assets=[DigitalData_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=DigitalData_project),
    },
)