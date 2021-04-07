get-ciminstance -class win32_networkadapterconfiguration -filter ipenabled=true |
where { $_.Description -ne $null -or $_.Index -ne $null -or $_.IPAddress -ne $null -or $_.IPSubnet -ne $null -or $_.DNSDomain -ne $null -or $_.DNSServerSearchOrder -ne $null } |
select Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder |
format-table