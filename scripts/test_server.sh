#!/bin/bash

SERVER_IP=$1

nmap -sV -Pn -p T:25565 $SERVER_IP
