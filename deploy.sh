#!/bin/bash
# deploy.sh - Deploy fizx.uk to your server
set -e

SERVER="root@88.218.206.187"
REMOTE_PATH="/var/www/fizx.uk"
SSH_PORT="2121"
LOCAL_DIST="./build"
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

export PATH="/Users/x22/.nvm/versions/node/v22.20.0/bin:$PATH"

echo "📦 Building fizx.uk..."
npm ci --silent
rm -rf .svelte-kit build
npm run build

[ ! -f "$LOCAL_DIST/404.html" ] && echo "❌ build/404.html missing" && exit 1
echo "✅ Build done"

echo "🚀 Deploying..."
rsync -avz --delete -e "ssh -p $SSH_PORT" \
  --exclude='.DS_Store' --exclude='*.log' --exclude='.git' \
  "$LOCAL_DIST/" "$SERVER:$REMOTE_PATH/"

ssh -p "$SSH_PORT" "$SERVER" "
  chown -R www-data:www-data $REMOTE_PATH
  CONF=\$(ls /etc/nginx/sites-enabled/fizx.uk 2>/dev/null | head -1)
  if [ -n \"\$CONF\" ]; then
    sudo sed -i 's|try_files \$uri \$uri/ =404;|try_files \$uri \$uri/ /404.html;|g' \"\$CONF\"
    sudo nginx -t && sudo systemctl reload nginx && echo 'Nginx reloaded'
  fi
"
echo "✅ https://fizx.uk"
