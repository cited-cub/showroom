param ($username, $password)
vagrant up --no-provision
vagrant plugin install vagrant-scp
vagrant scp ".vagrant\machines\elk\virtualbox\private_key" controller:elk.key
$env:REDHATUSERNAME=$username; $env:REDHATPASSWORD=$password; vagrant provision