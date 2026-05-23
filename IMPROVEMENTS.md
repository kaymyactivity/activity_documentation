## Anand - Suggestions

1. secrets and add `env/*.env` to `.gitignore` - Look for alternative approach
2. Schedulers are running more often than expected—identify which ones are active and confirm whether that behavior is required
3. Implement a global error handler and `express-async-handler`
4. Disable `sequelize.sync()` in production; use migrations instead with logging
5. Firebase—document why it is used and what kinds of event notifications it sends
6. Clarify the purpose of `fcmServiceAccountKey.json` and `dcmServiceAccountKeyDev.json`
7. Improve loggers more - created a skelton. Need to implement little deeper for better debug