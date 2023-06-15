const { initializeApp, applicationDefault } = require('firebase-admin/app');
const { getAuth } = require('firebase-admin/auth');

// need to supply SDK with service count credentials
// follow instructions here to set required variables:
// https://firebase.google.com/docs/admin/setup/#initialize_the_sdk_in_non-google_environments
// FOLLOW THESE INSTRUCTIONS IN THE SAME TERMINAL THAT IS RUNNING YOUR SERVER OR IT WILL NOT WORK!
const adminConfig = {
  credential: applicationDefault(),
};
const admin = initializeApp(adminConfig);
const auth = getAuth(admin);

const validateFirebaseIdToken = async (req, res, next) => {
  console.log('Checking if request is authorized with Firebase');

  if ((!req.headers.authorization || !req.headers.authorization.startsWith('Bearer '))) {
    console.log(
      'No Firebase ID token was passed as a Bearer Token in the Authorization header',
      'Make sure you\'re sending your request with the appropriate headers',
    );
    res.status(403).send('Unauthorized');
    return;
  }

  let idToken;
  if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
    console.log('Found Authorization Header');
    [, idToken] = req.headers.authorization.split('Bearer ');
  } else {
    res.status(403).send('Unauthorized');
    return;
  }

  try {
    const decodedToken = await auth.verifyIdToken(idToken);
    // const user = await auth.getUser(decodedToken.uid);
    console.log('ID token successfully decoded:', decodedToken);
    // console.log('User information: ', user);
    req.user = decodedToken;
    next();
  } catch (err) {
    console.log('Error while verifying ID token:', err);
    res.status(403).send('Unauthorized');
  }
};

module.exports = validateFirebaseIdToken;
