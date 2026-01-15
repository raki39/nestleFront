#!/bin/sh
set -e

# Replace runtime config placeholder with actual environment variable
if [ -f /app/public/runtime-config.js ]; then
  sed -i "s|__NEXT_PUBLIC_API_URL__|${NEXT_PUBLIC_API_URL:-http://localhost:8000}|g" /app/public/runtime-config.js
  echo "✅ Runtime config updated: NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL:-http://localhost:8000}"
fi

# Start Next.js
exec node server.js

