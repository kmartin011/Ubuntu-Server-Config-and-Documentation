;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	example.com. root.example.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.example.com.
ns	IN	A	10.0.0.110
ns1	IN	CNAME	ns.example.com.
ns2	IN	CNAME	ns.example.com.
@	IN	A	10.0.0.100
port	IN	A	10.0.0.101
folio	IN	CNAME	port.example.com.
martin.folio IN	A	10.0.0.102
@	IN	AAAA	::1
ns	IN	A	10.0.0.1
