<h1>Hardening</h1>
<p>Server hardening is the process of securing a computer system or server to reduce its vulnerability to potential security threats and unauthorized access.</p>
<p>Hardening will be a little different, however you can still perform this on your server. I performed this on a clean OS of ubuntu just to test it. According to Matthew Redmond, trying to harden a system that may have already been compromised, through standard usage, unnecessary software, network exposure… is an exercise in futility. I strongly believe this and so I did this on another OS and then wiped it away.</p>
<h3>Keep Your OS up to Date</h3>
<p>I know, I know. Updates get a bad rap. This is mainly because of the PTSD if windows update every 10 business seconds. However, updates are important to keep your system secure as most vulnerabilities are due to an out-of-date system.</p>
<p>Here are a few commands you can run every now and again to keep your system up to date.</p>
<ul>
  <li>sudo su</li>
  <li>apt update</li>
  <li>apt list –installed (you should remove unused packages)</li>
  <li>apt dist-upgrade (to upgrade your OS)</li>
  <li>apt upgrade</li>
  <li>apt install unattended-upgrades (enable unattended upgrades)</li>
  <li>systemctl status unattended-upgrades.service</li>
  <li>dpkg-reconfigure -plow unattended-upgrades</li>
</ul>
<p>Somtimes you'll need to patch the kernel, but on a server we don't want to shut down thats Windows non-sense</p>
<p>Get a key here: https://auth.livepatch.canonical.com/ </p>
<ul>
  <li>snap install canonical-livepatch</li>
  <li>canonical-livepatch enable [your-key] </li>
  <li>canonical-livepatch status</li>
  <li>shutdown now -r</li>
</ul>

<h3>SSH Port</h3>
<p>Some administrators increase the security of their systems by assigning a different port as the default SSH port instead of 22. Although it isn't perfect and shouldn't be viewed as a full safety solution, it can provide a higher level of security by making things less predictable for attackers.</p>
<p>Start by changing the SSH port</p>
<ul>
  <li>sudo nano /etc/ssh/sshd_config</li>
</ul>

![image](https://github.com/kmartin011/Server-Config-and-Documentation/assets/148782985/1b3c32e7-b3bc-4527-81f4-fd20b373a026)

<ul>
  <li>sudo service sshd restart</li>
</ul>
<p>Now open a new terminal and test the new connection. If you try to ssh like normal it will fail. Try:</p>
<ul>
  <li>ssh HOST_CONNECTION -p 2222</li>
</ul>

<p>Now update your SSH config to specify the new port so you don’t have to remember to do it</p>

<h3>ACL</h3>
<p>You may want to configure and maintain firewalls to control incoming and outgoing network traffic. This helps to block unauthorized access and protect against various network-based attacks.</p>
<p>Install the Uncomplicated Firewall</p>
<ul>
  <li>sudo apt install ufw</li>
  <li>sudo ufw allow 2222</li>
  <li>sudo ufw status</li>
</ul>
<p>To see ports your server is listening on perform:</p>
<ul>
  <li>sudo ss -tupln</li>
</ul>
<p>Don't recognize something? Block it!</p>


<h1>References</h1>
<p>Matthew Redmond (Oct 5th, 2023) - https://redmondo.notion.site/OSYS3030-Server-Hardening-2dd5c975107b40609569221c744db77f</p>
