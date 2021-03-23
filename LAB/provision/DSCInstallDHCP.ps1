Configuration xDhcpsServerScope_NewScope
{
    Import-DscResource -ModuleName 'PSDscResources' -ModuleVersion '2.12.0.0'
    Import-DscResource -moduleName 'xDhcpServer'

    #Define NIC IP
    # $IP = Get-NetIPAddress -InterfaceAlias "Ethernet 2" | Where-Object {$_.IPAddress -notlike "*:*" } | select -ExpandProperty IPAddress

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
            DnsName = 'lab-dc1.party.hard'
            IPAddress = '192.168.11.2'
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
        
        # Setting scope gateway
        DhcpScopeOptionValue 'ScopeOptionGateway'
        {
            OptionId      = 3
            Value         = '192.168.11.2'
            ScopeId       = '192.168.11.0'
            VendorClass   = ''
            UserClass     = ''
            AddressFamily = 'IPv4'
        }

        # Setting scope DNS servers
        DhcpScopeOptionValue 'ScopeOptionDNS'
        {
            OptionId      = 6
            Value         = @('192.168.11.2')
            ScopeId       = '192.168.11.0'
            VendorClass   = ''
            UserClass     = ''
            AddressFamily = 'IPv4'
        }

        # Setting scope DNS domain name
        DhcpScopeOptionValue 'ScopeOptionDNSDomainName'
        {
            OptionId      = 15
            Value         = 'party.hard'
            ScopeId       = '192.168.11.0'
            VendorClass   = ''
            UserClass     = ''
            AddressFamily = 'IPv4'
        }
    }
}

xDhcpsServerScope_NewScope
Start-DscConfiguration -Path .\xDhcpsServerScope_NewScope -Force -Wait -Verbose