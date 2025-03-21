#!/bin/bash
user="ms264315"
log_node="orcusloginamd1"
IP_amd1="10.8.110.101"
# IP_amd2="10.8.110.102"
# IP_amd1="10.8.110.111"
# IP_amd1="10.8.110.112"
ssh -X -i ~/.ssh/id_rsa ${user}@${IP_amd1}