# Import the Active Directory module
Import-Module ActiveDirectory

# Define the time range for the last 24 hours
$yesterday = (Get-Date).AddDays(-1)

# Get user accounts that expired within the last 24 hours
$expiredUsers = Get-ADUser -Filter {AccountExpirationDate -gt $yesterday -and AccountExpirationDate -le (Get-Date)} -Properties AccountExpirationDate

# Display the expired user accounts
$expiredUsers | Select-Object Name, SamAccountName, AccountExpirationDate
