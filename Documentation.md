1. Using "vagrant init generic/ubuntu2204" a vagrantfile was created and configuration was set for two Ubuntu based servers named "Master" and "Slave".

2. Then Vagrant up was run to automate the the provisioning of the servers.

3. vagrant ssh master was run to ssh into the master node so the bash script could be run.

4. Script to automate the deployment of a LAMP Stack with cloned PHP application from Github, with all the necessary packages to be installed and to configure Apache web server and MYSQL was created.

5. The script was then made executable by running chmod +x exam_bash_sript.sh 

6. The LAMP stack was the deployed using ./exam_bash_script.sh and checked if the php application was accessible.

7. An ansible playbook was then created to execute the bash script on the slave node.

8. vagrant ssh into the slave node and run the playbook(exam_ansible_playbook.yml) 

9. The crontab file was opened using "crontab -e" for editing.

10. The following was added : 0  12 * * * /exams_cronjob.sh  The file was saved and exited.

11. A script to check the server's uptime was created and saved as exams_cronjob.sh and made executable.



