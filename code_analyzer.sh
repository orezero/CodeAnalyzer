#!/bin/bash                                                                        
echo "
######################################################################################
#Created by orez - orezero.orezero@gmail.com - orez@bbs.olografix.org                #
#Liberamente modificabile e ridistribuibile                                          #
######################################################################################"
echo "Source Code Analyzer for vulnerability assessment"
rm -fr /var/www/risultati/
mkdir /var/www/risultatii/sqli
mkdir /var/www/risultati/xss
touch /var/www/risultati/sqli/sqli_sql
touch /var/www/risultati/sqli/sqli_db
touch /var/www/risultati/sqli/sqli_dbuser
touch /var/www/risultati/sqli/sqli_dbpassword
touch /var/www/risultati/sqli/sqli_dbdatabase
touch /var/www/risultati/sqli/sqli_dbhost
touch /var/www/risultati/xss/xss_echo
touch /var/www/risultati/xss/xss_get
touch /var/www/risultati/xss/function_system
touch /var/www/risultati/sqli/msql_query
###--Cerchiamo potenziali SQLi--#####
echo "Inserisci il  percorso dove effettuare la ricerca delle SQL Injection"
read SQLi
echo "Iserisci il percorso dove effettuare le ricerche degli XSS"
read XSS
grep -n -r '$sql_' $SQLi >> /var/www/risultati/sqli/sqli_sql
grep -n -r '$db' $SQLi >> /var/www/risultati/sqli/sqli_db
grep -n -r '$dbuser' $SQLi >> /var/www/risultati/sqli/sqli_dbuser
grep -n -r '$dbpassword' $SQLi >> /var/www/risultati/sqli/sqli_dbpassword
grep -n -r '$dbhost' $SQLi >> /var/www/risultati/sqli/sqli_dbdatabase
grep -n -r '$dbdatabase' $SQLi >> /var/www/risultati/sqli/sqli_dbhost
grep -n -r 'system()' $SQLi >> /var/www/risultati/sqli/function_system
grep -n -r 'mysql_query()' $SQLi >> /var/www/risultati/sqli/msql_query
grep -n -r 'echo' $XSS >> /var/www/risultati/xss/xss_echo
grep -n -r '\$_GET' $XSS >> /var/www/risultati/xss/xss_get
