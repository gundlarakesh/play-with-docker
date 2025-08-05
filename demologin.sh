#!/bin/bash
username=$1
password=$2

echo "$password" | docker login -u "$username" --password-stdin
