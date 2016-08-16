contents = File.read(Rails.root.join("../admin.txt")).strip

ADMIN_USER = contents.split(":").first
ADMIN_PASSWORD = contents.split(":").last