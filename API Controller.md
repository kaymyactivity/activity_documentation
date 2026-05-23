# API Controller Reference

This document maps HTTP endpoints to their Express route files and handler controllers. All listed paths are served under the **`/api`** prefix (see `src/routes/index.route.js` and `src/routes/service.route.js`).

| Mount        | Route file              | Primary controllers |
|-------------|-------------------------|---------------------|
| `/api/auth` | `src/routes/auth.routes.js` | `auth.controller` |
| `/api/app`  | `src/routes/appconfig.routes.js` | `appConfig.controller` |
| `/api/user` | `src/routes/user.route.js` | `user`, `event`, `challenges`, `teams` |
| `/api/admin`| `src/routes/admin.routes.js` | `admin.controller` |
| `/api/activity` | `src/routes/activity.route.js` | `activity.controller` |
| `/api/rewards`  | `src/routes/rewards.route.js` | `rewards.controller` |

Unless noted, **app** routes use the `protect` middleware from `src/middleware/appAuth.js`. **Admin** routes use `adminProtect` from `src/middleware/adminAuth.js` where indicated.

---

## `auth.controller.js` — `/api/auth`

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/auth/login` | `login` | — |
| POST | `/api/auth/verifyOtp` | `verifyOTP` | — |
| POST | `/api/auth/resendOtp` | `resendOTP` | — |
| POST | `/api/auth/logout` | `logout` | `protect` |

---

## `appConfig.controller.js` — `/api/app`

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/app/appConfig` | `getAppConfig` | — |

---

## `activity.controller.js` — `/api/activity`

| Method | Path | Handler |
|--------|------|---------|
| POST | `/api/activity/saveActivity` | `saveActivity` |
| POST | `/api/activity/updateActivityNotes` | `updateActivityNotes` |
| POST | `/api/activity/updateWaterConsumed` | `updateWaterConsumed` |
| POST | `/api/activity/donatePassiveSteps` | `donatePassiveSteps` |
| POST | `/api/activity/userStepsSync` | `userStepsSync` |
| POST | `/api/activity/activityReports` | `activityReports` |
| POST | `/api/activity/uploadActivityImage` | `uploadActivityImage` |
| DELETE | `/api/activity/deleteActivityImage/:id` | `deleteActivityImage` |
| GET | `/api/activity/getActivityDetails/:id` | `getActivityDetails` |

---

## `rewards.controller.js` — `/api/rewards`

| Method | Path | Handler |
|--------|------|---------|
| GET | `/api/rewards/getAllOffersList` | `fetchAllOffersList` |
| GET | `/api/rewards/getAllRewardTransationHistory` | `fetchAllRewardTransationHistory` |
| POST | `/api/rewards/claimCoins` | `claimRewardCoins` |
| POST | `/api/rewards/claimOffer` | `redeemOffer` |
| GET | `/api/rewards/getAllUnclaimedCoinsList` | `fetchUnclaimedCoins` |
| GET | `/api/rewards/getAllUserClaimedOfferList` | `fetchUserClaimedOffers` |
| GET | `/api/rewards/getUserRewardsInfo` | `getUserRewardsInfo` |
| GET | `/api/rewards/getAllSubcriptionPlanList` | `fetchSubscriptionPlans` |
| POST | `/api/rewards/registerUserSubscription` | `createUserSubscription` |
| POST | `/api/rewards/updateUserSubscriptionPaymentStatus` | `updateSubscriptionPaymentStatus` |
| POST | `/api/rewards/cancelUserSubscription` | `disableUserSubscription` |
| POST | `/api/rewards/webhook` | `webhook` |
| POST | `/api/rewards/updateTransactionList` | `updateTransactionList` |

---

## `user.controller.js` — `/api/user`

These handlers live on `user.route.js` together with event, challenge, and team routes.

| Method | Path | Handler | Auth notes |
|--------|------|---------|------------|
| POST | `/api/user/updateProfile` | `updateProfile` | `protect` |
| POST | `/api/user/updateProfileImage` | `updateProfileImage` | `protect` + S3 upload middleware |
| POST | `/api/user/updateOnboardingDetails` | `updateOnboardingDetails` | `protect` |
| GET | `/api/user/dashboard` | `getDashboard` | `protect` |
| POST | `/api/user/dashboard` | `dashboard` | `protect` |
| POST | `/api/user/updateSettings` | `updateSettings` | `protect` |
| POST | `/api/user/updateGoalSetting` | `updateGoalSetting` | `protect` |
| POST | `/api/user/deactivateUser` | `deactivateUser` | `protect` |
| GET | `/api/user/getAllFaqList` | `getFAQsquestion` | `protect` |
| POST | `/api/user/createUserFAQsquestion` | `createFaqsQuestion` | — |
| POST | `/api/user/updateUserFAQsquestion` | `updateFaqsQuestion` | — |
| DELETE | `/api/user/deleteUserFAQsquestion/:id` | `deleteFaqsQuestion` | — |
| GET | `/api/user/getFaqContent/:id` | `getFaqContent` | — |
| POST | `/api/user/updateDeviceToken` | `updateDeviceToken` | `protect` |
| GET | `/api/user/getCauseOverViewDetails/:id` | `getCauseOverViewDetails` | `protect` |

