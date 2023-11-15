<h1>Squid Server</h1>
<p>Squid is an open-source proxy server that is often used for caching web content to improve performance and reduce bandwidth usage on our server.</p>
<h3>How to Install Squid</h3>
<ul>
  <li>sudo apt install squid</li>
</ul>
<h3>Configurations</h3>
<p>Most of the things that need to be configured is in the /etc/squid/squid.conf default file. I suggest making a copy of the original file so in case something is deleted mistakenly, you will have a copy of the file untouched. Also change the permissions on the new file, so not just anyone can make configurations to it.</p>
<ul>
  <li>cp /etc/squid/squid.conf /etc/squid/squid.conf</li>
  <li>sudo chmod 700 /etc/squid/squid.conf</li>
</ul>
<p>Change the default TCP port to the port of your choice, for our server we used port 8888.</p>
<p>Set the hostname under the directive “visible_hostname”</p>
<ul>
  <li>visible_hostname martin07</li>
</ul>
<p>Find the directive cache_dir. Here you will be able to configure the use of an on-disk cache. Uncomment cache_dir</p>
<ul>
  <li>#cache_dir ufs /var/spool/squid 100 16 256</li>
</ul>
<p>We will now create an ACL. You can do this is you want the Squid Poxy server to be available only to certain users within an IP. Our ACL was the network 10.0.0.0/24. Add the following to the bottom of the ACL section of the config file</p>
<ul>
  <li>Acl fortytwo_network src 10.0.0.0/24</li>
</ul>
<p>Add the following to the top of the http_access section of the config file</p>
<ul>
  <li>visible_hostname martin07</li>
</ul>
<p>Save the changes to the file and restart the squid service</p>
<ul>
  <li>visible_hostname martin07</li>
</ul>
<h3>Additional Configurations for My Server</h3>
<p>In addition to the base configuration. I also configured squid as a transparent proxy server. To do this create the following rule:</p>
<ul>
  <li>iptables -t nat -I PREROUTING -p tcp -s 10.0.0.0/24 --dport 80 -j REDIRECT --to-port 8888</li>
</ul>
<p>I wanted my end users to be blocked from http://neverssl.com/ to test setting up a deny ACL
In the file /etc/squid/denied-sites.squid, I added the http://neverssl.com/ site. I then added the line inside the config file</p>
<ul>
  <li>acl deniedsites dstdomain “/etc/squid/denied-sites.squid”</li>
</ul>
