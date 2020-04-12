# What is this

In case you don't want to build your own security requirements for projects from scratch, but rather prefer to bootstrap [SecurityRAT](https://github.com/SecurityRAT/SecurityRAT) quickly with a default set of security requirements, you can use this MySQL dump and edit it afterwards based on your needs.

## Update

- Added support for ASVS 4.0.1 and BSI C5 2020

## Usage

1. Create a new mySQL Database and set the privileges to the DB user , e.g.:

`CREATE DATABASE $your_db_name;`

`GRANT ALL PRIVILEGES ON $your_db_name.* To '$your_db_user'@'localhost' IDENTIFIED BY '$yourPW';`

`FLUSH PRIVILEGES;`

2. Start SecurityRAT without a requirement set to create the necessary database schema
`java -jar $SecurityRAT.war --spring.profiles.active=prod`

3. Import your favored requirement set below:
### Default Set

`mysql -u $your_db_user -p $your_db_name < requirements.sql`

### OWASP ASVS Set

#### OWASP ASVS 3.0.1 Set

`mysql -u $your_db_user -p $your_db_name < owasp_asvs_3_0_1.sql`

#### OWASP ASVS 4.0.1 Set

`mysql -u $your_db_user -p $your_db_name < OWASP-ASVS-4.0.1.sql`

In case SecurityRAT throws an exception if you want to add or modify an OptColumnContent, you must allow unicode characters for this table with (see https://github.com/SecurityRAT/SecurityRAT/issues/135):

`ALTER TABLE OPTCOLUMNCONTENT CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`

### BSI C5

`mysql -u $your_db_user -p $your_db_name < BSI-C5-2020.sql`

4. Fire up SecurityRAT again with your new security requirement set like in step 2.

## License

This project is distributed under the Apache license, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