---

## `event.controller.js` — `/api/user` (events)

| Method | Path | Handler |
|--------|------|---------|
| GET | `/api/user/getAllEventsList` | `getAllEventsList` |
| POST | `/api/user/event_register` | `eventRegister` |
| GET | `/api/user/myEvents` | `myEvents` |

---

## `challenges.controller.js` — `/api/user` (challenges)

| Method | Path | Handler |
|--------|------|---------|
| GET | `/api/user/getAllChallengesList` | `getAllChallengesList` |
| GET | `/api/user/getMyChallengesList` | `getMyChallengesList` |
| POST | `/api/user/registerChallenge` | `registerChallenge` |
| POST | `/api/user/updateChallenegePaymentStatus` | `updateChallenegePaymentStatus` |
| POST | `/api/user/registerExclusiveChallenge` | `registerExclusiveChallenge` |
| POST | `/api/user/joinExclusiveChallenge` | `joinExclusiveChallenge` |
| POST | `/api/user/getChallengesLeaderboard` | `getChallengesLeaderboard` |
| GET | `/api/user/getChallengesLeaderboardUserList/:id` | `getChallengesLeaderboardUserList` |
| GET | `/api/user/getUserDetailsById/:id` | `getUserDetailsById` |
| GET | `/api/user/paymentStatus` | `paymentStatus` |
| GET | `/api/user/challenge_details/:id` | `getChallengeDetails` |

---

## `teams.controller.js` — `/api/user` (teams, posts, notifications)

| Method | Path | Handler |
|--------|------|---------|
| POST | `/api/user/createTeam` | `createTeam` |
| POST | `/api/user/editTeam` | `editTeam` |
| GET | `/api/user/getMyTeamsList` | `getMyTeamsList` |
| GET | `/api/user/getAllTeamList` | `getAllTeamList` |
| POST | `/api/user/joinRequest` | `joinRequest` |
| POST | `/api/user/getAllTeamMemberList` | `getAllTeamMemberList` |
| POST | `/api/user/approveRequest` | `approveRequest` |
| POST | `/api/user/removeFromTeam` | `removeFromTeam` |
| POST | `/api/user/cancelRequest` | `cancelRequest` |
| POST | `/api/user/makeAdmin` | `makeAdmin` |
| POST | `/api/user/leaveTeam` | `leaveTeam` |
| POST | `/api/user/dismissFromAdmin` | `dismissFromAdmin` |
| GET | `/api/user/getTeamLeaderBoard/:id` | `getTeamLeaderBoard` |
| GET | `/api/user/getTeamLeaderBoardUserList/:id` | `getTeamLeaderBoardUserList` |
| GET | `/api/user/getAllTeamPost/:id` | `getTeamPost` |
| POST | `/api/user/updateClaps` | `teamUpdateClaps` |
| POST | `/api/user/addComments` | `teamAddComments` |
| GET | `/api/user/getAllPostComments/:id` | `teamAllPostComments` |
| GET | `/api/user/getPostDetailsById/:id` | `teamPostDetails` |
| GET | `/api/user/getAllTeamPostClaps/:id` | `getAllTeamPostClaps` |
| GET | `/api/user/getUserPost` | `getUserPost` |
| GET | `/api/user/getUserNotification` | `getUserNotification` |

---

## `admin.controller.js` — `/api/admin`

Admin surface area is large; routes are grouped by functional area as in `src/routes/admin.routes.js`. All paths are prefixed with **`/api/admin`**. Handlers are exported from `src/controllers/admin/admin.controller.js`.

