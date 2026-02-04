import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import { createRequestHandler } from '@remix-run/express';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const BUILD_DIR = path.join(__dirname, 'build');

const app = express();

// Serve static assets
app.use('/build', express.static(path.join(BUILD_DIR, 'client')));

// SSR handler
app.all(
  '*',
  createRequestHandler({
    build: await import('./build/server/index.js'),
    mode: process.env.NODE_ENV,
  })
);

const port = process.env.PORT || 5173;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
