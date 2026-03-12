import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default ({command}) => ({
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
});