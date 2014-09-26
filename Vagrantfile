# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
DOCKER_HOST_NAME = "dockerhost"
DOCKER_HOST_VAGRANTFILE = "./Vagrantfile.proxy"


VAGRANTFILE_API_VERSION = "2"  
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "redis" do |v|
    v.vm.provider "docker" do |d|
      d.image = "dockerfile/redis"
      d.volumes = ["/var/docker/redis:/data"]
      d.ports = ["6379:6379"]
#      d.vagrant_vagrantfile = "./Vagrantfile.proxy"
#      d.vagrant_machine = "#{DOCKER_HOST_NAME}"
      d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
    end
  end

   # NOTE: In order to run manually use the following. If you don't want to
   #       see the ejabberd remove the --detach argument.
   # sudo docker run -p 5222:5222 quay.io/priority5/ejabber:v3

  # TODO: Map the volume from the local Windows directory.
  config.vm.define "ejabberd" do |v|
    v.vm.provider "docker" do |d|
      d.image = "quay.io/priority5/ejabber:v3"
      d.create_args = ["--detach"]
      #d.env = {"ES_URL" => "http://10.23.1.202:8780",
      #         "ES_ADMIN_PASSWORD" => "p5"}
      d.volumes = ["/home/vagrant/config_repo:/config_repo"]
      d.ports = ["5222:5222"]
      d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
    end
  end

#  config.vm.define "elasticsearch" do |v|
#    v.vm.provider "docker" do |d|
#      d.image = "dockerfile/elasticsearch"
#      d.ports = ["9200:9200"]
#      d.vagrant_vagrantfile = "./Vagrantfile.proxy"
#    end
#  end

#  config.vm.define "postgres" do |v|
#    v.vm.provider "docker" do |d|
#      d.image = "paintedfox/postgresql"
#      d.volumes = ["/var/docker/postgresql:/data"]
#      d.ports = ["5432:5432"]
#      d.env = {
#        USER: "root",
#        PASS: "abcdEF123456",
#        DB: "root"
#      }
#      d.vagrant_vagrantfile = "./Vagrantfile.proxy"
#    end
#  end

end  
