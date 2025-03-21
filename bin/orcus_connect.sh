#!/bin/bash
user="ms264315"
# log_node="orcusloginamd1"
# log_node="orcusloginamd2"
log_node="orcusloginint1"

# ssh -X -i ~/.ssh/id_rsa ${user}@${log_node}
ssh -X -i ~/.ssh/id_rsa ${user}@${log_node}