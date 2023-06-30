if ($args.length -eq 0) {
    echo "Missing file with list of servers"
    exit 1
}

$alive = New-Object System.Collections.Generic.List[System.Object]
$notAlive = New-Object System.Collections.Generic.List[System.Object]

foreach ($line in Get-Content $args[0]) {
    echo "Checking: $line"
    $p = (ping $line)
    $check = ($p[2] -split " ")[0]
    if ($check -eq "Reply") {
        $alive.Add($line)
    } else {
        $notAlive.add($line)
    }
}
echo " "
echo "Alive"
echo "_____________________________________________________________"
echo " "
foreach ($aliveServer in $alive) {
    echo $aliveServer
}
echo "_____________________________________________________________"
echo " "
echo "Dead"
echo "_____________________________________________________________"
echo " "
foreach ($deadServer in $notAlive) {
    echo $deadServer
}
echo "_____________________________________________________________"
echo " "
