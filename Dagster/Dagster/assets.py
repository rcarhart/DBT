from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import DigitalData_project


@dbt_assets(manifest=DigitalData_project.manifest_path)
def DigitalData_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    

