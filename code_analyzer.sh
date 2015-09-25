#!/bin/bash                                                                        
echo "
######################################################################################
#Created by orez - orezero.orezero@gmail.com - orez@bbs.olografix.org                #
#Freely modifiable and redistributable where you want, when you want and how you want#
######################################################################################"
echo "Source Code Analyzer for vulnerability assessment"
rm -fr /var/www/risultati/
mkdir /var/www/risultati
touch /var/www/risultati/sqli_sql
touch /var/www/risultati/sqli_db
touch /var/www/risultati/sqli_dbuser
touch /var/www/risultati/sqli_dbpassword
touch /var/www/risultati/sqli_dbdatabase
touch /var/www/risultati/sqli_dbhost
touch /var/www/risultati/xss_echo
touch /var/www/risultati/xss_get
#####--Cerchiamo potenziali SQLi--#####
echo "Inserisci il  percorso dove effettuare la ricerca delle SQL Injection"
read SQLi
#####--Cerchiamo potenziali XSS--#####
echo "Iserisci il percorso dove effettuare le ricerche degli XSS"
read XSS
grep -n -r '$sql_' $SQLi >> /var/www/risultati/sqli_sql
grep -n -r '$db' $SQLi >> /var/www/risultati/sqli_db
grep -n -r '$dbuser' $SQLi >> /var/www/risultati/sqli_dbuser
grep -n -r '$dbpassword' $SQLi >> /var/www/risultati/sqli_dbpassword
grep -n -r '$dbhost' $SQLi >> /var/www/risultati/sqli_dbdatabase
grep -n -r '$dbdatabase' $SQLi >> /var/www/risultati/sqli_dbhost
grep -n -r 'echo' $XSS >> /var/www/risultati/xss_echo
grep -n -r '\$_GET' $XSS >> /var/www/risultati/xss_get 