### Authentication and roles

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/login` | `login` | — |
| POST | `/api/admin/addRole` | `addRole` | `adminProtect` |
| GET | `/api/admin/getRole` | `getRoles` | `adminProtect` |
| PUT | `/api/admin/updateRole/:id` | `updateRole` | `adminProtect` |
| DELETE | `/api/admin/deleteRole/:id` | `deleteRole` | `adminProtect` |
| POST | `/api/admin/setRolePermission` | `updateRolePermission` | `adminProtect` |
| GET | `/api/admin/getRolePermissions/:id` | `getRolePermissions` | `adminProtect` |
| GET | `/api/admin/menuList` | `menuList` | `adminProtect` |
| GET | `/api/admin/getRolesId` | `getRolesId` | `adminProtect` |

### Admin users

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/createUser` | `createUser` | `adminProtect` |
| GET | `/api/admin/getUsers` | `getAdminUsers` | `adminProtect` |
| PUT | `/api/admin/updateUser/:id` | `updateUser` | `adminProtect` |
| DELETE | `/api/admin/deleteUser/:id` | `deleteUser` | `adminProtect` |
| PUT | `/api/admin/changePassword/:id` | `changePassword` | `adminProtect` |
| GET | `/api/admin/getAdminProfile/:id` | `getAdminProfile` | `adminProtect` |
| POST | `/api/admin/updateProfile` | `updateProfile` | `adminProtect` (multipart) |
| POST | `/api/admin/updatePassword` | `updatePassword` | `adminProtect` |

### App users and reporting

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| GET | `/api/admin/appUsers` | `getAllAppUsers` | `adminProtect` |
| GET | `/api/admin/appUserDetails/:id` | `appUserDetails` | `adminProtect` |
| GET | `/api/admin/exportAppUserList` | `exportAppUserList` | `adminProtect` |
| GET | `/api/admin/usersReport` | `usersReport` | `adminProtect` |
| GET | `/api/admin/exportUsersReport` | `exportUsersReport` | `adminProtect` |

### Cron / scheduled jobs (mixed auth)

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| GET | `/api/admin/dailyUserEmailReport` | `dailyUserEmailReport` | — |
| GET | `/api/admin/sendRegistrationReminder` | `sendRegistrationReminder` | — |
| POST | `/api/admin/no_activity_notification` | `no_activity_notification` | — |
| POST | `/api/admin/sendMonthlyLeaderboardWinnerNotification` | `sendMonthlyLeaderboardWinnerNotification` | — |
| POST | `/api/admin/yesterdayTopDonorNotificationAndPost` | `yesterdayTopDonorNotificationAndPost` | — |
| POST | `/api/admin/scheduleNotification` | `scheduleNotification` | — |

