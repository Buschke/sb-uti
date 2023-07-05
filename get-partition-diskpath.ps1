# Retrieve information about all partitions
$partitions = Get-Partition
Write-Host $partitions

# Loop through each partition and get the disk path
foreach ($partition in $partitions) {
    Write-Host $partition
    Write-Host "Partition $($partition.PartitionNumber)"
    Write-Host "  Disk Path: $($partition.DiskPath)"
    Write-Host "  Disk Number: $($partition.DiskNumber)"
    Write-Host "  Drive Letter: $($partition.DriveLetter)"
    Write-Host "  GptType: $($partition.GptType)"
    Write-Host "  IsActive: $($partition.IsActive)"
    $disk = Get-Disk -Partition $partition
    $diskPath = "\\.\PhysicalDrive$($disk.Number)"

    Write-Host "Partition $($partition.PartitionNumber)"
    Write-Host "  Disk Path: $diskPath"
    Write-Host
}

