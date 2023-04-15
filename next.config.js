/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  distDir: 'dist',
  reactStrictMode: true,
}

module.exports = {
  images: {
    unoptimized: true,
  },
}

