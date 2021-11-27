# Purpose
The purpose of this project is to demonstrate how the ETL principles come together with airflow (astronomer) and dbt.

## ETL Principles
- Load data incrementally : extracts only the newly created orders of the day before, not the whole table.
- Process historic data : it’s possible to rerun the extract processes, but downstream DAGs have to be started manually.
- Enforce the idempotency constraint : every DAG cleans out data if required and possible. Rerunning the same DAG multiple times has no undesirable side effects like duplication of the data.
- Rest data between tasks : The data is in persistent storage before and after the operator.
- Pool your resources : All task instances in the DAG use a pooled connection to the DWH by specifying the pool parameter.
- Manage login details in one place : Connection settings are maintained in the Admin menu.
- Develop your own workflow framework : A subdirectory in the DAG code repository contains a framework of operators that are reused between DAGs.
- Specify configuration details once : The place where SQL templates are is configured as an Airflow Variable and looked up as a global parameter when the DAG is instantiated.

# Prerequisites
## PostgresSQL
This example uses postgres database that has a little bit of data, so that the example can materialize in full and the processing becomes clear. Please install Postgres database and make it available to WSL2 environment (Windows 10 with Docker) in which Astronomer will be running. 

For simplicity, this example also assumes using default postgres user.

## Astronomer
Please follow instructions on Astronomer website to create the development environment.

# Initial Setup

Run the following command from your shell prompt.
    ./create_everything.sh

Then create some tables and populate it with some data by running the following command from your shell prompt.
    ./load_data.sh

# Airflow & DBT Setup
## Astronomer

## DBT (Data Build Tool)

    pip3 install dbt

# Project Setup

1. Create the folder astro-dbt-example. 
2. Run the following command to initialize the project
    cd astro-dbt-example
    astro dev init
3. Run the following command to create the dbt project in the astro-dbt-example
    dbt init astro-dbt
4. Configure profiles.yml to setup the connection to the postgres database
5. Validate your configuration by running the following command
    HOST=172.29.16.1 PORT=5432 USERNAME=postgres PASSWORD=admin dbt debug --profi
les-dir .

