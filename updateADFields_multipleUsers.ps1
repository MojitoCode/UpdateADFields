#ask user for their OU
$userOU = read-host "Enter your OU: "

#ask user for DC
$userDC = read-host "Enter your DC: "

#ask user for their top-level domain (TLD - ex. "com", "local")
$userTLD = read-host "Enter your TLD: "

$selectedOU = "OU=$userOU,DC=$userDC,DC=$userTLD"

#get all user accounts from the specified ou
$userList = get-aduser -searchbase $selectedOU -filter *

foreach $user in $userList {
  set-aduser $user -[fieldName] "[newValue]"
}
