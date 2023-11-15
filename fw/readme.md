<h1>Firewall</h1>
<p>We will be using ufw for a firewall. Ufw is default firewall management tool for Linux. ufw is designed to be easy to use and is particularly well-suited for beginners who may not be familiar with the intricacies of iptables.</p>
<p>Ufw is initially disabled so we have to enable it:</p>
<ul>
  <li>sudo ufw enable</li>
</ul>
<p>To open a port:</p>
<ul>
  <li>sudo ufw allow 22</li>
</ul>
<p>To close an opened port</p>
<ul>
  <li>sudo ufw deny 22</li>
</ul>
<p>To disable ufw</p>
<ul>
  <li>sudo ufw disable</li>
</ul>

<h3>ufw Masquerading</h3>
<p>The rules are divided into two files: one containing rules to be run before the ufw command line rules and the other containing rules to be run thereafter.</p>
<p>First we need to enable packet forwarding inside the /etc/default/ufw</p>
<ul>
  <li>DEFAULT_FOWARD_POLICY=”ACCEPT”</li>
</ul>
<p>Then edit /etc/ufw/sysctl.conf and uncomment:</p>
<ul>
  <li>Net/ipv4/ip_foward=1</li>
</ul>
<p>Now add rules to the /etc/ufw/before.rules file. Be sure to add the COMMIT line. For each table a corresponding COMMIT statement is needed.</p>

![image](https://github.com/kmartin011/Server-Config-and-Documentation/assets/148782985/c45e5dcf-2641-49bc-9477-2df42c852400)

<p>To apply the changes:</p>
<ul>
  <li>sudo ufw disable && sudo ufw enable</li>
</ul>
