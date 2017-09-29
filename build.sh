#!/bin/bash

yum install git -y
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
git clone https://github.com/Aaron-Benson/tutor-market.git
cd tutor-market
npm install
# How to run node so it's open to the internet
