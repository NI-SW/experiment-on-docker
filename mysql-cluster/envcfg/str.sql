ALTER USER 'root'@'localhost' IDENTIFIED BY 'Dft@passwd0';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
CREATE USER 'root'@'%' IDENTIFIED BY 'Dft@passwd0';
GRANT ALL privileges ON *.* TO 'root'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'Dft@passwd0';
FLUSH PRIVILEGES;
EXIT;