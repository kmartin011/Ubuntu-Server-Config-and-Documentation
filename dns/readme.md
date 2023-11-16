<h1>DNS</h1>
<p>BIND 9 is a very flexible, full-featured DNS system. It is the most popular DNS server used today. Since we are going to set up a name server, Bind9 should be perfect since it easy to setup on Ubuntu.</p>
<h3>How to Install Bind9</h3>
<p>Enter the following command:</p>
<ul>
  <li>sudo apt install bind9</li>
</ul>
<h3>Configurations</h3>
<p>First edit the /etc/bind/named.conf.options file and change the default configurations to your DNS servers of your choosing. The default file looks like this, you want to change the 1.2.3.4; and 5.6.7.8;</p>

![image](https://github.com/kmartin011/Server-Config-and-Documentation/assets/148782985/65a7295d-e522-48ea-aa42-d34b602e02b5)

<p>Restart the DNS server using the command:</p>
<ul>
  <li>sudo systemctl restart bind9.service</li>
</ul>
<p>We should now setup the primary server for your domain. First we need to add a DNS zone to bind9. Edit the /etc/bind/named.conf.local file to change to include your chosen domain. </p>

![image](https://github.com/kmartin011/Server-Config-and-Documentation/assets/148782985/9e84bc5a-0b60-4e87-8207-acf165a1e48a)

<p>Next copy the existing zone file and use it to create a file for your new zone:
sudo cp /etc/bind/db.local /etc/bind/db.newzone.com </p>
<p>Edit the copy of the local file you made to change a couple things. Change localhost. to the domain of your server remember to leave the period at the end (newzone.com.). Next change 127.0.0.1 to the nameserver’s address. Next change root.localhost to an email address but instead of an @ symbol, use a period here and another period at the end. We will create an A record to point your domain to an IP. Also make sure to create an A record for your name server.
It is good practice to increment the serial number every time you change the zone file.</p>
<p>Restart the DNS server again</p>
<p>Some admins may want to setup a Reverse Zone File so that DNS can resolve addresses to names. This configuration can be found here: 
https://ubuntu.com/server/docs/service-domain-name-service-dns
</p>