### Events and categories

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/addEventCategory` | `createEventCategory` | `adminProtect` |
| GET | `/api/admin/getEventCategory` | `getEventCategory` | `adminProtect` |
| PUT | `/api/admin/updateEventCategory/:id` | `updateEventCategory` | `adminProtect` |
| DELETE | `/api/admin/deleteEventCategory/:id` | `deleteEventCategory` | `adminProtect` |
| POST | `/api/admin/createEvent` | `createEvent` | `adminProtect` (multipart) |
| GET | `/api/admin/getAllEvents` | `getAllEvents` | `adminProtect` |
| PUT | `/api/admin/updateEvent/:id` | `updateEvent` | `adminProtect` (multipart) |
| DELETE | `/api/admin/deleteEvent/:id` | `deleteEvent` | `adminProtect` |
| GET | `/api/admin/getEventMemberList/:id` | `getEventMemberList` | `adminProtect` |
| GET | `/api/admin/exportEventMemberList/:id` | `exportEventMemberList` | `adminProtect` |

### Challenges, teams, ranks

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| GET | `/api/admin/getChallenge` | `getChallenge` | `adminProtect` |
| POST | `/api/admin/createChallenge` | `createChallenge` | `adminProtect` (multipart) |
| PUT | `/api/admin/updateChallenge/:id` | `updateChallenge` | `adminProtect` (multipart) |
| DELETE | `/api/admin/deleteChallenge/:id` | `deleteChallenge` | `adminProtect` |
| GET | `/api/admin/getTeamChallengeList` | `getTeamChallengeList` | `adminProtect` |
| GET | `/api/admin/getOngoingChallengeList` | `getOngoingChallengeList` | `adminProtect` |
| GET | `/api/admin/exportOngoingChallengeList` | `exportOngoingChallengeList` | `adminProtect` |
| GET | `/api/admin/exportCompletedChallengesList` | `exportCompletedChallengesList` | `adminProtect` |
| GET | `/api/admin/getChallengesLeaderboard/:id` | `fetchChallengesLeaderboard` | `adminProtect` |
| GET | `/api/admin/getCompletedChallengesList` | `getCompletedChallengesList` | `adminProtect` |
| GET | `/api/admin/getRegisteredExclusiveChallengeList` | `getRegisteredExclusiveChallengeList` | `adminProtect` |
| PUT | `/api/admin/editRegisteredExclusiveChallengeList/:id` | `editRegisteredExclusiveChallengeList` | `adminProtect` |
| GET | `/api/admin/getChallenegsRankList/:id` | `getChallenegsRankList` | — |
| GET | `/api/admin/exportChallenegsMemberList/:id` | `exportChallenegsMemberList` | `adminProtect` |
| GET | `/api/admin/getTeamsList` | `getTeamsList` | `adminProtect` |
| GET | `/api/admin/getTeamMemberList/:id` | `getTeamMemberList` | `adminProtect` |
| GET | `/api/admin/view_activities/:id` | `view_activities` | `adminProtect` |

### Geography

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| GET | `/api/admin/state` | `getState` | `adminProtect` |
| GET | `/api/admin/city/:id` | `getCity` | `adminProtect` |
| GET | `/api/admin/getCityId` | `getCityId` | `adminProtect` |

### Subscriptions

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| GET | `/api/admin/getSubscriptionPlanList` | `fetchSubscriptionPlan` | `adminProtect` |
| POST | `/api/admin/createSubscriptionPlan` | `createSubscriptionPlan` | `adminProtect` |
| PUT | `/api/admin/editSubscriptionPlan/:id` | `updateSubscriptionPlan` | `adminProtect` |
| DELETE | `/api/admin/deleteSubscriptionPlan/:id` | `deleteSubscriptionPlan` | `adminProtect` |
| GET | `/api/admin/userSubscriptionList` | `userSubscriptionList` | `adminProtect` |
| GET | `/api/admin/getSubscriptionId` | `getSubscriptionId` | `adminProtect` |
| GET | `/api/admin/exportUserSubscriptionList` | `exportUserSubscriptionList` | `adminProtect` |
| POST | `/api/admin/cancelSubscription` | `cancelSubscription` | `adminProtect` |
| GET | `/api/admin/userSubscriptionHistory` | `userSubscriptionHistory` | `adminProtect` |
| GET | `/api/admin/cancelSubscriptionList` | `cancelSubscriptionList` | `adminProtect` |
| GET | `/api/admin/exportUserSubscriptionHistory` | `exportUserSubscriptionHistory` | `adminProtect` |
| GET | `/api/admin/exportCancelSubscriptionList` | `exportCancelSubscriptionList` | `adminProtect` |

### Offers, dashboard, causes

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| GET | `/api/admin/getOffer` | `getOffer` | `adminProtect` |
| POST | `/api/admin/createOffer` | `createOffer` | `adminProtect` (multipart) |
| PUT | `/api/admin/editOffer/:id` | `editOffer` | `adminProtect` (multipart) |
| DELETE | `/api/admin/deleteOffer/:id` | `deleteOffer` | `adminProtect` |
| GET | `/api/admin/dashboard` | `dashboardAdmin` | `adminProtect` |
| POST | `/api/admin/createCause` | `createCause` | `adminProtect` (multipart) |
| PUT | `/api/admin/editCause/:id` | `editCause` | `adminProtect` (multipart) |
| GET | `/api/admin/getCause` | `getCause` | `adminProtect` |
| DELETE | `/api/admin/deleteCause/:id` | `deleteCause` | `adminProtect` |
| GET | `/api/admin/exportCauseList` | `exportCauseList` | `adminProtect` |
| GET | `/api/admin/causeContributorsHistory` | `causeContributorsHistory` | `adminProtect` |
| GET | `/api/admin/causeDonatorsHistory` | `causeDonatorsHistory` | `adminProtect` |
| GET | `/api/admin/exportCauseContributorsHistory` | `exportCauseContributorsHistory` | `adminProtect` |
| GET | `/api/admin/exportCauseDonatorsHistory` | `exportCauseDonatorsHistory` | `adminProtect` |
| GET | `/api/admin/getCauseId` | `getCauseId` | `adminProtect` |

### FAQ (admin)

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/updateFaqContent` | `createAndEditFaqContent` | `adminProtect` |
| GET | `/api/admin/getFaqContent/:id` | `getFaqContent` | `adminProtect` |
| POST | `/api/admin/createFaqMenu` | `createFaqMenu` | `adminProtect` |
| PUT | `/api/admin/editFaqMenu/:id` | `editFaqMenu` | `adminProtect` |
| DELETE | `/api/admin/deleteFaqMenu/:id` | `deleteFaqMenu` | `adminProtect` |
| GET | `/api/admin/getFaqMenuList/:id` | `getFaqMenuList` | `adminProtect` |
| GET | `/api/admin/getBadgeId` | `getBadgeId` | `adminProtect` |

