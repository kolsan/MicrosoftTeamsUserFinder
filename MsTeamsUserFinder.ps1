#Powershell
$allteams = get-team
$LogFile = "TeamsLog.txt"


$linea = "$(Get-Date) - start"
write-host $linea
Add-Content -path $LogFile -value $linea


foreach($team in $allteams)
 { 
        $linea = $team.DisplayName +","+ $team.GroupId
        write-host "Team ID to Search-->"  $linea
        $linea = "Team ID to Search-->" + $team.DisplayName +","+ $team.GroupId
        Add-Content -path $LogFile -value $linea
        $users = get-teamuser -GroupId $team.GroupId
        $GroupFound = $true
        $UserFound = $false
        $UserDomainFound = $false

        foreach($UserList1 in $users)
            { 
                #Looking if any user with the domain is in the Tema
                if ($UserList1.User -like '*domain.com')
                {$UserDomainFound = $true}
            }

        if ($UserDomainFound)
        {
                    foreach($UserList2 in $users)
                        { 
                            
                            
                            
                        
                            
                                if ($GroupFound)
                                    {
                                        
                                        
                                        write-host "FOUND->>>>"
                                        $linea = "________________________________________________________"
                                        Add-Content -path $LogFile -value $linea
                                    }
                                    if ($UserList2.User -like 'user@domain.com')
                                        {$linea = "     "+ $UserList2.User +","+ $UserList2.UserId +","+ $UserList2. Name +","+ $UserList2.Role + ",**************"
                                        $UserFound = $true
                                    } 
                                    else
                                    { $linea = "     "+ $UserList2.User +","+ $UserList2.UserId +","+ $UserList2. Name +","+ $UserList2.Role      }
                            
                                write-host $linea
                                Add-Content -path $LogFile -value $linea
                                $GroupFound = $false

                            
                        }

                        if (-not $UserFound -and $UserDomainFound)
                                    {
                                    
                                        $linea = "********* Group with people from domain but with no the user into it "
                                        Add-Content -path $LogFile -value $linea
                                        $linea = "________________________________________________________"
                                        Add-Content -path $LogFile -value $linea
                                        $UserDomainFound = $false
                                        
                                        
                                    }

                
        }
 }    
