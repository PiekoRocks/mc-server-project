output "minecraft_public_ip" {
  description = "Public IP address of the Minecraft server"
  value       = aws_instance.minecraft_server.public_ip
}

output "minecraft_server_address" {
  description = "Minecraft server connection address"
  value       = "${aws_instance.minecraft_server.public_ip}:25565"
}
