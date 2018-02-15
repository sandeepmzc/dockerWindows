$NumArray = (5..250)
ForEach ($number in $numArray)
{
powershell.exe "docker run -dt --network=TransparentNet --ip 172.16.1.$number -h CONTAINER-demo-1-$number --name cont_demo-1-$number image_1 cmd"
$nextnumber = $number + 1
Start-Sleep -m 100
}
Echo "Docker Container details"
Echo "*************************"
Start-Sleep -m 10000
powershell.exe "docker inspect -f '{{.Config.Hostname}} {{ .NetworkSettings.Networks.TransparentNet.IPAddress }}' $(docker ps -aq)"
Read-Host " press any key to exit >> "
