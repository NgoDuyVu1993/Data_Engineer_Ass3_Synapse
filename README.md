# Data Engineer Ass3 Synapse


# Set Up
## Set Up Summary
## Azure
- Create Resource Group
- Create an Azure PostgresSQL database
- Create an Azure Synapse workspace
- Create a Dedicate SQL Pool, database within the Synapse Workspace
## Local Machine
- Setup Anaconda, and virtual environment
- Run Python code "ProjectDataToPostgres.ipynb" to send data to PostgresSQL database

## Set Up Details
Before create any Azure Service, we must create Resource Group </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Resource%20Group.jpg)

Create Azure PostgresSQL to host the data, Noticed that we must configure the Firewall to allow Jupyter Notebook to send data to the Database </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Azure%20PostgreSQL%20Database.png)
We can only send data to Azure Database Postgres if the Firewall is setup, please check if Azure Postgres has Public access and create Firewall rule</br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Allow%20Azure%20Posgres%20Service%20Access.jpg)

Create an Azure Synapse workspace </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Azure%20Synapse.png)


Create a Dedicate SQL Pool in the Synapse Workspace
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Dedicated%20SQL%20Pool%20for%20Synapse.jpg)

## Setup Python code to ingest 
- Create python environment: `conda create --name data-engineer python` </br>
- Activate the environment: `conda activate data-engineer` </br>
- Install Psycopg2: `conda install -c anaconda psycopg2` </br>

Before run the code in the Jupyter Notebook, we must provide the host, username and password. The host can be seen in the Connection tab on Azure Postgres, the username and password are from when we setup the Postgres Database </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Send%20Data%20to%20Azure%20Postgres%20from%20Jupyter.png)


After running Jupyter Notebook to send data to Azure Database for PostgresSQL, we can use pgAdmin to chek if the database exist on the serve </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Set%20up%20pgAdmin.jpg)

We can running the SQL code to retrieve data on the Postgres Database </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Check%20Data%20on%20Azure%20Postgres.jpg)


# Start Ingesting Data
To ingest data, we need to Link Services for Azure Database for PostgresSQL </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Set%20Up%20Linked%20Service%20Postgres.jpg)

And create Link Services for Azure Database for Azure Blob Storage </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Set%20Up%20Linked%20Service%20Blob%20Storage.png)

After setting Link Services for PostgresSQL and Blob Storage, we can start to ingest (create pipeline) data from PostgresSQL to Blog Storage </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Pipeline%20and%20Ingest%20Data.png)

The result of Ingestion data on Synapse </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Ingest%20data%20into%20Synapse.jpg)

# Create Staging Tables
After data was ingested from PostgresSQL to Blog Storage, we can run SQL to create Staging tables. We can create external tables by running Dedicate SQL Pool </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Staging%20External%20Tables.jpg)

Running the SQL to created for each tables </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Staging%20Tables.jpg)

# Create Transformation Tables
To run SQL query for answer assignment questions, we must tranform the data to Start Scheme </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Start%20Schema.png)

The tables created </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Create%20Transformation%20tables.jpg)