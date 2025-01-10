


   # Retrieve all users and their departments
   $users = Get-AdUser -Filter * -Properties DisplayName, Department

   # Initialize an array to hold user information
   $userInfo = @()

   # Loop through each user and store their name and department in the array
   foreach ($user in $users) {
       $userInfo += [PSCustomObject]@{
               DisplayName = $user.DisplayName
                       Department  = $user.Department
                           }
                           }

                           # Sort users by department
                           $sortedUsers = $userInfo | Sort-Object Department

                           # Display the sorted user information in a table format
                           $sortedUsers | Format-Table -AutoSize






# Calculate the threshold date for 3 years ago
$thresholdDate = (Get-Date).AddYears(-3)

# Retrieve all users with their creation date and department
$users = Get-ADUser -Filter * -Properties DisplayName, WhenCreated, department

# Filter users whose accounts were created before the threshold date
$oldAccounts = $users | Where-Object { $_.WhenCreated -lt $thresholdDate }

# Randomly select 20 users from the old accounts
$randomUsers = $oldAccounts | Get-Random -Count 20

# Display the selected random users with their department in a table format
$randomUsers | Select-Object DisplayName, WhenCreated, department | Format-Table -AutoSize


              
# Display the selected random users with colored output
    $randomUsers | ForEach-Object {
    Write-Host "DisplayName: " -NoNewline
    Write-Host $_.DisplayName -ForegroundColor Red        Write-Host "`tDepartment: " -NoNewline
    Write-Host $_.Department -ForegroundColor Green        Write-Host
    }



