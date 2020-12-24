## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/cjspencer/UCB-Cybersecurity/blob/main/Diagrams/RedTeamResourceGroup.png?raw=true)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - [filebeat-playbook.yml](..\Ansible\filebeat-playbook.yml) 

This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

- Load balancers also provide security from a Distributed Denial of Service (DDoS) attack, ensuring availability of the network and it's contained information. They do this by monitoring server load, availability, and health to determine how to distribute web traffic across the servers so that the servers do not become overwhelmed. 
- The advantage of a jump box to provide a single, secure point of origin for administrative tasks of the network. The jump box is within the network security group, is only accessed by SSH by the administrator's computer using cryptographic SSH keys, and only accesses the network and not the internet. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

- Filebeat watches for changes in log files and locations. It collects log events, and ships them to Logstash for advanced processing or to Elasticsearch for indexing.
- Metricbeat records metrics from the server operating system and from services running on the server. It collects metrics and ships them to Logstash for processing or to Elasticsearch for indexing.

The configuration details of each machine may be found below.

| Name      | Function          | IP Address                   | Operating System   |
| --------- | ----------------- | ---------------------------- | ------------------ |
| JumpBox   | Gateway           | 40.118.189.172<br />10.3.0.4 | Linux Ubuntu 18.04 |
| RedTeamLB | Load Balancer     | 104.45.225.139               | Linux Ubuntu 18.04 |
| Web1      | Web Server (DVWA) | 10.3.0.5                     | Linux Ubuntu 18.04 |
| Web2      | Web Server (DVWA) | 10.3.0.6                     | Linux Ubuntu 18.04 |
| Web3      | Web Server (DVWA) | 10.3.0.7                     | Linux Ubuntu 18.04 |
| Elk1      | Elk Server        | 20.57.160.75<br />10.4.04    | Linux Ubuntu 18.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box virtual machine (JumpBox) can accept connections from the Internet. Access to this machine is only allowed from the the administrators computer at the following IP address:

- Personal IP (administrative)

It is possible to interact with DVWA on the Web Servers by connecting to them through the the RedTeamLB load balancer through the external IP address:

- Public IP: 104.45.225.139

Machines within the network can only be accessed by SSH from the JumpBox

- Public IP: 40.78.21.13
- Private IP: 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name             | Publicly Accessible     | Allowed IP Addresses         |
| ---------------- | ----------------------- | ---------------------------- |
| JumpBox          | No                      | Personal IP (administrative) |
| RedTeamLB        | Yes                     | Any                          |
| Web1, Web2, Web3 | Yes - Through RedTeamLB | 104.45.225.139<br />10.3.04  |
| Elk Server       | No                      | 10.3.0.4                     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automated configuration is more efficient, allows for replication and repeatability across multiple containers, and is less error prone than manual configuration across multiple devices.

The playbook implements the following tasks:

- Installation of modules and software (Docker.io, Python3-pip, YAML Docker module)
- Increase virtual memory of containers
- Download and configure Elk Docker container
- Set ports

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![elk_docker_ps](C:\Users\chadw\Documents\UCB-Cybersecurity\Cloud Security ELK Stack Project\Images\elk_docker_ps.PNG)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

- Web1: 10.3.0.5
- Web2: 10.3.0.6
- Web3: 10.3.0.7

We have installed the following Beats on these machines:

- Filebeats were successfully installed on these machines

These Beats allow us to collect the following information from each machine:

- Filebeats monitors changes to files and their locations. These changes are logged and shipped to Elasticsearch and Logstash for indexing and review.

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the filebeat-config.yml file to /etc/ansible/files.
- Update the configuration file to include
  - ​	Private IP of the ELK-Server in the ElasticSearch and the Kibana sections 
- Run the playbook, and navigate to http://<ELK-PublicIP>:5601/app/kibana to check that the installation worked as expected.

**Questions**

- _Which file is the playbook? Where do you copy it?_
  - elk-install.yml  - installs the ELK Server
  - filebeat-playbook.yml  - installs and configures Filebeat on the ELK and DVWA servers
- *Which file do you update to make Ansible run the playbook on a specific machine?* 
  - /etc/ansible/hosts
- *How do I specify which machine to install the ELK server on versus which to install Filebeat on?_*
  - Specify within /etc/ansible/hosts where they should be installed.
- _Which URL do you navigate to in order to check that the ELK server is running?
  - http://<ELK-PublicIP>:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

1. ssh tired_user@40.118.189.172
2. sudo su
3. sudo docker container list -all
4. sudo docker start <docker-container-name>
5. cd /etc/ansible
6. ansible-playbook install-elk.yml to install and configure the ELK Server
7. cd /etc/ansible/roles
8. ansible-playbook filebeat-playbook.yml to install and configure Filebeats
9. Open a browser and navigate to http://<ELK-PublicIP>:5601/app/kibana to interact with the Kibana website.
