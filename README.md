# Server-Config-and-Documentation
<h1>Ubuntu 20.04 LTS - Network Services Setup</h1>
<h2>Table of Contents</h2>
<ul>
  <li>Introduction</li>
  <li>How to Install this Distro</li>
  <li>DNS Bind9</li>
  <li>DHCP</li>
  <li>Uncomplicated Firewall</li>
  <li>Squid Proxy</li>
</ul>
<h2>Introduction</h2>
<p>Welcome to my Server Configuration Repository for Ubuntu 20.04.1 LTS! This repository acts as a thorough manual and resource for configuring and fine-tuning an Ubuntu server so that it may function as a reliable and effective centre for a range of services. This repository offers comprehensive instructions and configurations designed to make the installation and configuration procedure as simple as possible, regardless of the task at hand—deploying a DNS server with bind9, administering DHCP configurations, setting up a secure firewall, or using a Squid proxy server.</p>

<h2>How to Install this Distro</h2>

<p>For this setup, I used VMWare Workstation 17 and Ubuntu Server version 20.04.1. In order to install VMWare you can visit the download site for VMWare Worksation 17 here:</p> 
<ul>
  <li>https://www.vmware.com/go/getworkstation-win</li>
</ul>
<p>The default configurations for VMWare should be perfectly fine. VMware is going to act as the foundation for hosting our Ubuntu Server.</p>
<p>In order to install Ubuntu we have to download the Ubuntu ISO itself. Ubuntu is an open-source software so it’s free. Visit this link and grab it:<p></p>
<ul>
  <li>https://ubuntu.com/download/server</li>
</ul>
<ol>
    <li>Now open VMWare and select Create a New Virtual Machine</li>
    <li>Choose Custom (advanced) since we want to customize our server’s internals more.</li>
    <li>Next specify the path for the ISO of Ubuntu that you just downloaded</li>
    <li>The next screen may ask you for credentials for VMWare to create a user for you on the server so you can just login         once the installation is complete. You may do this or choose to install the ISO later, after the configuration you           may then want to attach the ISO after.</li>
    <li>Next name you machine and give it specifications for it’s Processors, Ram and Disk Size. This is up to you and the          capabilities of your host machine but I suggest a minimum of 4 Total Processor Cores, 4 GB Ram and at least 30GB            of disk space. </li>
    <li>For the Network type, you may want to set it up as NAT. After the server is up we can add another NIC to set for            you LAN end users.</li>
    <li>Everything else you can leave as default. Start the machine up and go through the default installation. Let’s get           to work!</li>
</ol>
<h2>Services This Server Provide</h2>
<p>To improve the server, I made use of several services. Using bind9, this Ubuntu server effectively handles domain name resolution like a DNS server. Additionally, it provides an automated network configuration procedure by dynamically assigning IP addresses to end hosts via DHCP. Since security is of the utmost importance, I have chosen to protect the server and its services using the Uncomplicated Firewall (ufw). The Squid proxy server is hosted on our server to optimise web traffic and improve user experience. Additionally, this repository provides insights into their setups so you may customise them to meet your specific requirements.</p>