### Notifications

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/sendNotificationAll` | `sendNotificationAll` | `adminProtect` |
| GET | `/api/admin/userNotification` | `userNotification` | `adminProtect` |
| GET | `/api/admin/getNotificationList` | `getNotificationList` | `adminProtect` |
| GET | `/api/admin/getScheduleNotificationList` | `getScheduleNotificationList` | `adminProtect` |
| PUT | `/api/admin/updateScheduleNotification/:id` | `updateScheduleNotification` | `adminProtect` |
| DELETE | `/api/admin/deleteScheduleNotification/:id` | `deleteScheduleNotification` | `adminProtect` |

### Coins and badges

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/createCoin` | `createCoin` | `adminProtect` (multipart) |
| PUT | `/api/admin/editCoin/:id` | `editCoin` | `adminProtect` (multipart) |
| GET | `/api/admin/getCoin` | `getCoin` | `adminProtect` |
| DELETE | `/api/admin/deleteCoin/:id` | `deleteCoin` | `adminProtect` |
| POST | `/api/admin/createBadge` | `createBadge` | `adminProtect` (multipart) |
| PUT | `/api/admin/editBadge/:id` | `editBadge` | `adminProtect` (multipart) |
| GET | `/api/admin/getBadge` | `getBadge` | `adminProtect` |
| DELETE | `/api/admin/deleteBadge/:id` | `deleteBadge` | `adminProtect` |

### Training videos, transactions, activity config

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/createTrainingVideos` | `createTrainingVideos` | `adminProtect` |
| PUT | `/api/admin/updateTrainingVideos/:id` | `updateTrainingVideos` | `adminProtect` |
| GET | `/api/admin/getTrainingVideos` | `getTrainingVideos` | `adminProtect` |
| DELETE | `/api/admin/deleteTrainingVideos/:id` | `deleteTrainingVideos` | `adminProtect` |
| GET | `/api/admin/getTransactionList` | `getTransactionList` | `adminProtect` |
| GET | `/api/admin/getTransactionFaliedList` | `getTransactionFaliedList` | `adminProtect` |
| GET | `/api/admin/exportTransactionData` | `exportTransactionData` | `adminProtect` |
| POST | `/api/admin/createActivityConfiguration` | `createActivityConfiguration` | `adminProtect` |
| GET | `/api/admin/getActivityConfiguration` | `getActivityConfiguration` | `adminProtect` |
| PUT | `/api/admin/updateActivityConfiguration/:id` | `updateActivityConfiguration` | `adminProtect` |
| DELETE | `/api/admin/deleteActivityConfiguration/:id` | `deleteActivityConfiguration` | `adminProtect` |
| GET | `/api/admin/userActivities` | `userActivities` | `adminProtect` |
| GET | `/api/admin/exportUserActivities` | `exportUserActivities` | `adminProtect` |

### Advertisement video, imports, app version

| Method | Path | Handler | Auth |
|--------|------|---------|------|
| POST | `/api/admin/addVideoUrl` | `addVideoUrl` | `adminProtect` (multipart) |
| GET | `/api/admin/getAdvertisementUrl` | `getAdvertisementUrl` | `adminProtect` |
| PUT | `/api/admin/updateVideoUrl/:id` | `updateVideoUrl` | `adminProtect` (multipart) |
| DELETE | `/api/admin/deleteVideoUrl/:id` | `deleteVideoUrl` | `adminProtect` |
| POST | `/api/admin/uploadExcel` | `uploadExcel` | `adminProtect` (multipart) |
| POST | `/api/admin/createAppVersion` | `createAppVersion` | `adminProtect` |
| PUT | `/api/admin/editAppVersion/:id` | `editAppVersion` | `adminProtect` |
| GET | `/api/admin/getAppVersion` | `getAppVersion` | `adminProtect` |
| DELETE | `/api/admin/deleteAppVersion/:id` | `deleteAppVersion` | `adminProtect` |

---

## Controller without HTTP route module

| File | Role |
|------|------|
| `src/controllers/cronjobs.controller.js` | Loaded from `index.js` for scheduled / background jobs; **not** mounted as REST routes in `service.route.js`. |

---

## Other notes

- Requests under `/api` pass through `controllerRequestLogger` (`src/middleware/controllerRequestLogger.js`) before reaching route handlers.
- Any path outside `/api` returns **405** from `src/routes/index.route.js`.
