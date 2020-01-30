$xml = [xml](Get-Content ./shinohayu.kml)
$obj = @()
#$colum = @{}
$xml.kml.Document.Folder | % {
    $folderName = $_.name
    $_.Placemark | %{
        $colum = (@{} | Select-Object folderName, name, description, originalSrc, realSrc, coordinates, status)
        $colum.folderName = $folderName
        $colum.name = $_.name
        $colum.description = [string]$_.description
        $colum.originalSrc = "None"
        $colum.realSrc = "None"
        $colum.coordinates = $_.Point.coordinates.trim()
        $colum.status = "done"    
        $obj += $colum
    }
}
$obj | Export-Csv "shinohayu.csv" -Encoding Default

#$$xml.kml.Document.Folder | % {}.Placemark.ExtendedData