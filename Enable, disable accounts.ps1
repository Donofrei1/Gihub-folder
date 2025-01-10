

# Get all users in the domain
$allUsers = Get-ADUser -Filter *

# Display the user information


$allUsers | Select-Object Name, SamAccountName, Userlogonname, disabled 





# find the user with the username "Alida"


Get-ADUser -Filter {Name -like "*Alida*"} -Properties Name



 # Enable the disabled accounts 
 
 $disabledaccounts = Get-ADUser -filter {enabled -eq $false} 

 #Enamble disabled user accounts
 foreach ($user in $disabledaccounts) {
 Enable-ADAccount -Identity $user
 Write-Output "Enable account: $($user.SamAccountName)"
 }

 Write-Output "Disabled accounts are now enabled"


 #find deleted user accounts 

 $deletedusers = Get-ADObject -filter {(objectclass -eq 'user') -and (deleted -eq $true )} -IncludeDeletedObjects
 $deletedusers | Select-Object name, samaccountname,whendeleted



 # Get the user object
 $user = Get-ADUser -Identity "alida"

 # Set the user to require a password change at next logon
 Set-ADUser -Identity $user -ForceChangePassword $true

 # Optional: Display a confirmation message
 Write-Host "User 'alida' has been configured to change password at next logon."





# Get all deleted user accounts
$deletedUsers = Get-ADObject -Filter {ObjectClass -eq 'user' -and IsDeleted -eq $true} -IncludeDeletedObjects

# Recover each deleted user account
foreach ($user in $deletedUsers) {
    Restore-ADObject -Identity $user.DistinguishedName
    Write-Output "Account restored for $($user.SamAccountName)"
}

Write-Output "All deleted accounts were restored."

}