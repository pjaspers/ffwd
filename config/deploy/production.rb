# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server '10to1marleen.noip.me', user: 'admin', roles: %w{app db web}
