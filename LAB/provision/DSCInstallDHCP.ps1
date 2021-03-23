Configuration xDhcpsServerScope_NewScope
{
    Import-DscResource -ModuleName 'PSDscResources' -ModuleVersion '2.12.0.0'
    Import-DscResource -moduleName 'xDhcpServer'

    #Define NIC IP
    $IP = Get-NetIPAddress -InterfaceAlias "Ethernet 2" | Where-Object {$_.IPAddress -notlike "*:*" } | select -ExpandProperty IPAddress

    Node 'localhost'
    {
        WindowsFeature 'RSAT-DHCP'
        {
            Name   = 'RSAT-DHCP'
            Ensure = 'Present'
        }

        WindowsFeature 'DHCP'
        {
            Name   = 'DHCP'
            Ensure = 'Present'
        }
                
        xDhcpServerAuthorization 'RemoteServerActivation'
        {
            IsSingleInstance = 'Yes'
            Ensure = 'Present'
            DnsName = $env:COMPUTERNAME + '.party.hard'
            IPAddress = $IP
        }       
                  
        
        xDhcpServerScope 'Scope'
        {
            Ensure = 'Present'
            ScopeId = '192.168.11.0'
            IPStartRange = '192.168.11.10'
            IPEndRange = '192.168.11.254'
            Name = '11.0/24'
            SubnetMask = '255.255.255.0'
            LeaseDuration = ((New-TimeSpan -Hours 8 ).ToString())
            State = 'Active'
            AddressFamily = 'IPv4'
        }     
        
        # xDhcpServerOption 'Option'
        #{
        #    Ensure = 'Present'
        #    ScopeID = '192.168.11.0'
        #    DnsDomain = 'party.hard'
        #    DnsServerIPAddress = '192.168.11.2'
        #    AddressFamily = 'IPv4'
        #    Router = '192.168.11.1'
        #}
    }
}

xDhcpsServerScope_NewScope
Start-DscConfiguration -Path .\xDhcpsServerScope_NewScope -Force -Wait -Verbose