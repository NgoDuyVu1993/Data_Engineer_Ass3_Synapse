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


## Setup Python code to ingest 
- Create python environment: `conda create --name data-engineer python` </br>
- Activate the environment: `conda activate data-engineer` </br>
- Install Psycopg2: `conda install -c anaconda psycopg2` </br>

Before run the code in the Jupyter Notebook, we must provide the host, username and password. The host can be seen in the Connection tab on Azure Postgres, the username and password are from when we setup the Postgres Database </br>
![alt text](https://github.com/NgoDuyVu1993/Data_Engineer_Ass3_Synapse/blob/main/image/Send%20Data%20to%20Azure%20Postgres%20from%20Jupyter.png)

