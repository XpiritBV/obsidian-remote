$vaultPath = "C:\Users\RobBos\Code\Repos\GitHub\XpiritBV\portfolio"

# comment for faster reruns
docker build -t obsidian-remote .

docker run --rm -it `
  -v ${vaultPath}:/vaults `
  -v ${vaultPath}:/config `
  -p 8080:8080 `
  obsidian-remote #vault3

# after returning , get the container id so we can kill it
$containerID = docker ps -f "ancestor=obsidian-remote" --format "{{.ID}}" 2>$null

# ask it the container should be killed
$shouldKill = Read-Host "Do you want to kill the container? (y/n)"
if ($shouldKill -eq "y") {
    Write-Host "Killing container with ID ${containerID}"
    # kill the container
    docker kill $containerID
}
else {
    Write-Host "Stopping script, container is still running"
}