import http from 'node:http';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const here = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(here, '..', 'build', 'web');
const port = Number.parseInt(process.env.PORT ?? '8080', 10);
const host = '127.0.0.1';

const types = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.png': 'image/png',
  '.svg': 'image/svg+xml',
  '.wasm': 'application/wasm',
};

const server = http.createServer((request, response) => {
  const url = new URL(request.url ?? '/', `http://${host}:${port}`);
  const pathname = url.pathname === '/' ? '/index.html' : url.pathname;
  const filePath = path.resolve(root, `.${decodeURIComponent(pathname)}`);

  if (!filePath.startsWith(root)) {
    response.writeHead(403);
    response.end('Forbidden');
    return;
  }

  fs.readFile(filePath, (error, data) => {
    if (error) {
      fs.readFile(path.join(root, 'index.html'), (fallbackError, fallback) => {
        if (fallbackError) {
          response.writeHead(404);
          response.end('Not found');
          return;
        }
        response.writeHead(200, { 'Content-Type': types['.html'] });
        response.end(fallback);
      });
      return;
    }

    response.writeHead(200, {
      'Content-Type': types[path.extname(filePath)] ?? 'application/octet-stream',
    });
    response.end(data);
  });
});

server.listen(port, host, () => {
  console.log(`Serving ${root} at http://${host}:${port}`);
});
