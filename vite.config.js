import { defineConfig, loadEnv } from 'vite';
import tailwindcss from '@tailwindcss/vite'
import path from 'path';

// Match ports in .ddev/config.yaml and config/vite.php
const HTTP_PORT = 3000;
const HTTPS_PORT = 3001;

export default defineConfig(({ command, mode }) => {
    const env = loadEnv(mode, process.cwd(), '');

    return {
        resolve:{
            alias: {
                '@': path.resolve(__dirname,'./'),
            },
        },
        plugins: [tailwindcss()],
        base: command === 'serve' ? '' : '/dist/',
        build: {
            manifest: true,
            outDir: '/web/dist/',
            rollupOptions: {
                input: {
                    app: 'src/app.js',
                }
            },
        },
        server: {
            // Special address that respond to all network requests
            host: '0.0.0.0',
            // Use a strict port because we have to hard code this in vite.php
            strictPort: true,
            // This is the port running "inside" the Web container
            // It's the same as container_port in .ddev/config.yaml
            port: HTTP_PORT,
            // Setting a specific origin ensures that fonts and images load
            // correctly. Assumes you're accessing the front-end over https.
            origin: env.PRIMARY_BASEURL + ':' + HTTPS_PORT,
            cors: {
                origin: /https?:\/\/([A-Za-z0-9\-\.]+)?(\.ddev\.site)(?::\d+)?$/,
            },
        },
    };
});
