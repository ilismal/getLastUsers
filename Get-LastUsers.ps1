$firstDayOfMonth = Get-Date -Day 1
1 .. 18 | ForEach-Object {
    $rangeEnd = $firstDayOfMonth.AddMonths(-$_)
    $rangeStart = $rangeEnd.AddMonths(-1)
    $CSVfilename = "createdusers_" + $rangeStart.Month + "_" + $rangeStart.Year + ".csv"
    Get-ADUser -Filter {(whenCreated -gt $rangeStart) -and (whencreated -lt $rangeEnd)} -Properties * | Select-Object samaccountname,name,mail,manager,department,whencreated | Export-Csv -Path $CSVfilename
}
