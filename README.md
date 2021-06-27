
1. Clone this repo.  

2. Use the terraform files under [/terraform](terraform/) to create an ec2 instance that will be used in class.  You will need to provide a `vpc_id` value to create the instance in and a `default_keypair_name`.  
> **Importent:** The terraform creates your ec2 instance open to the world on 3 ports + ICMP. Please change this to your own IP before class and again during class.  

3. Connect to the ec2 instance and clone this repo again, this time to the server.  

4. cd into the [./setup](setup/) directory and install docker and docker-compose on the server.  
You can use the script I prepered ([`inst_docker.sh`](setup/inst_docker.sh)) to install it for you, or do it yourself with ansible or manually.  
After the instalation completes varify you can run docker commands on the host (you might need to logoff-logon).  

5. Install `node_exporter` on the server. `node_exporter` is a utility that exports server metrics (CPU %, memory usage, disk space etc.)  
In class we will feed this data into prometheus, and prometheus will save it over time.  
We want to install `node_exporter` as a systemd service so it will always be available on our instance.  
Run the script [`inst_node_exporter.sh`](setup/inst_node_exporter.sh)) (from within the [./setup](setup/) dir) to do all the heavy lifting for you.  

6. Now that everythings is installed, cd into the [./compose](compose/) directory.  
From within the compose directory, run the command:
```shell
docker-compose up -d
```  
This will spin up 2 containers, one with prometheus and one with grafana.  

7. Varify you can access grafana at http://\<you-host-ip-address\>:3000  
8. Varify you can access prome at http://\<you-host-ip-address\>:9090 
>**Note:** Initial user and password are `admin\admin`. Please change the password and remember it!  




FOR GPU NODES:

1. DCGM INSTALL -> https://developer.nvidia.com/dcgm

2. run gpu-exporter
```shell
docker run -d --gpus all --rm -p 9400:9400 nvcr.io/nvidia/k8s/dcgm-exporter:2.1.8-2.4.0-rc.3-ubuntu18.04
```
