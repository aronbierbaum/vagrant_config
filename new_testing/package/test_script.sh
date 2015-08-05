# Setup steps
# - Download taccs_ctl
# - Download archive

rm -rf /home/vagrant/deploy
mkdir /home/vagrant/taccs_data
cd /home/vagrant/package
#sudo rpm -Uvh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
#sudo rpm --import RPM-GPG-KEY.dag.txt
sudo rpm -Uvh pv-1.4.6-1.el7.x86_64.rpm 

sudo ./taccs_ctl bootstrap --no-admin-user
sudo ./taccs_ctl load_image --archive-file=taccs_ibm_ibm-x64-6.0.0-dev-current-0123-39cb706d.docker.xz
sudo ./taccs_ctl sample_config --image=quay.io/priority5/taccs_ibm:ibm-x64-6.0.0-dev-current-0123-39cb706d --config-dir=/home/vagrant/deploy

cd /home/vagrant/deploy
sudo ./taccs_ctl setup --host-data-dir=/home/vagrant/taccs_data --db-username=p5 --db-password=p5,taccs --ext-hostname=aronb-dev-vm2
sudo ./taccs_ctl init_db

#sudo cp /home/vagrant/taccs_license.json /home/vagrant/deploy/taccs_es/taccs_license.json
#sudo ./taccs_ctl start
