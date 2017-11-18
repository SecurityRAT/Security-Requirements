# What is this
In case you don't want to build your own security requirements for projects from scratch, but rather prefer to bootstrap [SecurityRAT](https://github.com/SecurityRAT/SecurityRAT) quickly with a default set of security requirements, you can use this MySQL dump and edit it afterwards based on your needs. 

# Update
We also support now the security requirements from OWASP ASVS 3.0.1

# Usage
## Default Set
`mysql -u $your_db_user -p $your_db_name < requirements.sql`

## OWASP ASVS Set
`mysql -u $your_db_user -p $your_db_name < owasp_asvs_3_0_1.sql`

# License
This project is distributed under the Apache license, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
