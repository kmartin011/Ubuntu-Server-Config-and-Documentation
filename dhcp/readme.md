<h1>DHCP</h1>
<p>For DHCP services, Ubuntu and other Unix-like operating systems frequently employ the isc-dhcp-server package. Network administrators can use it to automate and manage the assignment of IP addresses and associated configuration parameters to connected devices.</p>
<p>First, we will edit the VM settings and add an additional adapter. Your end hosts are going to be on this same vnet. Configure the interface that was just created to use the static IP address of your choice. For my server it was 10.0.0.250 </p>
<p>The configuration files to edit are in the /etc/netplan directory. We will make a copy of the original file to keep untouched.</p>
<ul>
  <li>Sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.bak</li>
</ul>
<p>Do the command ip a. This would show you the new network adapter that you just added. For me it was ens37</p>
![Example Image](https://github.com/kmartin011/Server-Config-and-Documentation/blob/main/dhcp/image.png)
<p>Where</p>
<ul>
  <li>DEVICE_NAME is the actual device name to be configured</li>
  <li>yes/no is an option to enable or disable dhcp4.</li>
  <li>IP is the IP address for the device.</li>
  <li>NETMASK is the netmask for the IP address.</li>
  <li>GATEWAY is the address for your gateway.</li>
  <li>NAMESERVER is the comma-separated list of DNS nameservers.</li>
</ul>
<p>Let's Test that Configuration and Apply it</p>
<ul>
  <li>sudo netplan try</li>
  <li>sudo netplan apply</li>
</ul>
<h3>Installation of isc-dhcp-server</h3>
<p>To install the isc-dhcp-server, run the following command at prompt:</p>
<ul>
  <li>sudo apt install isc-dhcp-server</li>
</ul>
<h3>Configuartions</h3>
<p>We will be making edits to the /etc/dhcp/dhcpd.conf file. Configure the scope and options for a gateway and nameserver in the file.</p>
![Example image](https://github.com/kmartin011/Server-Config-and-Documentation/assets/148782985/de1ad710-ceec-48bb-901d-3a32a00b7a05)
<p>Ensure to assign it to the corresponding interface in the /etc/default/isc-dhcp-server file</p>
![image](https://github.com/kmartin011/Server-Config-and-Documentation/assets/148782985/c1adc385-b370-4f2e-98e8-555fc491de10)
<p>Next restart the dhcpd server:</p>
<ul>
  <li>sudo systemctl restart isc-dhcp-server.service</li>
</ul>
