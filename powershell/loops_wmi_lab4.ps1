$hardwaredescription = Get-ciminstance Win32_computersystem |
	where { $_.Description } | 
	select Description |
	format-list
$operatingsystem = Get-ciminstance Win32_operatingsystem |
	where { $_.Name -ne $null -or $_.Version } | 
	select Name, Version |
	format-list
$processor = Get-ciminstance Win32_processor | 
	where { $_.MaxClockSpeed -ne $null -or $_.NumberOfCores -ne $null -or $_.L1CacheSize -ne $null -or $_.L2CacheSize -ne $null -or $_.L3CacheSize } | 
	select MaxClockSpeed, NumberOfCores, L1CacheSize, L2CacheSize, L3CacheSize |
	format-list
$ram = Get-ciminstance Win32_physicalmemory | 
	where { $_.Manufacturer -ne $null -or $_.Description -ne $null -or $_.Capacity -ne $null -or $_.BankLabel -ne $null -or $_.DeviceLocator -ne $null -or $_.SMBIOSMemoryType } | 
	select Manufacturer, Description, Capacity, BankLabel, DeviceLocator, SMBIOSMemoryType |
	format-table
$hardwaredescription
$operatingsystem
$processor
$ram
$diskdrives = Get-CIMInstance CIM_diskdrive
  foreach ($disk in $diskdrives) {
      $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
      foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                     new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                               Location=$partition.deviceid
                                                               Drive=$logicaldisk.deviceid
                                                               "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                               }
           }
      }
  }
$networkadapter = get-ciminstance -class win32_networkadapterconfiguration -filter ipenabled=true |
	where { $_.Description -ne $null -or $_.Index -ne $null -or $_.IPAddress -ne $null -or $_.IPSubnet -ne $null -or $_.DNSDomain -ne $null -or $_.DNSServerSearchOrder -ne $null } |
	select Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder |
	format-table
$networkadapter
$videocontroller = Get-ciminstance Win32_videocontroller |
	where { $_MonitorManufacturer -ne $null -or $_.Description -ne $null -or $_.CurrentVerticalResolution -ne $null -or $_.CurrentHorizontalResolution } | 
	select MonitorManufacturer, Description, CurrentHorizontalResolution, CurrentVerticalResolution |
	format-list
$videocontroller