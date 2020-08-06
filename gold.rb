p /a\db/ === "a3b"
p /a\db/ === "a3bd"
p /a(bc)*d/ === "abcbcd"
p /a(bc){2,4}d/ === "abcbcbcbcd"

%r|(http://www(\.)(.*)/)| =~ "http://www.xyz.org/"
%r|(http://www(\.)(.*)/)| =~ "http://www.abc.efd/"
p $0
p $1
p $2
p $3
p $4

p %r|(http://www(\.)(.*)/)| === "http://www.xyz./"

p /ruby/ === "RUBY"
p /ruby/i === "RUBY"
p /a.*b/ === "a\nb"
p /a.*b/m === "a\nb"

p `date +%Y/%m/%d`
p `date /T`