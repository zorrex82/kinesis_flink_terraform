import json
import logging
import os
import re
import sys
from typing import Dict, List

logging.basicConfig(
    stream=sys.stdout,
    level=logging.INFO,
    format="%(asctime)s;%(levelname)s;%(message)s",
    datefmt="%m/%d/%Y %I:%M:%S %p",
)
logger = logging.getLogger("JobFlink")
logger.setLevel(logging.INFO)


def get_application_properties(
    properties: str,
) -> List[Dict[str, List[Dict[str, str]]]]:
    if os.path.isfile(properties):
        with open(properties, "r") as file:
            contents = file.read()
            properties = json.loads(contents)
            return properties
    else:
        logger.info(f"A file at {properties} was not found")


def property_map(
    props: List[Dict[str, List[Dict[str, str]]]], property_group_id: str
) -> Dict[str, str]:
    for prop in props:
        if prop["PropertyGroupId"] == property_group_id:
            return prop["PropertyMap"]


def column_map(json_file_path):
    try:
        with open(json_file_path, 'r') as file:
            column_mapping = json.load(file)
            return column_mapping.get("Columns", [])
    except FileNotFoundError:
        logging.error(f'Json file was not found')
        return []
    except json.JSONDecodeError as e:
        logging.error(f'Error decoding JSON: {e}')
        return []

def column_def(column_mapping):
    column_definitions = []
    for column in column_mapping:
        name = column.get("Name", "")
        column_type = column.get("Type", "")
        if name and column_type:
            column_definitions.append(f"{name} {column_type}")

    return ",\n".join(column_definitions)

def load_transformations(config_file_path):
    try:
        with open(config_file_path, "r") as config_file:
            config_data = json.load(config_file)
        return config_data
    except FileNotFoundError:
        raise FileNotFoundError(f"Config file '{config_file_path}' not found.")
    except json.JSONDecodeError as e:
        raise ValueError(f"Invalid JSON format in config file: {str(e)}")

def extract_database_name_from_arn(arn: str) -> str:
    match = re.match(r"^arn:[^:]+:glue:[^:]+:\d+:database/(?P<database>.{1,255})$", arn)
    if match is None:
        raise ValueError(
            f"Supplied ARN '{arn}' for the Glue database is not well-formed"
        )
    else:
        return match.group("database")
