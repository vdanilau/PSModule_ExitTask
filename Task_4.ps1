#4.	Проверить на удалённых компьютерах состояние одной службы (имя определить самостоятельно). 
#Перечень имен компьютеров должен браться из текстового файла. 
#Вывод организовать следующим образом: Имя компьютера – статус (если служба запущена, то строка зелёная, иначе красная)
$cred=Get-Credential administrator
$VM=Get-Content  F:\VM.txt
foreach ($compname in $VM) {
$serv=Invoke-Command -ComputerName $compname -Credential $cred -ScriptBlock {Get-Service -Name Wecsvc} #после -Name указываем интересующую службу
if ($serv.status -eq "running"){
    Write-Host "$compname -" -ForegroundColor Green -NoNewline
    Write-Host "$serv.name -" -ForegroundColor Green -NoNewline
    Write-Host $serv.Status -ForegroundColor Green}
else {
    Write-Host "$compname -" -ForegroundColor Red -NoNewline
    Write-Host "$serv.name -" -ForegroundColor Red -NoNewline
    Write-Host $serv.Status -ForegroundColor Red
    } 
}

#Wecsvc -служба будет остановлена
#dhcp -служба будет работать