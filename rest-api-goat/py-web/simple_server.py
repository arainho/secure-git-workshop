import http.server
import socketserver

HOST, PORT = "0.0.0.0", 9999
address = (HOST, PORT)

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(address, Handler) as httpd:
    print (f"Serving at {HOST} on port {PORT}.")
    httpd.serve_forever()
