;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	newzone.com. root.newzone.com. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.newzone.com.
@	IN	A	127.0.0.1
@	IN	AAAA	::1
ns	IN	A	10.0.0.1
*	IN	A	10.0.0.1
verification IN TXT	"ccLcw6J4v7SGdM2ZhzHBoyFdbVvKh6oGQLQQSEzC4vivBUz35Qz6KVUi6PGSAPJfVH7bNEMpACrKk"
@	IN	TXT	"v=spf1 include:_spf.google.com ~all"
