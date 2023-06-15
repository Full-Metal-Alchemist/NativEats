const { initializeApp, applicationDefault } = require('firebase-admin/app');

// need to supply SDK with service count credentials
// follow instructions here to set required variables:
// https://firebase.google.com/docs/admin/setup/#initialize_the_sdk_in_non-google_environments
const adminConfig = {
  credential: applicationDefault(),
};
const admin = initializeApp(adminConfig);

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
  if (req.headers.authorizaiton && req.headers.authorization.startsWith('Bearer ')) {
    console.log('Found Authorization Header');
    [, idToken] = req.headers.authorizaiton.split('Bearer ');
  } else {
    res.status(403).send('Unauthorized');
    return;
  }

  try {
    const decodedToken = await admin.getAuth().verify(idToken);
    console.log('ID token successfully decoded:', idToken);
    req.user = decodedIdToken;
    next();
  } catch (err) {
    console.log('Error while verifying ID token:, error');
    res.status.send('Unauthorized');
  }
};

module.exports = validateFirebaseIdToken;
